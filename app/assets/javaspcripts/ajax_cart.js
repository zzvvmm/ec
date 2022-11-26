$(document).ready(function(){
  var cfrsToken = $('[name="csrf-token"]').attr('content');
  $('.change-quatity').change(function(){
    var id = $(this).data('id')
    var quantity = $(this).val();
    $.ajax({
      url: '/carts/update_cart/' + id,
      method: 'PUT',
      data: {quantity: quantity},
      headers: {'X-CFRS-Token': cfrsToken}
    });
  });

  $('.remove-from-cart').click(function(){
    var id = $(this).data('id')
    $.ajax({
      url: '/carts/remove/' + id,
      method: 'DELETE',
      headers: {'X-CFRS-Token': cfrsToken}
    });
  });
})
