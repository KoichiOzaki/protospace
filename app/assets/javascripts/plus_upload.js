function plus_upload() {
  var $plus = $('.js-plus'),
      $uploader = $('.js-plus-uploader')
  $plus
  .on('click', function(evt) {
    $plus.hide();
    $uploader.show();
  });
};
$(document).ready(plus_upload)
$(document).on('page:load', plus_upload)
