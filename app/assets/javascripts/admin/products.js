$(document).on('turbolinks:load', function() {
  $("#product-datatable").each(function(){
    $(this).DataTable({
      processing: true,
      serverSide: true,
      ajax: $(this).data('url')
    });
  });
});