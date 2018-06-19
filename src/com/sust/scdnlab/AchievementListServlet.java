package com.sust.scdnlab;

import com.google.gson.Gson;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "achievementListServlet", urlPatterns = {"achievementListServlet"})
public class AchievementListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        AchievementListQuery achievementListQuery = new AchievementListQuery();

        List<Achievement> achievementList = achievementListQuery.getAcheivementList();

        String jsonStr = new Gson().toJson(achievementList);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonStr);

        System.out.println("JSON Data: " + jsonStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
