$(function(){
  // 非同期通信時のコメント作成メソッド
  function buildHTML(chat){
    var html =
      `
      <div class="row chat" data-comment-id=${chat.id}>
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
    .done(function(comment){
      var html = buildHTML(comment);
      $('.chats-group').append(html);
      $('html,body').animate({ scrollTop: $('.chats-group')[0].scrollHeight});
      $('#form-send-button').prop("disabled", false);
      $('#chat-form-ajax')[0].reset();
    })
    .fail(function() {
      alert('通信エラーが発生しました。ブラウザを更新してください。');
    });
  });  

  var reloadMessages = function() {
    var last_comment_id = $('.chat:last').data("comment-id");
    var url = $(location).attr("pathname");
    console.log(last_comment_id)
    $.ajax({
      url: "api/chats",
      type: 'get',
      dataType: 'json',
      data: {id: last_comment_id}
    })
    .done(function(chats) {
      if (chats.length !== 0) {
        var insertHTML = '';
        $.each(chats, function(i, chat) {
          insertHTML += buildHTML(chat)
        });
        $('.chats-group').append(insertHTML);
        $('html,body').animate({ scrollTop: $('.chats-group')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('通信エラーが発生しました。ブラウザを更新してください。');
    });
  };

  // ７秒毎にreloadMessagesメソッドを動かす
  if (document.location.href.match(/\/orders\/\d+/)) {
    setInterval(reloadMessages, 7000);
  }
});