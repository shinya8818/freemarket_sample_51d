$(document).on('turbolinks:load', function() {
  function build_image(alt, src){
    var html = `<li>
                  <figure class="sell-upload-figure">
                    <img alt="${alt}" src="${src}">
                  </figure>
                  <div class="upload-image">
                    <a class="item-image__btn-edit">編集</a>
                    <a class="item-image__btn-delete">削除</a>
                  </div>
               </li>`
  return html;
  }
  var files_array= []
  var count = 1;
  var image_tag;
  var inputBlock = ".sell-upload__drop-box-0-input"

  // プレビュー
  $(inputBlock).change( $('inputBlock').children('input[name="images[name][' + count + ']"]'), function (e) {
    // ファイルオブジェクト取得
    var files = $(this).prop('files');
    for (var i=0; i<files.length; i++) {
      var file = e.target.files[i];
      var file_reader = new FileReader();
      //
      files_array.push(files[i]);
      // 選択画像プレビュー操作
      file_reader.onload = (function () {
        return function (e) {
          // imgタグ追加
          image_tag = build_image(count, e.target.result);
          $('#sell-upload__images-0').append(image_tag);
          // ファイル数カウント
          count += 1;
        };
      })(file);
    file_reader.readAsDataURL(file);
    }
  });
  //削除機能
  $(document).on('click','.item-image__btn-delete', function(){
    // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
    var index = $(".item-image__btn-delete").index(this);
    // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
    files_array.splice(index - 1, 1);
    // クリックされたaタグが含まれるli要素をHTMLから削除する。
    $(this).parent().parent().remove();
  });
});