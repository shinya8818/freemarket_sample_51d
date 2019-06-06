$(document).on('turbolinks:load', function() {
  function build_image(){
    var html = `<li>
                  <img alt="${alt}" src="${src}">
               </li>`
    return html;
    }
    $('#item_images_attributes_0_image').change(function() {
      var preview = document.querySelector('sell-upload__images-0');
      var file = document.querySelector('input[type=file]').files[0];
      var formData = new FormData($(this).get(0));
      console.log($(this))
      //ajax通信
      $.ajax({
        url: window.location.href,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(){
        console.log("OK")
      })
  })
});