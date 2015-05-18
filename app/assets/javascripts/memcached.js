$(function() {
  $('.btn-mem-action').on('click', function() {
    var type = $(this).data('type');
    var to_url;

    if (type == 'index') {
      to_url = '/';
    }
    else if (type == 'delete' || type == 'delete_prural') {
      to_url = '/delete';
    }

    $('#mem_form').attr('action', to_url);
    $('#mem_form').submit();
    return false;
  });
});
