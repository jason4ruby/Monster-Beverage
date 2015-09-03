$(document).ready(function() {
  var products = [];

  $("#checkout-btn").click(function(event) {
    $("input:checkbox").each(function() {
      if (this.checked) {
        products.push(this.name)
      }
    });

    //$.ajax({
    //    url : "/orders/new",
    //    type : "post",
    //    data : { data_value: JSON.stringify(products) }
    //});

  })

  $(function() {
    return window.broadcast_channel.bind('total_order_shipped', function(event) {
      return $('#total_order_shipped').html(event.value);
    });
  });

  $(function() {
    return window.broadcast_channel.bind('total_units_sold', function(event) {
      return $('#total_units_sold').html(event.value);
    });
  });
  

});
