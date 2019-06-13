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
    let html = '<option value= ${id}>${name}</option>'
    return html;
  }
  //カテゴリの値が空(---)の場合、子カテゴリを初期化（削除）する関数
  function removeChildrenCategory(targetInput){
    if(targetInput == '#first-category-input'){
      if($('#second-category').length){
        $('#second-category').remove();
      }
      if($('#third-category').length){
        $('#third-category').remove();
      }
    }
    else if(targetInput == '#second-category-input'){
      if($('#third-category').length){
        $('#third-category').remove();
      }
    }
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
  //カテゴリーを追加する
  function appendCategory(value, targetBlock, id, redoFlag = false){
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {id: value},
      dataType: 'json',
    })
    .done(function(categories) {
      if(categories.length !== 0){
        //初期値
        let html = buildOptionHTML("", "---");
        categories.forEach(function(category){
          html += buildOptionHTML(category.id, category.name);
        });
        if(redoFlag == false ){
          html = buildSelectHTML(html, id)
          $(targetBlock).append(html);
        }
        else{
          $(targetBlock).append(html);
        }
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  //カテゴリー1に値が入った場合
  $('#first-category-input').change(function() {
    let firstCategory = document.getElementById("first-category-input");
    let valueSelect1 = firstCategory.value;
    //「---」を選んだとき
    if(!valueSelect1){
      removeChildrenCategory('#first-category-input')
    }
    else{
      //カテゴリー１を変更し、カテゴリー２が既に存在した場合、カテゴリー2のoptionを変更する
      if($("#second-category").length){
        $("#second-category-input").empty();
        appendCategory(valueSelect1, "#second-category-input", "", true)
        $("#third-category").remove();
      }
      //通常時
      else{
      appendCategory(valueSelect1, ".categories", "second-category");
      }
    }
  })
  // カテゴリー2に値が入った場合
  $(document).on('change','#second-category-input', function() {
    let secondCategory = document.getElementById("second-category-input");
    let valueSelect2 = secondCategory.value;
    //「---」を選んだとき
    if(!valueSelect2){
      removeChildrenCategory('#second-category-input')
    }
    else{
      if($("#third-category").length){
        $("#third-category-input").empty();
        appendCategory(valueSelect2, "#third-category-input", "", true)
      }
      else{
        appendCategory(valueSelect2, ".categories", "third-category");
      }
    }
  })
  $('#item_shipping_fee').change(function() {
    let ShippingFee = document.getElementById("item_shipping_fee");
    let resultShippingFee = ShippingFee.value;
    blockDisplay(resultShippingFee, 'delivery');
  })
})