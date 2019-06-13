$(document).on('turbolinks:load', function() {
  //価格表示
  function displayFee(){
    var input = $("#fee-input").val();
    //300円以上9,999,999円以下の場合のみ表示
    if(300 <= input &&  input <= 9999999){
      //販売手数料
      var handlingFee = Math.floor(input/10);
      //販売利益
      var profit = (input - handlingFee);
      //カンマ区切り
      handlingFee = "¥" + handlingFee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
      profit = "¥" + profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
      //表示
      $("#handling-fee__input").text(handlingFee); 
      $("#profit__input").text(profit);
    }
    else{
    }
  }
  function getChildren(value){
    $.ajax({
      type: 'GET',
      url:  '/categories/shiblings',
      data: {id: value},
      dataType: 'json',
    })
    .done(function(shiblings){
      $('#second-category-input').empty();
    })
  }
  
  function getAncestor(value){
    $.ajax({
      type: 'GET',
      url: `/categories/ancestors/`,
      data: {id: value},
      dataType: 'json',
    })
    .done(function(ancestors) {
      if(ancestors.length !== 0){
        switch(ancestors.length){
          case 1:
            break;
          case 2:
            $("#first-category-input").val(ancestors[0].id);
            $("#second-category-input").val(ancestors[1].id);
            break;
        }
      }
    })
    .fail(function() {
      console.log('error');
    });
  };
  //edit画面読み込み時の処理
  window.onload = function(){
    //商品編集ページのみ発火
    if(document.URL.match(/^(?=.*items)(?=.*edit)/)){
      //カテゴリー処理
      let categoryId = $("#third-category-input").val();
      getAncestor(categoryId);
      //画像表示処理
      displayFee()
    }
  }
});