$(function(){
  // 非同期通信時のコメント作成メソッド
  function buildHTML(chat){
    var html =
      `
      <div class="row">
        <div class="col-auto ml-auto">
          <div class="balloon-right">
            <div class="chatting">
              <div class="mycomment">
                <p>${chat.comment}</p>
                <small>
                  <div class="text-right">
                    ${chat.created_at}
                  </div>
                </small>
              </div>
            </div>
            <div class="faceicon">
              <div class="succeed">
                <img alt="" src="https://picsum.photos/id/237/35/35">
              </div>
            </div>
          </div>
        </div>
      </div>
      `
    return html;
  }

  $('#chat-form-ajax').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chats-group').append(html);
      $('html,body').animate({ scrollTop: $('.chats-group')[0].scrollHeight});
      $('#form-send-button').prop("disabled", false);
      $('#chat-form-ajax')[0].reset();
    })
    .fail(function(data) {
      console.log(data)
      alert('通信エラーが発生しました。ブラウザを更新してください。');
    });
  });  

  // var reloadMessages = function() {
  //   var last_comment_id = $('.comment:last').data("comment-id");
  //   var url = $(location).attr("pathname")
  //   $.ajax({
  //     url: `${url}/api/comments`,
  //     type: 'get',
  //     dataType: 'json',
  //     data: {id: last_comment_id}
  //   })
  //   .done(function(comments) {
  //     if (comments.length !== 0) {
  //       var insertHTML = '';
  //       $.each(comments, function(i, comment) {
  //         insertHTML += buildHTML(comment)
  //       });
  //       $('.js-ajax-card').append(insertHTML);
  //       $('html,body').animate({ scrollTop: $('.js-ajax-card')[0].scrollHeight});
  //     }
  //   })
  //   .fail(function() {
  //     alert('error');
  //   });
  // };

  // ７秒毎にreloadMessagesメソッドを動かす
  if (document.location.href.match(/\/boards\/\d+/)) {
    setInterval(reloadMessages, 7000);
  }
});