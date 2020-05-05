window.onscroll = function() {scrollFunction()};
function scrollFunction() {
  if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
    document.querySelector(".navbar").style.backgroundColor = "#DBD5CD";
  } else {
    document.querySelector(".navbar").style.backgroundColor = "transparent";
  }
}

