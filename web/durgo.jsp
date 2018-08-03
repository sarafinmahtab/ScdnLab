<%--
Created by IntelliJ IDEA.
User: Arafin
Date: 03-Aug-18
Time: 4:53 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--<%@ page import="java.sql.*" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>
<body>

<%@ include file="durgo.html" %>

<script language="javascript" type="text/javascript">

    function updateUserProfile(adminName, adminType, gmail) {
        document.getElementById("admin_name").innerHTML = adminName.toString();
        document.getElementById("sidebar_admin_name").innerHTML = adminName.toString();

        if (adminType === "Content Creator") {
            document.getElementById("role_manager").remove();
        }

        document.getElementById("admin_type").innerHTML = adminType.toString();
        document.getElementById("gmail").innerHTML = gmail.toString();
    }
</script>

<script type="text/javascript" src="js/changeDiv.js"></script>


<%
    if (session.getAttribute("admin_name") != null) {
        String adminName = session.getAttribute("admin_name").toString();
        String adminType = session.getAttribute("admin_type").toString();
        String gmail = session.getAttribute("gmail").toString();
%>

<script language="javascript" type="text/javascript">
    var adminName = "<%= adminName %>";
    var adminType = "<%= adminType %>";
    var gmail = "<%= gmail %>";

    updateUserProfile(adminName, adminType, gmail);
</script>
<%
    }
%>

</body>
</html>
