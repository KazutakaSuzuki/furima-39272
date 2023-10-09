window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
const addTax = document.getElementById("add-tax-price");
addTax.innerHTML = (Math.floor(inputValue*0.1));

const myProfit = document.getElementById("profit");
const taxValue = inputValue*0.1
myProfit.innerHTML = (Math.floor(inputValue - taxValue));
})});


