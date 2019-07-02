$(document).on('turbolinks:load', function(){
  $(function(){
    $('#carousel').slick({
      autoplay: true,
      autoplaySpeed: 4000,
      dots: true,
    });
  })
});