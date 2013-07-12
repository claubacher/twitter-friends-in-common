$(document).ready(function() {
	var form = $('#compare');
	form.on('submit', function(event) {
		event.preventDefault();
		var data = form.serialize();
		$.post('/play', data, function(response) {
			form.closest('div').append(response);
		});
	});
});
