let one_btn = document.querySelector(".one_btn");
let one_table = document.querySelector(".one_table");

one_btn.addEventListener("click", () => {
    one_btn.classList.toggle("on");
    one_table.classList.toggle("on");
});

let two_btn = document.querySelector(".two_btn");
let two_table = document.querySelector(".two_table");

two_btn.addEventListener("click", () => {
    two_btn.classList.toggle("on");
    two_table.classList.toggle("on");
});
