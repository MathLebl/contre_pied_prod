const buttons = document.querySelectorAll('.info-list > li > button')
const commentsBlocks = document.querySelectorAll('.info-list > li > p')

buttons.forEach((button, index) => {
  const commentsBlock = commentsBlocks[index];
  button.addEventListener('click', () => {
    commentsBlock.classList.toggle('is-visible');
  });
});
