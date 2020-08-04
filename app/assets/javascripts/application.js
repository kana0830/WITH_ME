// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
// require turbolinks
//= require bootstrap-sprockets
//= require select2
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require jquery-ui/widgets/autocomplete
//= require_tree .



const signs = document.querySelectorAll('x-sign')
const randomIn = (min, max) => (
  Math.floor(Math.random() * (max - min + 1) + min)
)

const mixupInterval = el => {
  const ms = randomIn(2000, 4000)
  el.style.setProperty('--interval', `${ms}ms`)
}

signs.forEach(el => {
  mixupInterval(el)
  el.addEventListener('webkitAnimationIteration', () => {
    mixupInterval(el)
  })
})



// お気に入りゲレンデの選択
$(document).ready(function() {
  console.log($('.js-searchable'));
  $('.js-searchable').select2({
    width: 200,
    allowClear: true
  });
});



// テーブル行全体をリンクにする
$(function(){
  $('tr[data-href]', 'table.table-clickable').on('click', function(){
    location.href = $(this).data('href');
  });
});



// 地図表示
let map;
function initMap() {
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    // コントローラーで定義した変数から緯度経度を呼び出し、マップの中心に表示
    center: {
      lat: gon.gelande.latitude,
      lng: gon.gelande.longitude
    },
    zoom: 12,
  });

  marker = new google.maps.Marker({
    // コントローラーで定義した変数から緯度経度を呼び出し、マーカーを立てる
    position: {
      lat: gon.gelande.latitude,
      lng: gon.gelande.longitude
    },
    map: map
  });
}



// 天気予報
$(function () {
  var API_KEY = $('#api').data('reviews'); 
  var city = $('#address').data('reviews'); 
  // var API_KEY = "#{ENV['OPEN_WEATHER_MAP_API']}"; // APIキー(環境変数)を変数に代入
  // var city = "#{@gelande.address.match(/^.{2,3}[都道府県]/).to_s}"; // 該当ユーザーの都道府県名を変数に代入
  // APIを読み込み変数に代入
  var url = 'https://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;

  $.ajax({
      url: url,
      dataType: 'json',
      type: 'GET',
    })
    .done(function (data) {
      var insertHTML = '';
      var cityName = data.city.name;
      $('#city-name').html(cityName);

      // デフォルトでは3時間ごとの天気を取得するため、
      // 8の倍数でデータを取得することにより、24時間ごとの天気を取得する
      for (var i = 0; i <= 32; i = i + 8) {
        insertHTML += buildHTML(data, i);
      }
      $('#weather').html(insertHTML);
    })
    // .fail(function (data) {
    //   alert('天気予報取得に失敗しました');
    // });
});
// 日本語化
function buildHTML(data, i) {
  var weather = { "Clear": "晴れ", "Clouds": "曇り", "Rain": "雨", "Snow": "雪" };
  var Week = new Array('(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)');
  var date = new Date(data.list[i].dt_txt);
  date.setHours(date.getHours() + 9);
  var month = date.getMonth() + 1;
  var day = month + '/' + date.getDate() + Week[date.getDay()];
  var icon = data.list[i].weather[0].icon;
  var html =
    '<hr><div class="weather-report">' +
      '<img src="https://openweathermap.org/img/w/' + icon + '.png">' +
      '<span class="weather-date">' + day + "</span>" +
      '<div class="weather-main">'+ weather[data.list[i].weather[0].main] + '</div>' +
      '<div class="weather-temp-max">' + '最高：' + Math.round(data.list[i].main.temp_max) + "℃</div>" +
      '<span class="weather-temp-min">' + '最低：' + Math.floor(data.list[i].main.temp_min) + "℃</span>" +
    '</div>';
  return html
}


