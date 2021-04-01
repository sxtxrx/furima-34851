const pay = () => {
  Payjp.setPublicKey("pk_test_eaa929b2102fb5e94e6236a5"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_history[number]"),
      cvc: formData.get("order_history[cvc]"),
      exp_month: formData.get("order_history[exp_month]"),
      exp_year: `20${formData.get("order_history[exp_year]")}`,
    };
    console.log(card);


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
  
        document.getElementById("charge-form").submit();



    });


    
  });
};

window.addEventListener("load", pay);