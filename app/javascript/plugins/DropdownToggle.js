const buttonDrop = document.getElementById('dropdown-btn');
const DropDownBlock = document.getElementById('dropdown-block');
console.log(buttonDrop);
console.log(DropDownBlock);

let isVisible = false;
console.log(isVisible)

const toggleNav = () => {
  buttonDrop.addEventListener('click', () => {
    isVisible = !isVisible;
    isVisible ? DropDownBlock.classList.add('is-visible') : DropDownBlock.classList.remove('is-visible');
  });
};
export { toggleNav };


// const toggleBtn = () => {
//   buttons.forEach((button, index) => {
//   const commentsBlock = commentsBlocks[index];
//   button.addEventListener('click', () => {
//     commentsBlock.classList.toggle('is-visible');
//   });
// });
// };
