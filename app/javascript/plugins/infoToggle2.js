const buttonDrop = document.getElementById('dropdown-btn');
const DropDownBlock = document.getElementById('dropdown-block');
console.log(buttonDrop);
console.log(DropDownBlock);
const toggleNav = () => {
  buttonDrop.addEventListener('click', () => {
    DropDownBlock.classList.toggle('is-visible');
  });
};
export { toggleNav };
