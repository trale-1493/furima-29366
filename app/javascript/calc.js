function calc() {
  const value_input = document.getElementById("item-price");
  value_input.addEventListener("input", function(){
    const tax_output = document.getElementById("add-tax-price");
    const profit_output = document.getElementById("profit");
     
    var price = Math.floor(this.value);
    var tax = Math.floor(price * 0.1);
    var profit = price - tax;

    tax_output.innerHTML = tax
    profit_output.innerHTML = profit
  });
}
window.addEventListener("DOMContentLoaded", calc)
