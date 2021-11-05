//  一旦全ページで動いてしまうことは保留します

window.addEventListener('load',() => {
  // console.log("OK");
  const priceInput = document.getElementById("item-price");
  // console.log(priceInput);
  priceInput.addEventListener("input",() => {
    // console.log("イベント発火");
    const inputValue = priceInput.value;
    // console.log(inputValue)
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = inputValue * 0.1
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = inputValue * ( 1 - 0.1)
  })
});
