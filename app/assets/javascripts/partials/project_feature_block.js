// Project feature block

(function() {
  var timer;

  var animate = function($slide) {
    var $next = $slide.nextWrap();

    $slide.removeClass('active');
    $next.addClass('active');

    timer = window.setTimeout(function() {
      animate($next);
    }, 300);
  };

  $(document).on('mouseenter', '.project-feature-block__column', function() {
    var $column = $(this);
    var $slides = $column.find('.project-feature-block__slide');

    if ( $slides.length < 2 ) return;

    var $active = $slides.filter('.active');

    animate($active);
  });

  $(document).on('mouseleave', '.project-feature-block__column', function() {
    if ( timer ) window.clearTimeout(timer);
  });
})();
