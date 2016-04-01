$(function() {
$( "#slider-range" ).slider({
  range: true,
  min: 0,
  max: 100000,
  values: [ 500, 60000 ],
  slide: function( event, ui ) {
    $( "#amount" ).val( "¥" + ui.values[ 0 ] + " - ¥" + ui.values[ 1 ] );
  }
});
$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
  " - $" + $( "#slider-range" ).slider( "values", 1 ) );
});

$(function() {
    var op = {
      closeText: '閉じる',
      prevText: '&#x3c;前',
      nextText: '次&#x3e;',
      currentText: '今日',
      monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
      monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
      dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
      dayNamesShort: ['日','月','火','水','木','金','土'],
      dayNamesMin: ['日','月','火','水','木','金','土'],
      weekHeader: '週',
      dateFormat: 'yy/mm/dd',
      firstDay: 0,
      isRTL: false,
      showMonthAfterYear: true,
      yearSuffix: '年'};
    $('.datepicker').datepicker(op);
});

