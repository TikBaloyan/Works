var i = 0;
var t;

function slideshow() {
    var images = ["slide1.png", "slide2.jpg", "slide3.jpg", "slide4.jpg", "slide5.jpg",
        "slide6.jpg", "slide7.jpg", "slide8.png", "slide9.png"];
    document.getElementById("slideimg").src = "images/main/slide/" + images[i];
    i++;
    t = setTimeout("slideshow()", 2000);
    if (i === images.length) {
        i = 0;
    }
}