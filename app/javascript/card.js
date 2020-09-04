const pay = () => {
  Payjp.setPublicKey("pk_test_3f8d9beaa5352bcafd83bb2c");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase[number]"),
      exp_month: formData.get("purchase[exp_month]"),
      exp_year: `20${formData.get("purchase[exp_year]")}`,
      cvc: formData.get("purchase[cvc]"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);