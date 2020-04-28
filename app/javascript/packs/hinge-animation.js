const jeunePublicHinge = () => {

  const jeunePublicLink = document.querySelector('#jeunePublic');
jeunePublicLink.addEventListener("click", (event) => {
  console.log(toto)
  event.classList.add("animated hinge");
});

}

export { jeunePublicHinge }
