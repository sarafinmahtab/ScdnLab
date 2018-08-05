<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Arafin
  Date: 04-Aug-18
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script language="javascript" type="text/javascript">

    function success() {

    }

</script>

<%
    ResultSet resultSet;

    try {

        String achieveId = request.getParameter("achieve_id");
        String achieveTitle = request.getParameter("achieve_title");
        String achieveDetails = request.getParameter("achieve_details");
        String achieveLink = request.getParameter("achieve_path");

        System.out.println(achieveId);
        System.out.println(achieveTitle);
        System.out.println(achieveDetails);
        System.out.println(achieveLink);

        String sql =
                "UPDATE `achievement` SET `achievement_title` = ?, `achievement_details`= ?, `image_path` = ? WHERE `achievement_id` = ?;";

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/scdn_lab", "root", "");

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, achieveTitle);
        ps.setString(2, achieveDetails);
        ps.setString(3, achieveLink);
        ps.setString(4, achieveId);

        int update = ps.executeUpdate();

        System.out.println(update);

        if (update > 0) {
            response.getWriter().print("Success");
            response.sendRedirect("dragon.jsp");
        } else {
            response.getWriter().print("Failed");
            response.sendRedirect("dragon.jsp");
        }

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
    }
%>

</body>
</html>
