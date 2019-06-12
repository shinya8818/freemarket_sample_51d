$(document).on('turbolinks:load', function() {
  function getChildren(value){
    $.ajax({
      type: 'GET',
      url:  '/categories/shiblings',
      data: {id: value},
      dataType: 'json',
    })
    .done(function(shiblings){
      console.log(shiblings);
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
        console.log(ancestors.length)
        switch(ancestors.length){
          case 1:
            console.log(ancestors[0][name])
            break;
          case 2:
            console.log(ancestors[0].id)
            console.log(ancestors[1].name)
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
    }
  }
});