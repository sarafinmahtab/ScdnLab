<%--
  Created by IntelliJ IDEA.
  User: Arafin
  Date: 03-Aug-18
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Login Result</title>
</head>
<body>

<script language="javascript" type="text/javascript">

    function signInSuccess() {
        document.getElementById("page_manage").style.display = "none";
    }

</script>

<%
    ResultSet resultSet;
    if (request.getParameter("username") != null && request.getParameter("key") != null) {
        try {
            String dbUserName = null;
            String dbPassWord = null;
            String userName = request.getParameter("username");
            String passWord = request.getParameter("key");
            String sql = "SELECT * FROM `admin` WHERE `user_name` = ? AND `password` = ?;";

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/scdn_lab", "root", "");

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, passWord);
            resultSet = ps.executeQuery();

            while (resultSet.next()) {
                dbUserName = resultSet.getString("user_name");
                dbPassWord = resultSet.getString("password");

                session.setAttribute("admin_name", resultSet.getString("admin_name"));
                if (resultSet.getInt("admin_type") == 1) {
                    session.setAttribute("admin_type", "Super Admin");
                } else if (resultSet.getInt("admin_type") == 2) {
                    session.setAttribute("admin_type", "Content Creator");
                }
                session.setAttribute("gmail", resultSet.getString("gmail"));
            }

            if (userName.equals(dbUserName) && passWord.equals(dbPassWord)) {
%>
<script type="text/javascript">
    signInSuccess();
</script>
<%
                //                out.println("Login Successfull");
                response.sendRedirect("dragon.jsp");
            } else {
                session.setAttribute("login_failed", "Username or Password is incorrect");
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
%>

</body>
</html>
