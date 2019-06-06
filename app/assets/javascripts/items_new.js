$(document).on('turbolinks:load', function() {
  //FixMe入力エラー(選択なしや値のエラー)
  // $(function(){
  //   (".sell__btn--red").click(function(){

  //   })
  // })
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
  // //FixMe 画像のドラッグ＆ドロップ処理(dropzoneの構造を理解してから追記)
  // $(function() {
  //   // ドロップゾーンを明示的にインスタンス化
  //   Dropzone.autoDiscover = false;
  //   Dropzone.options.itemImagesAttributes0Image = {}  
  //   // formタグ以外なので明示的に
  //   var myDropzone = new Dropzone ( "div#dropzone", {
  //      url : url,
  //      maxFiles: 10,
  //      dataType: 'json',
  //      autoProcessQueue: false,
  //     });
  
  
  //   $("#dropzone").dropzone({
  //     maxFilesize: 1,
  //     addRemoveLinks: true
  //   });
  // });
});
