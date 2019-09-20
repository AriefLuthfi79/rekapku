$(document).on('turbolinks:load', function() {
	$("#product-datatable").DataTable({
		ajax: { 
			data: $(this).data('url')
		},
		serverSide: true
	});
});