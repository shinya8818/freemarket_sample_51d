$(document).on('turbolinks:load', function() {
  function build_image(alt, src){
    var html = `<div>
                  <img alt="${alt}" src="${src}">
               </div>`
    return html;
    }
    var count = 1;
    var image_tag;
    // // ファイル選択
    // $('#item_images_attributes_0_image').on('click', function() {
    //   $('#item_images_attributes_0_image').children('input[name="images[name][' + count + ']"]')[0].click();
    // })
    // image_file.on('click', function() {
    //   image_file.children('input[name="images[name][' + image_count + ']"]')[0].click();
    // })
    function build_file_tag(num) {
      var html = `<input name="images[name][${num}]" style="display: none;" type="file" id="image${num}">`
      return html;
    }

    // プレビュー
    $('#item_images_attributes_0_image').change( $('#item_images_attributes_0_image').children('input[name="images[name][' + count + ']"]'), function (e) {
      // ファイルオブジェクト取得
      var file = e.target.files[0];
      var file_reader = new FileReader();
      // 選択画像プレビュー操作
      file_reader.onload = (function () {
        return function (e) {
          // imgタグ追加
          image_tag = build_image(count, e.target.result);
          $('.sell-upload__images-0').append(image_tag);
          // ファイル数カウント
          count += 1;
          file_tag = build_file_tag(count);
          $('#item_images_attributes_0_image').append(file_tag);
        };
      })(file);
      file_reader.readAsDataURL(file);
  });
    //ajax通信
    // $.ajax({
    //   url: url,
    //   type: "POST",
    //   data: formData,
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false
    // })

    // $('#item_images_attributes_0_image').change(function() {
    //   var preview = document.querySelector('sell-upload__images-0');
    //   var file = document.querySelector('input[type=file]').files[0];
    //   var formData = new FormData($(this).get(0));
    //   console.log($(this))
    //   //ajax通信
    //   $.ajax({
    //     url: window.location.href,
    //     type: "POST",
    //     data: formData,
    //     dataType: 'json',
    //     processData: false,
    //     contentType: false
    //   })
    //   .done(function(){
    //     console.log("OK")
    //   })
  // })
});