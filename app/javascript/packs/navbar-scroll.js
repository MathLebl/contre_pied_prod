window.onscroll = function() {scrollFunction()};
var navbar = document.querySelector(".navbar");
var titre = navbar.querySelector("h4");
var links = navbar.querySelectorAll(".nav-link");
console.log(links)
function scrollFunction() {
  if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
    navbar.style.backgroundColor = "#FFEE93";
    titre.style.color = "black";
    links.forEach((link) => {
      link.style.color = "black";
    });
  } else {
    navbar.style.backgroundColor = "transparent";
    titre.style.color = "#FFEE93";
    links.forEach((link) => {
      link.style.color = "#FFEE93";
    });
  }
}
