$(document).on('turbolinks:load', function () {
  var slideWidth = $('.owl-lazy').outerWidth(); // .slideの幅を取得して代入
  var slideNum = $('.owl-lazy').length; // .slideの数を取得して代入
  var slideSetWidth = slideWidth * slideNum; // .slideの幅×数で求めた値を代入
  $('#main').css('width', slideSetWidth); // .slideSetのスタイルシートにwidth: slideSetWidthを指定

  $('.owl-lazy-sub').mouseover(function(){
    var index = $('.owl-lazy-sub').index(this);
      setTimeout(function(){
        $('#main').animate({
        left: slideWidth * -index
      },800);
    },500);
  }) 

  $("#owls").children('img').css("opacity", '0.4');
  $("#owls").children('img').eq(0).css("opacity", '1.0');
  // ↑全体のopacityを0.4にしつつ一番目(0)の画像だけopacity1.0にしている。
  $("#owls").children('img').on('mouseover', function(){
    $("#owls").children('img').css("opacity", '0.4');
    $(this).css('opacity', '1');
  });
  
  // var elements = document.getElementById('#main')
  // var x;
  // var y;
  // var moving = false;
  // elements.addEventListener("mousedown", function(e){
  //   moving = true;
  //   x = e.pageX - this.offsetLeft;
  //   y = e.pageY - this.offsetTop;
  // }, false);

  // window.addEventListener("mousemove", function(e){
  //   if (moving == false) return
  //   elements.style.top = e.pageY - y + "px";
  //   elements.style.left = e.pageX - x + "px";
  // }, false);

  // elements.addEventListener("mouseup", function(){
  //   moving = false;
  // }, false);
});
