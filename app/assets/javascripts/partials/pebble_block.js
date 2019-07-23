// Pebble block

$(document).on('turbolinks:load', function() {
  var $pebbles = $('.pebble-block__pebble');

  $pebbles.each(function() {
    var $pebble = $(this);
    var styles = App.brushStroke.generate();

    $pebble.css(styles);
  });
});
