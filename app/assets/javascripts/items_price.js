$(document).on('turbolinks:load', function() {
  //入力された値から販売手数料と販売利益を計算
  $(function(){
    $("#fee-input").on("keyup",function(e){
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
    })
  });
});
