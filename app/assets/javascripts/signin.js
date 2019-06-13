$(document).on('turbolinks:load', function() {
  // ***入力チェック用関数***
  function input_check_login(err_border, err_text, err_msg){
    if($(err_border).val() == ""){
      // 入力メッセージの枠を赤色に
      $(err_border).css('border-color','red');
      // エラーメッセージを赤色で表示
      $(err_text).text(err_msg);
      $(err_text).css({'padding-right':'220px','color':'red','font-size':'14px','margin-top':'8px'});
    }else{
      $(err_border).css('border-color','');
      $(err_text).text("");
    }
  }
  // ログイン画面
  $(".form__btn").click(function(){
    input_check_login(".form__box--input-email",'.err_email-login',"入力してください" );
    input_check_login(".form__box--input-password",'.err_password-login',"入力してください" );
  });
});