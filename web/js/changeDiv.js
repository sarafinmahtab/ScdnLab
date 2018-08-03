
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
                var imagePath = "Image";
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


                    tr.appendChild(btnEdit);
                    var btnText = doc.createTextNode("Edit/Delete");
                    btnEdit.setAttribute("achieve_id", id);
                    btnEdit.appendChild(btnText);
                    btnEdit.onclick = function() {
                        alert(this.getAttribute("achieve_id"));
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
