// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .
$(document).ready(function() {

   $('.banner').unslider({
    speed: 350,
    complete: function() {},
    keys: true,
    dots: true,
    fluid: true
  });
   var unslider = $('.banner').unslider(), 
         data = unslider.data('unslider');
    window.onload = function () {  data.move(0); }

  var submit_button = $('#submit_pre_upload_form');
  var video_upload = $('#video_upload');
  submit_button.click(function () {
    $.ajax({
      type: 'POST',
      url: '<%= get_upload_token_path %>',
      data: $('#video_pre_upload').serialize(),
      dataType: 'json',
      success: function(response) {
        video_upload.find('#token').val(response.token);
        video_upload.attr('action', response.url.replace(/^http:/i, window.location.protocol)).submit();
        submit_button.unbind('click').hide();
        $('.preloader').css('display', 'block');
      }
    });
  });


});


