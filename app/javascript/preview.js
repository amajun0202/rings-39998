document.addEventListener('turbo:load', function() {
  const fileFieldsArea = document.querySelector('.click-upload');
  const previewList = document.getElementById('previews');
  const imageLimits = 5;

  buildNewFileField(); // 初期のファイル選択フィールドを追加
 
  function buildNewFileField() {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'location[images][]');
    newFileField.addEventListener('change', changedFileField);

    const nextDataIndex = document.querySelectorAll('input[type="file"][name="location[images][]"]').length;
    newFileField.setAttribute('data-index', nextDataIndex);

    fileFieldsArea.appendChild(newFileField);
  }

  function changedFileField(e) {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];

    if (!file) {
      deleteImage(dataIndex);
      return null;
    }

    const blob = window.URL.createObjectURL(file);
    
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    }

    buildPreviewImage(dataIndex, blob);

    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount < imageLimits) buildNewFileField();
  }

  function buildPreviewImage(dataIndex, blob) {
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewImage.setAttribute('style', 'width: 200px; height: auto;');

    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除ボタン";
    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  }

  previewList.style.display = 'flex';
  previewList.style.flexWrap = 'wrap';

  function deleteImage(dataIndex) {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();
  }
});