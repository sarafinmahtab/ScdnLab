package com.sust.scdnlab;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AchievementListQuery {
	
	private ConnectionCheck connectionCheck;
	private List<Achievement> achievementList;

	public AchievementListQuery() {
		connectionCheck = new ConnectionCheck();
		System.out.println("AchievementListQuery constructor");
		achievementList = new ArrayList<>();
	}
	
	public List<Achievement> getAcheivementList() {
		
		String sql = "SELECT * FROM `achievement`";
		
		Connection connection = connectionCheck.getConnection();		
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		
		try {			
			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, userName);
//			preparedStatement.setString(2, passWord);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				Achievement achievement = new Achievement();
				
				achievement.setAchievementId(resultSet.getInt(1));
				achievement.setAchievementTitle(resultSet.getString(2));
				achievement.setAchievementDetails(resultSet.getString(3));
				achievement.setImagePath(resultSet.getString(4));
				achievement.setPostTimeStamp(resultSet.getTimestamp(5));
				
				achievementList.add(achievement);
			}
			connection.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return achievementList;
	}
}
