window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  
const addTax = document.getElementById("add-tax-price");
addTax.innerHTML = (Math.floor(inputValue*0.1));
  console.log(addTax);

const myProfit = document.getElementById("profit");
const taxValue = inputValue*0.1
  console.log(taxValue)
myProfit.innerHTML = (Math.floor(inputValue - taxValue));
  console.log(myProfit);
})});


