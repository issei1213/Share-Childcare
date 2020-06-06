// $(function() {
//   $(document).ready(function() {
//   // イメージのスライド
//     $(".top-image-box").slick({
//       autoplay: true,
//       autoplaySpeed: 5000,
//       fade: true
//     });
//   });
//   // イメージボタンを隠す
//   $(document).ready(function() {
//     $(".slick-arrow").hide();
//   });
// });
$(document).on('turbolinks:load', function(){
  console.log("OK")
  $('.slick').slick({
    autoplay:true,  //←自動再生
    dots:true      //←ドットの描写
  });
});