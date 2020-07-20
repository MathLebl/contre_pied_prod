const buttonDrop = document.getElementById('dropdown-btn');
const buttonDrop2 = buttonDrop.childNodes[1].childNodes[0];
const DropDownBlock = document.getElementById('dropdown-block');
console.log(buttonDrop2);

let isVisible = false;

const toggleNav = () => {
  document.addEventListener('click', (e) => {
    if (e.target === buttonDrop) {
      DropDownBlock.classList.toggle('is-visible');
    } else if (e.target === buttonDrop2) {
      DropDownBlock.classList.toggle('is-visible');
    } else {
      DropDownBlock.classList.remove('is-visible');
    }
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
