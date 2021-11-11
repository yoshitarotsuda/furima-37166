document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('item-image').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している該当IDの画像を削除する
    const imageContent = document.getElementById('item-image-sample');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('id', 'item-image-sample');
    
    // サイズを指定
    blobImage.height =200;
    
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  });
});