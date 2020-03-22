$(function() {
  $(document).ready(function() {
  // イメージのスライド
    $(".top-image-box").slick({
      autoplay: true,
      autoplaySpeed: 5000,
      fade: true
    });
  });
  // イメージボタンを隠す
  $(document).ready(function() {
    $(".slick-arrow").hide();
  });
});
