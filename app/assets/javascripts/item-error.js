$(document).on('turbolinks:load', function() {
  //エラーフラグ
  var error_flag = true

  //空データチェック
  function inputCheck(targetInput, error_text, error_msg){
    //入力項目のチェック
    if($(targetInput).val() == ""){
      //枠線を赤枠で表示
      $(error_text).text(error_msg);
      $(error_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
      error_flag = false;
    }else{
      //入力項目が正しければ元に戻す（訂正後のエラー表示用）
      $(error_text).text("");
    }
  }
  //価格チェック
  function inputFeeCheck(targetInput, error_text, error_msg){
    //入力された価格が範囲内かチェック
    let fee = $(targetInput).val()
    if(fee < 300 || fee >= 9999999){
      $(error_text).text(error_msg);
      $(error_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
      error_flag = false;
    }else{
      //入力項目が正しければ元に戻す（訂正後のエラー表示用）
      $(error_text).text("");
    }
  }
  //画像チェック
  function inputImagesCheck(target, error_text, error_msg){
    //ul要素
    let ulElement = document.getElementById(target);
    //子要素の数を取得
    let childElementCount = ulElement.childElementCount;
    if(!childElementCount){
      $(error_text).text(error_msg);
      $(error_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
      error_flag = false;
    }else{
      //入力項目が正しければ元に戻す（訂正後のエラー表示用）
      $(error_text).text("");
    }
  }
  //全入力項目チェック
  function inputDataAllCheck(){
    error_flag = true
    inputCheck("#item_name", ".error__item-name", "商品名を入力してください")
    inputCheck("#item_description", ".error__item-description", "商品の詳細を入力してください")
    inputCheck("#third-category-input", ".error__item-category", "カテゴリーを正しく選択してください")
    inputCheck("#item_condition", ".error__item-condition", "商品の状態を選択してください")
    inputCheck("#item_shipping_fee", ".error__item-shipping_fee", "配送料の負担を選択してください")
    inputCheck("#item_delivery", ".error__item-delivery", "配送の方法を選択してください")
    inputCheck("#item_prefecture", ".error__item-prefecture", "発送元の地域を選択してください")
    inputCheck("#item_days", ".error__item-days", "発送までの日数を選択してください")
    inputFeeCheck("#fee-input", ".error__item-fee", "価格を300円以上9999999円以下で入力してください")
    inputImagesCheck("sell-upload__images-0", ".error__item-images", "画像を選択してください")
  }
  $(".sell__btn--red").on('click', function(e){
    inputDataAllCheck();
    if(error_flag){
      $('form').submit();
    }else{
      alert("入力項目に不備があります。ご確認ください。")
    }
  })
});