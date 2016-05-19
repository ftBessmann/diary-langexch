$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // Have the correction form initially hidden
  $('#correction-form').hide();

  // Brings up the correction form when asked
  $('#correction-button').on('click', function() {
  	$(this).hide();
  	$('#correction-form').show();

  	// how to remove extra space ???
  	$('#correction-form-content').html($('#diary-entry-content').text())
  });

  // Cancels the correction form (hides it and brings back correction button)
  $('#cancel-correction-button').on('click', function(e) {
  	e.preventDefault();
  	$('#correction-form').hide();
  	$('#correction-button').show();
  });

  // Submits corrected entry to the server
  $('#correction-form').on('submit', function(e) {
  	e.preventDefault();

  	var request = $.ajax({
  		method: $(this).attr('method'),
  		url: $(this).attr('action'),
  		data: $(this).serialize(),
  		context: $(this)
  	});


  	request.done(function(response) {
  		console.log(response);
  		$('#corrections-container').append(response);
  		console.log(this);
      // Removes the new correction form because a profile can only make
      // one correction for a given diary entry
  		$(this).remove();

      // The correct-entry button remains hidden
  	});

  });

  $('#diary-entry').on('submit', '.like-form', function(e) {
    e.preventDefault();

    console.log(this);

    var request = $.ajax({
      method: $(this).attr('method'),
      url: $(this).attr('action'),
      //data: $(this).serialize(),
      context: $(this)
    });

    request.done(function(response) {
      console.log(response);
      $(this).find('.like-count').html(response.like_count);
      console.log(this);

      if ($(this).find('.like-btn').hasClass('btn-primary')) {
        $(this).find('.like-btn').removeClass('btn-primary');
      }
      else {
        $(this).find('.like-btn').addClass('btn-primary');
      }

    });
  });
});
