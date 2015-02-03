
// show on scroll
$(window).scroll(function() {
    $("img").each( function() {
        if( $(window).scrollTop() > $(this).offset().top - 370) {
            $(this).css('opacity', 1);
        } else {
            $(this).css('opacity', 0);
        }
    });
});
