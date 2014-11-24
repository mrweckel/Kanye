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

    $('body').on("click", "#create_comment", function(event){

    event.preventDefault();
    $("#show_comment").toggle();
  })

    // $("#create_comment").click(function(e){
  //   e.preventDefault();
  //   console.log("linked")
  //   $("#show_comment_form").toggleClass("hidden")
  // });

  // $('body').on('click', "#create_comment", function(e){
  //   e.preventDefault(),
  //   $link = $(e.target)
  //   $.ajax({
  //     url: $link.attr("href"),
  //     type: $link.attr("method"),
  //   })
  //   .done(function(response) {
  //     $('#show_comment_form').append("<li>" + response + "</li>")
  //   });
  // })

  // $('#show_comment_form').on('click', "#comment-submit", function(e){
  //   e.preventDefault();
  //   $target = $(e.target)
  //   $real = $target.parent().parent()
  //   console.log("linked up")
  //   $.ajax({
  //     url: $real.attr("href"),
  //     type: 'GET',
  //     dataType: 'json',
  //   })
  //   .done(function(response) {
  //     console.log
  //     console.log(response)
  //     console.log("success");
  //   });
  // })


});


