const buttons = document.querySelectorAll('.info-list > li > button')
const commentsBlocks = document.querySelectorAll('.info-text')
const toggleBtn = () => {
  buttons.forEach((button, index) => {
    document.addEventListener('click', (e) => {
      if (e.target === button) {
        commentsBlocks[index].classList.toggle("hidden");
      } else {
        commentsBlocks[index].classList.add("hidden");
      }
    });
  });
};
export { toggleBtn };
