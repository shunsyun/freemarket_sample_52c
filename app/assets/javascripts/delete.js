$(function(){
  $('.btn-delete').click(function(){
    var alert = "確認\n削除すると２度と復活できません。\n削除する代わりに停止することもできます。\n本当に削除しますか？"
    if(!confirm(alert)){
        /* キャンセルの時の処理 */
        return false;
    }else{
        /*　OKの時の処理 */
        location.href = 'root';
    }
  });
});
