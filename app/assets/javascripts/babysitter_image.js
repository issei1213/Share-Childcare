$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div class="d-flex justify-content-start">
                    <div class="js-file_group" data-index="${num}">
                      <input class="js-file form-control" required="required" type="file"
                      name="babysitter[babysitter_images_attributes][${num}][name]"
                      id="babysitter_babysitter_images_attributes_${num}_name">
                    </div>
                    <span class="js-remove btn btn-sm">削除</span>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // 削除の時の要素数を抽出
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  // $('.hidden-destroy').hide();


  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });


    // 削除ボタンをクリックした時に、削除対象の要素数を代入する
  $('#image-box').on('click', '.js-remove', function() {
    // data-index = []の値を抽出
    const targetIndex = $(this).parent().parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる(これで削除対象になる。paramsにdestroy対象になる)
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // 削除ボタンとプレビュー表示を削除
    $(this).parent().remove();
    // $(this).remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく(画像フォーム入力が)
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});