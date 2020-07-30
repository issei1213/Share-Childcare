$(function () {
  // ユーザーの誕生日の閏年を動的に変化させる
  // 誕生日の配列を宣言
  var year_array = [];
  var month_array = [];
  var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // 現在の年を取得する
  var date = new Date();
  var this_year = date.getFullYear();

  // 誕生年月の配列を自動生成
  for (var i = this_year; i <= this_year + 2; i++) {
    var year = { var: i, txt: String(i) };
    year_array.push(year);
  }
  for (var i = 1; i <= 12; i++) {
    var month = { var: i, txt: String(i) };
    month_array.push(month);
  }
  // hamlの年と月のセレクトボックスに配列内容を反映させる
  for (var i = 0; i < year_array.length; i++) {
    $("<option>", {
      value: year_array[i].var,
      text: year_array[i].txt
    }).appendTo('#order-form-year');
  }
  for (var i = 0; i < month_array.length; i++) {
    $("<option>", {
      value: month_array[i].var,
      text:month_array[i].txt
    }).appendTo('#order-form-month');
  }

  // 年、もしくは月のセレクトボックスの中身に変更があったら日の内容を変更する
  $('#order-form-year, #order-form-month').change(function () {
    // 日が入っているセレクトボックスの中身を空っぽにする
    $('#order-form-date').empty();
    // 日が入るセレクトボックスにデフォルト値の'--'を入れる
    $("<option>", {
      text: ''
    }).appendTo('#order-form-date');
    // ２月の日にち、すなわちmonths[1]を28にセットし直す
    months[1] = 28;
    // 年と月に入力されている情報を取得する
    var year = $('#order-form-year').val();
    var month = $("#order-form-month").val();
    // yearとmonth共に数字が入力されている、すなわち共に'--'でないときに実行
    if (year != '--' && month != '--') {
      // monthに２月が選択されている時実行
      if (month == 2) {
        // yearが閏年の時、2月の日付が格納されているmonths[1]の値を29にする
        if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
          months[1] = 29;
        }
      }
      // 日を入れる配列を宣言し、閏年を考慮したデータを格納してhamlの日の
      // セレクトボックスに反映させる
      var date_array = []
      for (var i = 1; i <= months[month - 1]; i++) {
        var day = { var: i, txt: String(i) };
        date_array.push(day);
      }
      for (var i = 0; i < date_array.length; i++) {
        $("<option>", {
          value: date_array[i].var,
          text: date_array[i].txt
        }).appendTo('#order-form-date');
      };
    };
  });

  // 時間のセレクトボックスに値を入れる
  $('#order-form-hour-top').change(function(){
    var hour_down = [];
    var hour_top = $("#order-form-hour-top").val();

    $('#order-form-hour-down').empty();

    for(var i = Number(hour_top)+1; i <= 24; i++){
      hour = { var: i, txt: String(i) };
      hour_down.push(hour);
    }
    for(var i = 0; i < hour_down.length; i++){

      $("<option>", {
        value: hour_down[i].var,
        text: hour_down[i].txt
      }).appendTo('#order-form-hour-down');
    }


    // 合計金額の計算を行う
    var option_money = $("#option_ money").text();
    var option_pay = $("#option_pay").text();
    var fee_pay = $("#option_ money").text();

    debugger

  });
});