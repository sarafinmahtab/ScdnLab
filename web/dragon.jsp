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

<%@ include file="dragon.html" %>

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

<script type="text/javascript">

    $(document).ready(function() {
        $('a[href="#achievement_item_on"]').click(function(){

            $('#page_header').text("Table of Achievements");

            $.ajax({
                type : "POST",
                url : "achievementListServlet",
                /*	data : "name=" + name + "&email=" + email, */
                dataType: 'json',
                success : function(msg) {

                    // var table = $('<table>').addClass('foo');

                    var id = "Id";
                    var title = "Title";
                    var details = "Details";
                    var imagePath = "ImageLink";
                    var postTime = "Posted";

                    var len = Object.keys(msg).length;

                    var doc = document;

                    var fragment = doc.createDocumentFragment();

                    var tr = doc.createElement("tr");

                    var thId = doc.createElement("th");
                    var thTitle = doc.createElement("th");
                    var thDetails = doc.createElement("th");
                    var thImagePath = doc.createElement("th");
                    var thPostTime = doc.createElement("th");
                    var thAction = doc.createElement("th");

                    thId.innerHTML = id;
                    tr.appendChild(thId);
                    thTitle.innerHTML = title;
                    tr.appendChild(thTitle);
                    thDetails.innerHTML = details;
                    tr.appendChild(thDetails);
                    thImagePath.innerHTML = imagePath;
                    tr.appendChild(thImagePath);
                    thPostTime.innerHTML = postTime;
                    tr.appendChild(thPostTime);
                    thAction.innerHTML = "Actions";
                    tr.appendChild(thAction);

                    //does not trigger reflow
                    fragment.appendChild(tr);

                    for (var index = 0; index < len; index++) {
                        tr = doc.createElement("tr");

                        id = msg[index].achievementId;
                        title = msg[index].achievementTitle;
                        details = msg[index].achievementDetails;
                        imagePath = msg[index].imagePath;
                        postTime = msg[index].postTimeStamp;

                        var tdId = doc.createElement("td");
                        var tdTitle = doc.createElement("td");
                        var tdDetails = doc.createElement("td");
                        var tdImagePath = doc.createElement("td");
                        var tdPostTime = doc.createElement("td");
                        var btnEdit = doc.createElement("BUTTON");

                        tdId.innerHTML = id;
                        tr.appendChild(tdId);
                        tdTitle.innerHTML = title;
                        tr.appendChild(tdTitle);
                        tdDetails.innerHTML = details;
                        tr.appendChild(tdDetails);
                        tdImagePath.innerHTML = imagePath;
                        tr.appendChild(tdImagePath);
                        tdPostTime.innerHTML = postTime;
                        tr.appendChild(tdPostTime);

                        // tdTitle.addEventListener("click", function(){
                        //     this.replaceWith("<input value='" +  + "'/>");
                        // });
                        //
                        // tdDetails.addEventListener("click", function(){
                        //     this.innerHTML = "hello";
                        // });

                        tr.appendChild(btnEdit);
                        var btnText = doc.createTextNode("Edit / Delete");
                        btnEdit.setAttribute("achieve_id", id);
                        btnEdit.setAttribute("achieve_title", title);
                        btnEdit.setAttribute("achieve_details", details);
                        btnEdit.setAttribute("achieve_path", imagePath);

                        btnEdit.appendChild(btnText);
                        btnEdit.onclick = function() {
                            // alert(this.getAttribute("achieve_id"));
                            doc.getElementById('updateAchieveDialog').style.display='block';

                            $("#formTitle").val(this.getAttribute("achieve_title"));
                            $("#formDetails").val(this.getAttribute("achieve_details"));
                            $("#formLink").val(this.getAttribute("achieve_path"));
                        };

                        //does not trigger reflow
                        fragment.appendChild(tr);
                    }

                    var table = doc.createElement("table");

                    table.appendChild(fragment);

                    doc.getElementById("add-new-content").appendChild(table);
                },
                error : function(msg) {
                    alert("Error " + msg);
                }
            });
        });
    });

</script>


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
