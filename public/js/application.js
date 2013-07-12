$(document).ready(function() {
	var form = $('#compare');
	form.on('submit', function(event) {
		event.preventDefault();
		var data = form.serialize();
		$.ajax({
			url: '/play',
			type: 'post',
			data: data, 
			beforeSend: function() {
				$('.results').remove();
				form.closest('div').append("<div class='loading'>loading...</div>");
			},
			success: function(response) {
				$('.loading').remove();
				form.closest('div').append(response);
			},
			error: function() {
				$('.loading').remove();
				form.closest('div').append("<div class='results'>twitter is taking too long to respond. try again later.</div>");
			}
		});
	});
});
