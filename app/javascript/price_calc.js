const priceCalc = () => {
  // リスナーをセットする価格フォーム要素を取得
  const priceForm = document.getElementById("item_price");
  // 手数料、利益を表示する要素を取得
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  // 入力された値が数値か判定する正規表現
  const re = new RegExp(/^[0-9]+$/);
  // フォームにリスナーをセット
  priceForm.addEventListener("input", (e) => {
    const formResult = document.getElementById("item-form");
    const formData = new FormData(formResult);
    const price = formData.get("item[price]");
    if (price.match(re)){
      addTaxPrice.innerHTML = `${Math.floor(price * 0.1)}`;
      profit.innerHTML = `${Math.floor(price * 0.9)}`;
    } else {
      addTaxPrice.innerHTML = "半角数字のみ入力可能";
      profit.innerHTML = "半角数字のみ入力可能";
    }
  });
};

window.addEventListener("load", priceCalc)