package com.sust.scdnlab;

import java.sql.Timestamp;

public class Achievement {
	
	private int achievementId;
	private String achievementTitle;
	private String achievementDetails;
    private String imagePath;
    private Timestamp postTimeStamp;

	public int getAchievementId() {
		return achievementId;
	}
	
	public void setAchievementId(int achievementId) {
		this.achievementId = achievementId;
	}
	
	public String getAchievementTitle() {
		return achievementTitle;
	}
	
	public void setAchievementTitle(String achievementTitle) {
		this.achievementTitle = achievementTitle;
	}

	public String getAchievementDetails() {
		return achievementDetails;
	}
	
	public void setAchievementDetails(String achievementDetails) {
		this.achievementDetails = achievementDetails;
	}

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Timestamp getPostTimeStamp() {
        return postTimeStamp;
    }

    public void setPostTimeStamp(Timestamp postTimeStamp) {
        this.postTimeStamp = postTimeStamp;
    }
}
