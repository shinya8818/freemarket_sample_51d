$(document).on('turbolinks:load', function() {
//   //selectタグ以下にappendするoptionタグ
  function buildOptionHTML(id, name){
    let html = `<option value= ${id}>${name}</option>`
    return html;
  }
  //表示と非表示の切り替え
  function blockDisplay(block, input){
    if(input !== "")
    {
      document.getElementById(block).style.display = "block";
    }
    else{
      document.getElementById(block).style.display = "none";
    }
  }
  //カテゴリー1に値が入った場合
  $('#first-category-input').change(function() {
    let firstCategory = document.getElementById("first-category-input");
    let result = firstCategory.value;
    blockDisplay('second-category', result);
    //selectタグの値を取得
    var selectValue1 = $("#first-category-input").val();
    console.log(selectValue1);
    $.ajax({
      type: 'GET',
      url: `/categories`,
      data: {id: selectValue1},
      dataType: 'json',
    })
    .done(function(categories) {
    if(categories.length !== 0){
      $("#second-category-input").empty();
      var htmlOption = buildOptionHTML("", "---");
      categories.forEach(function(category){
        htmlOption += buildOptionHTML(category.id, category.name);
      });
      $('#second-category-input').append(htmlOption);
    }
    }).
    fail(function(XMLHttpRequest, textStatus, errorThrown) {
    alert('error');
    console.log("XMLHttpRequest : " + XMLHttpRequest.status);
    console.log("textStatus     : " + textStatus);
    console.log("errorThrown    : " + errorThrown.message);
    });
  })
  //カテゴリー2に値が入った場合,動的に追加した要素のためdocument
  $(document).change('#second-category-input',function() {
    let secondCategory = document.getElementById("second-category-input");
    let result = secondCategory.value;
    blockDisplay('third-category', result);
    // let html = buildOptionHTML(100, "あいあいあい");
    // $("#third-category-input").append(html);
  })
  //配送料の表示
  $('#item_shipping_fee').change(function() {
    let ShippingFee = document.getElementById("item_shipping_fee");
    let resultShippingFee = ShippingFee.value;
    blockDisplay('delivery', resultShippingFee);
  })
})