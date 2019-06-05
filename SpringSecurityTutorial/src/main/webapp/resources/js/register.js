jQuery(document).ready(
		function() {
			$('input[name=fullName]').focus();
			$('select[name=cityId]').change(
					function() {
						$.ajax({
							url : '/pizza_sale/signup/getDistrict?cityId='
									+ $(this).val(),
							type : 'GET',
							success : function(district) {
								let option;
								for (i = 0; i < district.length; i++) {
									option += '<option value='
											+ district[i].districtId + '>'
											+ district[i].districtName
											+ '</option>'
								}
								$('select[name=districtId]').html(option);
							}
						})
					});
			function sendDataAjax(){
				var listErrorReturn=[];
				let dataForm=$('form[id=signupform]').serialize();
				console.log(dataForm);
				$('.errorClass').empty();
				$('.input-form').removeClass('inputError');
				$('.input-form').css('border-color','')
				$.ajax({
					url:'/pizza_sale/signup/form_validate',
					data:dataForm,
					method:'POST',
					success:function(userEntity){
						if(userEntity.error){
							jQuery.map(userEntity.errors,function(value,i){
								listErrorReturn.push(i);
								$('#'+i).after('<p class=errorClass>'+value+'</p>');
								$('#'+i).addClass('inputError').css('border-color','red');
							})
							$('#'+listErrorReturn[0]).focus();
							console.log(listErrorReturn)
						}else{
							alert("the active token is send to your email, please check your email to confirm it!");
							location.href ='/pizza_sale/';
						}
					}
				})
			}
			
			$('#btn-signup').on('click',function(e){
				e.preventDefault();
				sendDataAjax();
			});
			$('form[id=signupform]').on('keyup', function(e) {
				if (e.keyCode === 13) { // 13 === Enter keycode
					sendDataAjax();
				}
			});
		})