// Registration form

App.setRegistrationSuccess = function() {
  var $wrapper = $('#registration-form-wrapper');
  var successMessage = 'You have been subscribed!';

  $wrapper.html( '<div class="registration-form__success-message">' + successMessage + '</div>' );
};

$(document).on('submit', '#registration-form', function() {
  var $form = $(this);
  var $wrapper = $form.closest('#registration-form-wrapper');
  var $errors = $wrapper.find('#registration-form-errors');

  $.ajax({
    type: 'GET',
    url: $form.attr('action'),
    data: $form.serialize(),
    dataType: 'json',
    contentType: 'application/json; charset=utf-8',
    error: function(data) {
      $errors.addClass('active').html('Could not connect to the registration server.');
    },
    success: function(data) {
      if ( data.result != 'success' ) {
        $errors.addClass('active').html( data.msg.replace(/^\d* - /, '') );
      } else {
        App.setRegistrationSuccess();
      }
    }
  });

  return false;
});
