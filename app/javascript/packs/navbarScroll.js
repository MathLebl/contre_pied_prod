// window.onscroll = function() {scrollFunction()};
const navbar = document.querySelector(".navbar");
const titre = navbar.querySelector("h4");
const links = navbar.querySelectorAll(".nav-link");


const scrollCondition = (e) => {
  if (window.scrollY > 400) {
    navbar.classList.add('navbar-yellow')
  } else {
    navbar.classList.remove('navbar-yellow')
  }
}

const initNavbar = () => {
  document.addEventListener('scroll', scrollCondition)
}
initNavbar()
