$(function(){
  $(".select--wrap-cat1__default-category1").on('change',function(){
  var selectVal = $('.select--wrap-cat1__default-category1').val();
  if(selectVal > 0){
    $('.select--wrap-cat2').css("display","block");
  } else {
    $('.select--wrap-cat2').css("display","none");
  }
  });
  $(".select--wrap-cat2__default-category2").change(function(){
  var selectVal = $('.select--wrap-cat2__default-category2').val();
  if(selectVal > 0){
    $('.select--wrap-cat3').css("display","block");
    $('.sell--content2__form1__group1__label-size').css("display","block");
    $('.sell--content2__form1__group1__label-brand').css("display","block");
  } else {
    $('.select--wrap-cat3').css("display","none");
    $('.sell--content2__form1__group1__label-size').css("display","none");
    $('.sell--content2__form1__group1__label-brand').css("display","none");
  }
　});
  $('.input--price__default').on('keyup', function(){
      var input = $(this).val();
      var fee = Math.floor(input * 0.1);
      var gain = input - fee ;
      $('.l--right_fee').html("¥" + fee);
      $('.l--right__gain').html("¥" + gain);
  });
});


