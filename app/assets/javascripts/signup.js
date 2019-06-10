$(document).on('turbolinks:load', function() {
    // ***入力チェック用関数***
    function input_check(err_border, err_text, err_msg){
      if($(err_border).val() == ""){
        // 入力メッセージの枠を赤色に
        $(err_border).css('border-color','red');
        // エラーメッセージを赤色で表示
        $(err_text).text(err_msg);
        $(err_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
      }else{
        $(err_border).css('border-color','');
        $(err_text).text("");
      }
    }
    // 会員情報入力画面
    $(".form-content__bottom--button").click(function(){
      input_check("#nickname",'.err_nickname',"ニックネーム を入力してください" );
      input_check("#email",'.err_email',"入力してください" );
      input_check("#password",'.err_password',"入力してください" );
      input_check("#password_confirmation",'.err_password_confirmation',"パスワード (確認) を入力してください" );
      input_check("#last_name",'.err_last_name',"姓 を入力してください" );
      input_check("#first_name",'.err_first_name',"名 を入力してください" );
      input_check("#last_name_kana",'.err_last_name_kana',"姓カナ を入力してください" );
      input_check("#first_name_kana",'.err_first_name_kana',"名カナ を入力してください" );
      if($("#birth_year").val() == "" || $("#birth_month").val() == "" || $("#birth_day").val() == ""){
        // エラーメッセージを赤色で表示
        $(".err_birthday").text("生年月日 を入力してください");
        $(".err_birthday").css({'color':'red','font-size':'14px','margin-top':'8px'});
      }else{
        $(".err_birthday").text("");
      }    
    });
    // 電話番号認証画面
    $(".number-container__inner__number-box__number-btn").click(function(){
      input_check("#cell_phone",'.err_phone',"携帯電話の番号 を入力してください" );
    })
    // 住所入力画面
    $(".address-btn").click(function(){
      input_check("#addr_last_name",'.err_last_name',"姓 を入力してください");
      input_check("#addr_first_name",'.err_first_name',"名 を入力してください");
      input_check("#addr_last_name_kana",'.err_last_name_kana',"姓（カナ） を入力してください");
      input_check("#addr_first_name_kana",'.err_first_name_kana',"名（カナ） を入力してください");
      input_check("#postal_code",'.err_postal_code',"郵便番号 を入力してください");
      input_check("#municipalities",'.err_municipalities',"市長村 を入力してください");
      input_check("#address_number",'.err_address_number',"番地 を入力してください");
    });
    // クレジットカード入力画面
    $(".btn-red").click(function(){
      input_check("#pay-card-no",'.err_credit-number',"必須項目です");
      input_check("#pay-card-seq-code",'.err_sec-code',"必須項目です");
    });
  });