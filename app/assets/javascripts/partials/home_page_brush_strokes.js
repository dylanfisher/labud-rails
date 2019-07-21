// Home page brush strokes

$(document).on('turbolinks:load', function() {
  var timer;
  var $canvas = $('#brush-stroke-canvas');

  if ( !$canvas.length ) return;

  var $form = $('#brush-stroke-canvas-form');
  var url = $form.attr('action');
  var color = $form.attr('data-color');

  var $canvasBrush = $('#canvas-brush');

  if ( !$canvasBrush.length ) {
    $canvas.append('<div id="canvas-brush" class="brush-stroke"></div>');
    $canvasBrush = $('#canvas-brush');
  }

  // TODO: request animation frame?
  $canvas.on('mousemove.brushStroke', $.throttle( 50, function(e) {
    var posX = e.pageX / App.windowWidth * 100 + '%';
    var posY = e.pageY / App.windowHeight * 100 + '%';

    $canvasBrush.css({
      top: posY,
      left: posX,
      backgroundColor: color
    });
  }));

  $canvas.on('click.brushStroke', function(e) {
    var posX = e.pageX / App.windowWidth * 100;
    var posY = e.pageY / App.windowHeight * 100;

    $canvas.append('<div class="brush-stroke" style="background-color: ' + color + '; top: ' + posY + '%; left: ' + posX + '%;"></div>');

    $.ajax({
      method: 'POST',
      url: url,
      data: {
        pos_x: posX,
        pos_y: posY
      }
    });
  });

  $(document).one('turbolinks:before-cache', function() {
    $canvas.off('click.brushStroke mousemove.brushStroke');
    $canvasBrush.remove();
  });
});
