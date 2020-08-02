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



