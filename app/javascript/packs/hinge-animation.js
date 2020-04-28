const jeunPubliqueHinge = () => {

  const jeunePubliqueLink = document.querySelector('#jeunePublique');
jeunePubliqueLink.addEventListener("click", (event) => {
  console.log(toto)
  event.classList.add("animated hinge");
});

}

export { jeunPubliqueHinge }
