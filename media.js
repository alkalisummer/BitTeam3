const animalList = document.querySelector(".animalList");
const animals = document.querySelectorAll(".animal");
const animalBox = document.querySelector("#animalBox");



function init() {
  let dragged;
  animals.forEach(animal.addEventListener("drag", function (event) {
    dragged = event.target.id;
  }));
  animalBox.addEventListener("drop", function (event) {
    event.preventDefault();
    event.target.id = dragged;
  })
}

init();