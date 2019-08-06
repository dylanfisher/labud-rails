// $(document).on('turbolinks:load', function() {
//   var $viewport = $('#parallax-viewport');

//   if ( !$viewport.length ) return;

//   var $layers = $viewport.find('.parallax-layer');
//   var parallax = function(e, target, layer) {
//     var layerCoeffX = ( App.windowWidth / 19 ) / layer;
//     var layerCoeffY = ( App.windowHeight / 26 ) / layer;
//     var x = ( App.windowWidth - target.offsetWidth) / 2 - (e.pageX - (App.windowWidth / 2) ) / layerCoeffX;
//     var y = ( App.windowHeight - target.offsetHeight) / 2 - (e.pageY - (App.windowHeight / 2) ) / layerCoeffY;

//     $(target).css({ transform: 'translate(' + x + 'px, ' + y + 'px)' });
//   };

//   $(document).off('mousemove.aboutSwan');
//   $(document).on('mousemove.aboutSwan', function(e) {
//     $layers.each(function(index) {
//       parallax(e, this, index + 1);
//     });
//   });
// });
