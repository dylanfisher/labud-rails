// Home page brush strokes

(function() {
  var getRandomInt = function(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
  };

  var getRandBorder = function() {
    return getRandomInt(15, 85) + '%';
  };

  $(document).on('turbolinks:load', function() {
    var $canvas = $('#brush-stroke-canvas');

    if ( !$canvas.length ) return;

    var $form = $('#brush-stroke-canvas-form');
    var url = $form.attr('action');
    var color = $form.attr('data-color');
    var $canvasBrush = $('#canvas-brush');

    var stroke = {};

    stroke.posX = -1000;
    stroke.posY = -1000;

    stroke.updateStyles = function() {
      stroke.styles = 'background-color: ' + color + ';' +
                      'border-radius: ' + stroke.borderRadius + ';' +
                      'top: ' + stroke.posY + '%;' +
                      'left: ' + stroke.posX + '%;' +
                      'width: ' + stroke.width + ';' +
                      'height: ' + stroke.height + ';' +
                      'transform: ' + stroke.transform + ';';
    };

    var resetStrokeData = function() {
      // border-radius: '78% 22% 57% 43% / 30% 24% 76% 70%';
      stroke.borderRadius = [getRandBorder(), getRandBorder(), getRandBorder(), getRandBorder()].join(' ') + ' / ' + [getRandBorder(), getRandBorder(), getRandBorder(), getRandBorder()].join(' ');

      stroke.width = getRandomInt(80, 180) + 'px';
      stroke.height = getRandomInt(80, 180) + 'px';
      stroke.transform = 'rotate(' + getRandomInt(0, 360) + 'deg) translate(-50%, -50%)';

      stroke.updateStyles();

      if ( !$canvasBrush.length ) {
        $canvas.append('<div id="canvas-brush" class="brush-stroke"></div>');
        $canvasBrush = $('#canvas-brush');
      }

      $canvasBrush.attr('style', stroke.styles);
    };

    resetStrokeData();

    $canvas.on('mouseenter.brushStroke', function() {
      $canvasBrush.show();
    });

    $canvas.on('mouseleave.brushStroke', function() {
      $canvasBrush.hide();
    });

    $canvas.on('mousemove.brushStroke', $.throttle( 30, function(e) {
      var posX = e.pageX / App.windowWidth * 100 + '%';
      var posY = e.pageY / App.windowHeight * 100 + '%';

      $canvasBrush.css({
        top: posY,
        left: posX
      });
    }));

    $canvas.on('click.brushStroke', function(e) {
      stroke.posX = e.pageX / App.windowWidth * 100;
      stroke.posY = e.pageY / App.windowHeight * 100;

      stroke.updateStyles();

      $canvas.append('<div class="brush-stroke" style="' + stroke.styles + '"></div>');

      $.ajax({
        method: 'POST',
        url: url,
        data: {
          pos_x: stroke.posX,
          pos_y: stroke.posY,
          color: color,
          styles: {
            transform: stroke.transform,
            border_radius: stroke.borderRadius,
            width: stroke.width,
            height: stroke.height
          }
        }
      });

      resetStrokeData(e);
    });

    var $previousStrokes = $canvas.find('.previous-brush-stroke');
    var $lastPreviousStroke = $previousStrokes.last();
    var currentTime = Math.floor(new Date() / 1000);

    var animateStroke = function($stroke) {
      var strokeTime = parseInt($stroke.attr('data-created-at'));
      var timeDifference = currentTime - strokeTime;

      currentTime = strokeTime;

      var $nextStroke = $stroke.prev('.previous-brush-stroke');
      var delay;

      if ( timeDifference > 86400 ) {
        delay = 4;
      } else if ( timeDifference > 3600 ) {
        delay = 3;
      } else if ( timeDifference > 1800 ) {
        delay = 2;
      } else if ( timeDifference > 60 ) {
        delay = 1;
      } else if ( timeDifference > 30 ) {
        delay = 0.5;
      } else if ( timeDifference > 10 ) {
        delay = 0.25;
      } else if ( timeDifference > 5 ) {
        delay = 0.1;
      } else if ( timeDifference > 2.5 ) {
        delay = 0.075;
      } else {
        delay = 0.05;
      }

      window.setTimeout(function() {
        $stroke.show();

        if ( $nextStroke.length ) {
          animateStroke($nextStroke);
        }
      }, delay * 1000);
    };

    animateStroke($lastPreviousStroke);

    $(document).one('turbolinks:before-cache', function() {
      $canvas.off('click.brushStroke mousemove.brushStroke mouseenter.brushStroke mouseleave.brushStroke');
      $canvasBrush.remove();
    });
  });
})();
