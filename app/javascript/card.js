const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //Pay.JPテスト公開鍵 PAYJP_PUBLIC_KEY
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_delivery[number]"),
      cvc: formData.get("order_delivery[cvc]"),
      exp_month: formData.get("order_delivery[exp_month]"),
      exp_year: `20${formData.get("order_delivery[exp_year]")}`, //頭に20を付けている
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        
        // const renderDom = document.getElementById("charge-form");
        // const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        // renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // document.getElementById("order_number").removeAttribute("name");
      // document.getElementById("order_cvc").removeAttribute("name");
      // document.getElementById("order_exp_month").removeAttribute("name");
      // document.getElementById("order_exp_year").removeAttribute("name");

      // document.getElementById("charge-form").submit();
    });

  })
};

window.addEventListener("load",pay);