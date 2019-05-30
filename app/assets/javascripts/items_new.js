$(function(){
  $("#fee-input").on("keyup",function(e){
    var input = $("#fee-input").val();
    //300円以上9,999,999円以下の場合のみ表示
    if(300 <= input &&  input <= 9999999){
      var handling_fee = Math.floor(input/10);
      console.log(handling_fee);
      var profit = input - handling_fee;
      $("#handling-fee__input").text(handling_fee); 
      $("#profit__input").text(profit); 
    }
  })
});