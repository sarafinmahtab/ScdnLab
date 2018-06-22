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

            var lastPageNo = Math.floor(msg.length/3) + Math.ceil((msg.length%3)/3);
            console.log("Total Pages in Pagination : " + lastPageNo);

            $pagination.twbsPagination('destroy');

            $pagination.twbsPagination($.extend({}, defaultOpts, {

                totalPages: lastPageNo,

                visiblePages: 3,

                onPageClick: function (event, page) {

                    console.log(page);

                    for (var viewId = 1; viewId <= 3; viewId++) {

                        if (page === lastPageNo && msg.length%3 !== 0) {
                            break;
                        }

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

                    if (page === lastPageNo && msg.length%3 !== 0) {

                        console.log("Last Page. Mode not zero");

                        var indexTemp = msg.length - 3;

                        for (var viewIdIf = 1; viewIdIf <= 3; viewIdIf++) {

                            var indexIf = indexTemp + viewIdIf - 1;

                            var idIf = msg[indexIf].achievementId;
                            var titleIf = msg[indexIf].achievementTitle;
                            var detailsIf = msg[indexIf].achievementDetails;
                            var imagePathIf = msg[indexIf].imagePath;
                            var postTimeIf = msg[indexIf].postTimeStamp;

                            console.log(idIf + " : " + titleIf);

                            $('#achieveHeader'+viewIdIf).html("<b>" +titleIf + "</b>");
                            $('#achievePara'+viewIdIf).text(detailsIf);
                        }
                    }
                }
            }));
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
