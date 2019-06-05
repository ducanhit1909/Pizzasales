var v=$('table tr').length;
console.log(v)
	if(parseInt(v)==1){
		$('button[name=orderbtn]').prop("disabled",true);
	}
$(document).ready(
		function() {
			/* add order */
			$('form[name=orderForm]').submit(function(e) {
				e.preventDefault();
				let form = $(this);
				console.log(form.serialize())
				$.ajax({
					type : "GET",
					data : form.serialize(),
					url : "/pizza_sale/order/addtocart",
					success : function(obj) {
						console.log(obj.quantity);
						if (obj.access == false) {
							window.location.href = '/pizza_sale/signin';
						} else {
							$('.badge').text(obj.quantity);
							$('#tquantity').text(data.quantity)
							$('#tprice').text(data.totalPriceOfOrder)
						}
					},
					error : function(xhr) {
						console.log(xhr);
					}
				})
			});
			/* Change order */
			$('table tbody')
					.on(
							'change',
							'input[type=number]',
							function() {
								// Set maximum and minimum for
								// input[type=number]
								let value = parseInt($(this).val());
								let maxValue = parseInt($(this).attr('max'));
								let minValue = parseInt($(this).attr('min'));
								console.log(typeof maxValue);
								if (value > maxValue) {
									$(this).val(maxValue);
								}
								if (value < minValue) {
									$(this).val(minValue);
								}
								//
								let temp = $(this).closest('tr');
								let productId = temp.find('td:eq(1)').attr(
										'class');
								let productToppingId = temp.find('td:eq(2)')
										.attr('class');
								let productSizeId = temp.find('td:eq(3)').attr(
										'class');
								let quantity = $(this).val();
								let orderId = $('#orderId').val();
								$.ajax({
									type : 'GET',
									url : '/pizza_sale/order/update?orderId='
											+ orderId + '&productId='
											+ productId + '&productToppingId='
											+ productToppingId
											+ '&productSizeId=' + productSizeId
											+ '&quantity=' + quantity,
									success : function(data) {
										$('.badge').text(data.quantity);
										$('#tquantity').text(data.quantity)
										$('#tprice').text(
												data.totalPriceOfOrder)
									}
								})
							});
			/* Delete order */
			$('input[name=delete]').click(function() {
				let tr = $(this).closest('tr');
				let obj = {};
				obj['orderId'] = $('#orderId').val();
				obj['productId'] = tr.find('td:eq(1)').attr('class');
				obj['productToppingId'] = tr.find('td:eq(2)').attr('class');
				obj['productSizeId'] = tr.find('td:eq(3)').attr('class');
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : 'POST',
					url : '/pizza_sale/order/delete',
					data : JSON.stringify(obj),
					success : function(data) {
						tr.remove();
						alert('remove product successfully!');
						$('.badge').text(data.quantity);
						$('#tquantity').text(data.quantity);
						$('#tprice').text(data.totalPriceOfOrder);
						//disable delete button
						var v=$('table tr').length;
						if(parseInt(v)==1){
							$('button[name=orderbtn]').prop("disabled",true);
						}
					}
				})
			});
			
			$('.method').click(function(){
				$.ajax({
					url:'/pizza_sale/order/place_order?orderId='+$('#odid').val()+'&'+'orderMethod='+$(this).attr('id'),
					type:'POST',
					success:function(data){
						alert(data);
						location.href ='/pizza_sale/';
					}
				})
			})

		});
