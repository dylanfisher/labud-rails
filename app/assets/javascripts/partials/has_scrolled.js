// Has scrolled

$(function() {
  var headerHeight = 30;

  $(window).on('scroll.hasScrolled', function() {
    if ( App.scrollTop > App.windowHeight - headerHeight ) {
      App.$body.addClass('has-scrolled-past-viewport');
    } else {
      App.$body.removeClass('has-scrolled-past-viewport');
    }
  });
});

$(document).on('turbolinks:load', function() {
  $(window).trigger('scroll.hasScrolled');
});
