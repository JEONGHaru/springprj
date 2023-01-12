const myInput = document.querySelector('.myInput');
const myModal = document.getElementById('myModal');

myModal.addEventListener('shown.bs.modal', () => {
	myInput.focus()
})