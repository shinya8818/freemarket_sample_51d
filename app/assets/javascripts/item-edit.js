$(document).on('turbolinks:load', function() {
  function getAncestor(value){
    $.ajax({
      type: 'GET',
      url: `/categories/ancestors/`,
      data: {id: value},
      dataType: 'json',
    })
    .done(function(ancestors) {
      if(ancestors.length !== 0){
        //
        switch(ancestors.length){
          case 1:
            console.log(ancestors[0][name])
            break;
          case 2:
            console.log(ancestors[0].id)
            break;
          $.ajax({
            type: 'GET',
            url: `/categories/children/`,
            data: {id: ancestors[0].id},
            dataType: 'json',
          })
          .done(function(children){
            if(children.length !== 0){
            }
          })
          break;
        }
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  //edit画面読み込み時の処理
  window.onload = function(){
    //商品編集ページのみ発火
    if(document.URL.match(/^(?=.*items)(?=.*edit)/)){
      let categoryId = $("#first-category-input").val();
      getAncestor(categoryId);
      console.log(categoryId)
    }
  }
});