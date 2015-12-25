function plus_upload() {
  var $plus = $('.js-plus');
  $plus.on('click', function() {
    var counter =  $('.proto-sub-list .js-inputFile').length + 1,
        $newImage = $('.list-group-item').first().clone();

    $newImage.find('img').remove();
    $newImage.find('.js-inputFile').attr({
      'name': 'prototype[prototype_images_attributes][' + counter + '][image]',
      'id': 'prototype_prototype_images_attributes_' + counter + '_image'
    });
    $newImage.find('.js-prFlag').attr({
      'name': 'prototype[prototype_images_attributes][' + counter + '][pr_flag]',
      'id': 'prototype_prototype_images_attributes_' + counter + '_pr_flag'
    });

    $plus.before($newImage);
  });
};
$(document).ready(plus_upload)
$(document).on('page:load', plus_upload)
