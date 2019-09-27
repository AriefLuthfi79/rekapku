$(document).on('turbolinks:load', function() {
  $("#product-datatable").each(function(){
    $(this).DataTable({
      processing: true,
      serverSide: true,
      ajax: $(this).data('url')
    });
  });

  $('#modal-product').on('show.bs.modal', function() {
  	$('.code').click(function() {
  		var d = new Date();
  		var time = d.getTime();
  		$('#productCode').val(time+rand());
  	});
  });
});

var rand = function() {
	return Math.random().toString(36).substr(2, 4).toUpperCase();
}