// $(document).on('turbolinks:load', function() {
//   //エラーフラグ
//   var error_flag = true
//   //空データチェック
//   function inputCheck(targetInput, error_text, error_msg){
//     //入力項目のチェック
//     if($(targetInput).val() == ""){
//       //枠線を赤枠で表示
//       $(targetInput).css('border-color', 'red');
//       $(error_text).text(error_msg);
//       $(err_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
//       error_flag = false;
//     }else{
//       //入力項目が正しければ元に戻す（訂正後のエラー表示用）
//       $(targetInput).css('border', '1px solid #ccc')
//       $(error_text).text("");
//     }
//   }
//   function inputDataAllCheck(){
//     inputCheck("#item_name", "error__item-name", "商品名を入力してください")
//     inputCheck("#item_description", "error__item-description", "商品の詳細を入力してください")
//     inputCheck("#third-category-input", "error__item-category", "カテゴリーを正しく選択してください")
//     inputCheck("#item_condition", "error__item-condition", "商品の状態を選択してください")
//   }
//   $(".sell__btn--red").on('click', function(e){
//     // inputDataAllCheck();
//     error_flag = false
//     if(error_flag){
//       $('form').submit();
//       console.log("success")
//     }else{
//       alert("入力項目に不備があります。ご確認ください。")
//       console.log("fail")
//     }
//   })
// });