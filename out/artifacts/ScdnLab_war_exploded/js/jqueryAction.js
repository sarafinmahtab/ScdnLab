/**
 * 
 */

$(document).ready(function() {

    $.ajax({
        type : "POST",
        url : "achievementListServlet",
        /*	data : "name=" + name + "&email=" + email, */
        dataType: 'json',
        success : function(msg) {

            for (var index = 0; index < 3; index++) {

                var id = msg[index].achievementId;
                var title = msg[index].achievementTitle;
                var details = msg[index].achievementDetails;
                var imagePath = msg[index].imagePath;
                var postTime = msg[index].postTimeStamp;

                console.log(id + " : " + title);

                var viewId = index + 1;

                $('#achieveHeader'+viewId).html("<b>" +title + "</b>");
                $('#achievePara'+viewId).text(details);
            }
        },
        error : function(msg) {
            alert("Error " + msg);
        }
    });
});
