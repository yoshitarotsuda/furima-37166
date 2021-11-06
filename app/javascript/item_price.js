//  一旦全ページで動いてしまうことは保留します

window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = inputValue * 0.1
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = inputValue * ( 1 - 0.1)
  })
});
