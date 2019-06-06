$(document).on('turbolinks:load', function() {
  function buildCategoryHTML(categoryId){
    var html =
  }
  //配送料の表示
  $('#item_shipping_fee').change(function() {
      var ShippingFee = document.getElementById("item_shipping_fee")
      var resultDhippingFee = ShippingFee.value;
      if(resultDhippingFee == "送料込み(出品者負担)"){
        document.getElementById('delivery').style.display = "block";
      }else if(resultDhippingFee == "着払い(購入者負担)"){
        document.getElementById('delivery').style.display = "block";
      }
      else{
        document.getElementById('delivery').style.display = "none";
      }
    })
})