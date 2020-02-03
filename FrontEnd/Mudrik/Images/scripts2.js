$(document).ready(function () {
    $("#login").click(function (event) {
        event.preventDefault();
        var userno = $("#UserNo").val();
        var datedue = $("#DateDue").val();
        var bookno = $("#BookNo").val();
        var author = $("#Author").val();
        var booktitle = $("#BookTitle").val();
        var pubdate = $("#PubDate").val();
        $("#issue_details-right").html(userno + "<br>" + datedue + "<br>" + bookno + "<br>" + author + "<br>" + booktitle + "<br>" + pubdate);
    });

    /* Animations */
    $("p, h1, h2, h3, h4, a, img, form, button").hide().fadeIn(2000);
});