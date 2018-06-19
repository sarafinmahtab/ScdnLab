/**
 * 
 */

$(document).ready(function() {

    /* Document on Load */

    var $pagination = $('#pagination-achieve-list');
    var defaultOpts = {
        totalPages: 1,

        // the current page that show on start
        startPage: 1,

// maximum visible pages
        visiblePages: 1,

        initiateStartPageClick: true,

// template for pagination links
        href: false,

// variable name in href template for page number
        hrefVariable: '{{number}}',

// Text labels
        first: '←',
        prev: '«',
        next: '»',
        last: '→',

// carousel-style pagination
        loop: false,

        // callback function
        onPageClick: function (event, page) {


        },
        // pagination Classes
        paginationClass: 'pagination',
        nextClass: 'next',
        prevClass: 'prev',
        lastClass: 'last',
        firstClass: 'first',
        pageClass: 'page',
        activeClass: 'active',
        disabledClass: 'disabled'

    };
    $pagination.twbsPagination(defaultOpts);

    $.ajax({
        type : "POST",
        url : "achievementListServlet",
        /*	data : "name=" + name + "&email=" + email, */
        dataType: 'json',
        success : function(msg) {
            alert("Success " + msg);
            console.log("Showing JSON");

            $pagination.twbsPagination('destroy');

            $pagination.twbsPagination($.extend({}, defaultOpts, {

                totalPages: Math.abs(msg.length/3 + (msg.length%3)/3) + 1,

                visiblePages: 3,

                onPageClick: function (event, page) {

                    console.log(page);

                    for (var viewId = 1; viewId <= 3; viewId++) {

                        var index = 3 * (page-1) + viewId - 1;

                        var id = msg[index].achievementId;
                        var title = msg[index].achievementTitle;
                        var details = msg[index].achievementDetails;
                        var imagePath = msg[index].imagePath;
                        var postTime = msg[index].postTimeStamp;

                        console.log(id + " : " + title);

                        $('#achieveHeader'+viewId).html("<b>" +title + "</b>");
                        $('#achievePara'+viewId).text(details);
                    }
                }
            }));
/*
            for (var index = 0; index < msg.length; index++) {
                var id = msg[index].achievementId;
                var title = msg[index].achievementTitle;
                var details = msg[index].achievementDetails;
                var imagePath = msg[index].imagePath;
                var postTime = msg[index].postTimeStamp;

                console.log("Id: " + id);
                console.log("Title: " + title);
                console.log("Image Path: " + imagePath);
                console.log("Details: " + details);
                console.log("Post Time: " + postTime);
            } */
        },
        error : function(msg) {
            alert("Error " + msg);
        }
    });

    /*
    $('#myCarousel').click(function (event) {
        $.ajax({
            type : "POST",
            url : "achievementListServlet",
            /*	data : "name=" + name + "&email=" + email,
            dataType: 'json',
            success : function(msg) {
                alert("After click Success " + msg);
            },
            error : function(msg) {
                alert("After click Error " + msg);
            }
        });
    });
    */

});
