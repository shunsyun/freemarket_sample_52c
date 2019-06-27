$(function(){
  // var html1 =`<div class='select--wrap-cat2'>
  //               <select class='select--wrap-cat2__default-category2'>
  //                 <option>---</option>
  //                 <option>トップス</option>
  //                 <option>ジャケット/アウター</option>
  //                 <option>パンツ</option>
  //                 <option>スカート</option>
  //                 <option>ワンピース</option>
  //               </select>
  //               <i class='fas fa-angle-down'></i>
  //             </div>`
  // var html2 = `<div class='select--wrap-cat3'>
  //               <select class='select--wrap-cat3__default-category3'>
  //                 <option>---</option>
  //                 <option>Tシャツ</option>
  //                 <option>シャツ</option>
  //                 <option>ポロシャツ</option>
  //                 <option>キャミソール</option>
  //               </select>
  //               <i class='fas fa-angle-down'></i>
  //             </div>`
  //   $('.select--wrap-cat1__default-category').on('change',function(){
  //     $('.select--wrap-cat1').append(html1)
  //   });
  //   $(document).on('change','.select--wrap-cat2__default-category2',function(){
  //     $('.select--wrap-cat2').append(html2)
  //   });
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
  // var gain = (Number(int) - Number(fee));
  // $('.input--price__default').keyup(function(e){
  //   console.log(this)
  //   $('.l--right__gain').text(e.keyCode);
  // });


