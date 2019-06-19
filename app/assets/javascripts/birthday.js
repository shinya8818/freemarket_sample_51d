$(document).on('turbolinks:load', function() {
  // ***選択肢に値を追加していく関数***
  function createOptionElements(num,parentId){
    var doc = document.createElement('option');
    doc.value = doc.innerHTML = num;
    document.getElementById(parentId).appendChild(doc);
  }

  // ***初期値にハイフンをセットする関数***
  function formSetHyphen(parentId){
    var doc = document.createElement('option');
    doc.value = doc.innerHTML = "--";
    document.getElementById(parentId).appendChild(doc);
  }

  // ***月の値を設定する関数***
  function formSetMonth(){
    formSetHyphen('birth_month');
    for (var i = 1; i <= 12; i++) {
      createOptionElements(i,'birth_month');
    }
  }

  // ***年と月に応じた日にちを取得して設定する関数***
  function formSetDay(month){
    formSetHyphen('birth_day');
    var lastday = new Array('', 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0){
      lastday[2] = 29;
    }

    var MaxDay = lastday[month]
    for (var i = 1; i <= MaxDay; i++) {
      createOptionElements(i,'birth_day');
    }
  }

  var time = new Date();
  var year = time.getFullYear();
  //年：現在の年から1900年までを表示する
  for (var i = year; i >= 1900; i--) {
    createOptionElements(i,'birth_year');
  }
  //月: 年が切り替わったタイミングで表示する
  $('#birth_year').change(function(){
    $('#birth_month option').remove();
    formSetMonth();
  });
  //日: 年と月が切り替わったタイミングで存在する日にちを表示する
  $('#birth_year, #birth_month').change(function(){
    $('#birth_day option').remove();
    var month = $('#birth_month').val()
    formSetDay(month);
  });
});
