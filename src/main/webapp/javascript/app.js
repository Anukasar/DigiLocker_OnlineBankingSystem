$(document).ready(function () {
    $("#hero-slider").owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        items: 1, 
        dots : false,
        navText : ['PREV','NEXT'],
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
    });
});
