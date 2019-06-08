$(document).on('turbolinks:load', function() {
  function buildSelectHTML(optionHTML, id){
    let html = `<div class="select-wrap" id="${id}">
                  <select class="select-default" id="${id}-input" name="item[category_id]">
                    ${optionHTML}
                  </select>
                  <i class="fas fa-angle-down"></i>
                </div>`
    return html
  }
//   //selectタグ以下にappendするoptionタグ
  function buildOptionHTML(id, name){
    let html = `<option value= ${id}>${name}</option>`
    return html;
  }
  //表示と非表示の切り替え
  function blockDisplay(input, displayBlock){
    if(input !== "")
    {
      document.getElementById(displayBlock).style.display = "block";
    }
    else{
      document.getElementById(displayBlock).style.display = "none";
    }
  }
  function appendCategory(value, targetBlock,  id){
    $.ajax({
      type: 'GET',
      url: `/categories/new`,
      data: {id: value},
      dataType: 'json',
    })
    .done(function(categories) {
      console.log("success")
    if(categories.length !== 0){
      //初期値
      let html = buildOptionHTML("", "---");
      categories.forEach(function(category){
        html += buildOptionHTML(category.id, category.name);
      });
      html = buildSelectHTML(html, id)
      $(targetBlock).append(html);
    }
    }).
    fail(function() {
    alert('error');
    });
  };
  //カテゴリー1に値が入った場合
  $('#first-category-input').change(function() {
    let firstCategory = document.getElementById("first-category-input");
    let valueSelect1 = firstCategory.value;
    appendCategory(valueSelect1, ".categories", "second-category");
  })
  //カテゴリー2に値が入った場合
  $(document).on('change','#second-category-input', function() {
    let secondCategory = document.getElementById("second-category-input");
    let valueSelect2 = secondCategory.value;
    console.log(valueSelect2)
    appendCategory(valueSelect2, ".categories", "third-category");
  })
  // //カテゴリー2に値が入った場合,動的に追加した要素のためdocument
  // $(document).change('#second-category-input',function() {
  //   let secondCategory = document.getElementById("second-category-input");
  //   let valueSelect2 = secondCategory.value;
  //   blockDisplay(valueSelect2, 'third-category');
  //   appendOption(valueSelect2, "#third-category-input");
  // })
  //配送料の表示
  $('#item_shipping_fee').change(function() {
    let ShippingFee = document.getElementById("item_shipping_fee");
    let resultShippingFee = ShippingFee.value;
    blockDisplay(resultShippingFee, 'delivery');
  })
})