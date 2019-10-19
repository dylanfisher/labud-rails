// Project feature block

(function() {
  var timer;
  var mobileTimers = [];
  var mobileDuration = 200;

  var animate = function($slide) {
    var $next = $slide.nextWrap();

    $slide.removeClass('active');
    $next.addClass('active');

    timer = window.setTimeout(function() {
      animate($next);
    }, 300);
  };

  var mobileAnimate = function($columns, index) {
    var $column = $( $columns[Math.floor(Math.random() * $columns.length)] );

    if ( $column.data('active') ) {
      $column = $( $columns.not($column)[Math.floor(Math.random() * ($columns.length - 1))] );
    }

    $columns.data('active', false);
    $column.data('active', true);

    var $slide = $column.find('.project-feature-block__slide.active');

    $slide.removeClass('active');
    $slide.nextWrap().addClass('active');

    mobileTimers.push(window.setTimeout(function() {
      mobileAnimate($columns, index);
    }, mobileDuration));
  }

  $(document).on('mouseenter', '.project-feature-block__column', function() {
    var $column = $(this);
    var $slides = $column.find('.project-feature-block__slide');

    if ( $slides.length < 2 ) return;

    var $active = $slides.filter('.active');

    animate($active);

    $(document).one('turbolinks:before-cache', function() {
      if ( timer ) window.clearTimeout(timer);

      $('.project-feature-block__slide').removeClass('active').filter(':first-child').addClass('active');
    });
  });

  $(document).on('mouseleave', '.project-feature-block__column', function() {
    if ( timer ) window.clearTimeout(timer);
  });

  $(document).on('turbolinks:load', function() {
    if ( !App.breakpoint.isMobile() ) return;

    var $blocks = $('.project-feature-block');

    if ( !$blocks.length ) return;

    for (var i = mobileTimers.length - 1; i >= 0; i--) {
      if ( mobileTimers[i] ) window.clearTimeout( mobileTimers[i] );
    }

    mobileTimers = [];

    $blocks.each(function(blockIndex) {
      var $block = $(this);
      var $columns = $block.find('.project-feature-block__column');

      mobileTimers.push(window.setTimeout(function() {
        mobileAnimate($columns);
      }, mobileDuration / 4));
    });

    $(document).one('turbolinks:before-cache', function() {
      for (var i = mobileTimers.length - 1; i >= 0; i--) {
        if ( mobileTimers[i] ) window.clearTimeout( mobileTimers[i] );
      }

      $('.project-feature-block__slide').removeClass('active').filter(':first-child').addClass('active');
    });
  });
})();
