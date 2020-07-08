$(function(){
  $('.slick').slick({
    autoplay:true,  //←自動再生
    dots:true      //←ドットの描写
  });
  // プレビューボタンの削除
  $(".slick-prev.slick-arrow").remove();
  // 画像下のボタン削除
  $(".slick-next.slick-arrow").remove();
  $(".slick-dots").remove();
});