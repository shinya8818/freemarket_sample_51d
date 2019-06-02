$(function(){
  $("#fee-input").on("keyup",function(e){
    var input = $("#fee-input").val();
    //300円以上9,999,999円以下の場合のみ表示
    if(300 <= input &&  input <= 9999999){
      var handling_fee = Math.floor(input/10);
      var profit = input - handling_fee;
      $("#handling-fee__input").text(handling_fee); 
      $("#profit__input").text(profit); 
    }
  })
});
$(function() {
  //ドロップゾーンを明示的にインスタンス化
  Dropzone.autoDiscover = false;

  // //formタグ以外なので明示的に
  var myDropzone = new Dropzone ( "div#item" , {
     url : "/items/index",
     maxFiles: 6,
     dictMaxFilesExceeded: "ファイルは6ファイルまで追加が可能です。"
    });


  $(".dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true
  });
});