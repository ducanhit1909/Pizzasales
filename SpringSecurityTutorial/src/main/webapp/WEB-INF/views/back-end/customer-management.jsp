<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Quản lý khách hàng</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<style type="text/css">
.form-group {
	margin-bottom: 0px;
}

.modal-body {
	height: 315px;
}
</style>
<script type="text/javascript" charset="utf-8">
                        $(document).ready(function() {
                            $('#example').DataTable();
                        });
                    </script>
<script>
                        $(document).ready(function() {
                            $('#email').on('keyup', function() {
                                $.ajax({
                                    url: '/pizza_sale/managements/customer_management/validate-email',
                                    data: {
                                        email: $('#email').val()
                                    },
                                    success: function(data) {
                                        if (data == "yes") {

                                            $("#email").css("border",
                                                "1px solid red");
                                            $('#error_email')
                                                .html(
                                                    'Email is exits!');
                                            //isValid = false;
                                        } else {
                                            $("#email").css("border",
                                                "1px solid green");
                                            $('#error_email')
                                                .html('');
                                            // isValid = true;
                                        }
                                    },
                                    error: function(err) {
                                        console.log(err);
                                    }
                                });
                            });

                            function validateEmail(sEmail) {
                                var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                                if (filter.test(sEmail)) {
                                    return true;
                                } else {
                                    return false;
                                }
                            }


                            $('#btnAdd').on('click', function() {
                                $.ajax({
                                    url: '/pizza_sale/managements/customer_management/validate-email',
                                    data: {
                                        email: $('#email').val()
                                    },
                                    success: function(data) {
                                        if (data == "no") {
                                            var isValid = true;
                                            if ($('#fullname').val() == '') {
                                                $("#fullname").css(
                                                    "border",
                                                    "1px solid red");
                                                $('#error_fullname')
                                                    .html(
                                                        'Full name is invalid!');
                                                isValid = false;
                                            }
                                            if ($('#email').val() == '' || !validateEmail($(
                                                    '#email').val())) {
                                                $("#email").css("border",
                                                    "1px solid red");
                                                $('#error_email')
                                                    .html(
                                                        'Email is invalid!');
                                                isValid = false;
                                            }
                                            if ($('#password').val() == '' || $('#password').val().length < 6) {
                                                $("#password").css(
                                                    "border",
                                                    "1px solid red");
                                                $('#error_password')
                                                    .html(
                                                        'Password must be at least 6 characters!');
                                                isValid = false;
                                            }
                                            if ($('#confirmPassWord').val() != $(
                                                    '#password').val()) {
                                                $("#confirmPassWord").css(
                                                    "border",
                                                    "1px solid red");
                                                $('#error_confirmpassword')
                                                    .html(
                                                        'Password incorrect!');
                                                isValid = false;
                                            }
                                            if ($('#city').val()=='ok') {
		                                        $("#city").css(
		                                            "border",
		                                            "1px solid red");
		                                        $('#error_city')
		                                            .html(
		                                                'Please choose city!');
		                                        isValid = false;
                                    		}
                                            if (isValid) {
                                                $.ajax({
                                                    url: '/pizza_sale/managements/customer_management/save',
                                                    type: 'post',
                                                    data: {
                                                        'fullName': $('#fullname').val(),
                                                        'email': $('#email').val(),
                                                        'password': $('#password').val(),
                                                        'confirmPassWord': $('#confirmPassWord').val(),
                                                        'cityId': $('#city').val(),
                                                        'districtId': $('#district').val()
                                                    },
                                                    success: function(data) {
                                                        if (data === 'ok') {
                                                            console.log(data);
                                                            $('#notify').html('Add user successfully!');
                                                            setTimeout(function() {
                                                                $('#notify').fadeOut();
                                                            }, 2000);
                                                            $('#FormAddCustomer').trigger("reset");
                                                        }
                                                    },
                                                    error: function(err) {
                                                        console.log('er')
                                                    }
                                                });
                                            }

                                        } else {

                                        }
                                    },
                                    error: function(err) {
                                        console.log(err);
                                    }
                                });

                            });

                            $('#FormAddCustomer').bind({
                                'keydown': function() {
                                    if ($('#fullname').val().length > 0) {
                                        $("#fullname").css(
                                            "border",
                                            "1px solid green");
                                        $('#error_fullname').html(
                                            '');
                                    }
                                    if ($('#email').val().length > 0 && !validateEmail($(
                                            '#email').val())) {
                                        $("#email").css("border",
                                            "1px solid green");
                                        $('#error_email').html('');
                                    }
                                    if ($('#password').val().length >= 6) {
                                        $("#password").css(
                                            "border",
                                            "1px solid green");
                                        $('#error_password').html(
                                            '');
                                    }
                                    if ($('#confirmPassWord').val() == $(
                                            '#password').val() && $('#password').val().length > 0) {
                                        $("#confirmPassWord").css(
                                            "border",
                                            "1px solid green");
                                        $('#error_confirmpassword')
                                            .html('');
                                    }
                                    if ($('#city').val()!= 'ok') {
                                        $("#city").css(
                                            "border",
                                            "1px solid green");
                                        $('#error_city').html(
                                            '');
                                    }
                                }
                            });
                        });
                    </script>
<script>
                        $(document).ready(function() {
                            $('#city').on('change', function() {
                                $.ajax({
                                    url: '/pizza_sale/managements/customer_management/select-city',
                                    data: {
                                        cityId: $('#city').val()
                                    },
                                    success: function(data) {
                                        console.log(data);
                                        var option;
                                        for (var i = 0; i < data.length; i++) {
                                            option += '<option value=' + data[i].districtId + '>' + data[i].districtName + '</option>'
                                        }
                                        $('select[id=district]').html(option);
                                    },
                                });
                            });
                        });
                    </script>
</head>

<body>
	<jsp:include page="admin_index.jsp"></jsp:include>
	<div class="container">
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"
							style="text-align: center; font-weight: bold;">Add new
							customer</h4>
					</div>
					<div class="modal-body">

						<form action="${saveURL}" method="post" class="form-horizontal"
							modelAttribute="user" id="FormAddCustomer">
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">Full name:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="fullname"
										name="fullname" placeholder="Please enter your name">
									<p id="error_fullname" style="color: red;"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">Email:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email" name="email"
										placeholder="Please enter your email">
									<p id="error_email" style="color: red;"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">Password:</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Please enter your password">
									<p id="error_password" style="color: red;"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">Confirm password: </label>
								<div class="col-sm-5">
									<input type="password" class="form-control"
										id="confirmPassWord" name="confirmPassWord"
										placeholder="Please enter confirm your password">
									<p id="error_confirmpassword" style="color: red;"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">City:</label>
								<div class="col-sm-5">
									<select class="form-control" id="city">
										<option value="ok">Chọn tỉnh/thành phố</option>
										<c:forEach items="${listCity}" var="listCity">
											<option value="${listCity.cityId}">${listCity.cityName}</option>
										</c:forEach>
									</select>
									<p id="error_city" style="color: red;"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2 col-sm-offset-2"
									for="email">District:</label>
								<div class="col-sm-5">
									<select class="form-control" id="district">
										<option></option>
									</select>
									<p id="error_district" style="color: red;"></p>
								</div>
							</div>
						</form>
						<div class="form-group1">
							<div class="col-sm-5 col-sm-offset-4">
								<button type="submit" class="btn btn-default" id="btnAdd">Submit</button>
							</div>
						</div>
						<div class="form-group1">
							<div class="col-sm-5 col-sm-offset-4">
								<p id="notify" style="color: green"></p>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="window.location.reload()"
							class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-default btn-sm"
			data-toggle="modal" data-target="#myModal">
			<span class="glyphicon glyphicon-plus"></span> Add
		</button>


		<table id="example" class="display" style="width: 100%">
			<thead>
				<tr>
					<th>User id</th>
					<th>Full name</th>
					<th>Email</th>
					<th>City</th>
					<th>District</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="customer">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.fullName}</td>
						<td>${customer.email}</td>
						<td>${customer.district.city.cityName}</td>
						<td>${customer.district.districtName}</td>
						<td>
							<button type="button" class="btn btn-default btn-sm sua-customer"
								id="${customer.id}" data-toggle="modal" title="Update"
								data-target="#modalUpdate${customer.id}">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="button" class="btn btn-default btn-sm"
								title="Delete" data-toggle="modal"
								data-target="#modalDelete${customer.id}">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${list}" var="customer">
					<div id="modalDelete${customer.id}" class="modal fade"
						role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"
										style="text-align: center; font-weight: bold;">Delete a
										customer</h4>
								</div>
								<div class="modal-body" style="text-align: center;">
									Are you sure delete this customer?
									<p id="notyfi${customer.id}" style="color: red;"></p>

								</div>
								<div class="modal-footer">
									<button id="xoa-${customer.id}" type="button"
										class="btn btn-default xoa-customer">Yes</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">No</button>
								</div>
							</div>
						</div>
					</div>
					<div id="modalUpdate${customer.id}" class="modal fade"
						role="dialog">
						<div class="modal-dialog modal-lg">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"
										style="text-align: center; font-weight: bold;">Update a
										customer</h4>
								</div>
								<div class="modal-body">
									<form action="${saveURL}" method="post" class="form-horizontal"
										modelAttribute="user" id="FormAddCustomer">
										<div class="form-group">
											<label class="control-label col-sm-2 col-sm-offset-2"
												for="email">Full name:</label>
											<div class="col-sm-5">
												<input type="text" class="form-control"
													id="fullname_update${customer.id}" name="fullname"
													placeholder="Please enter your name">
												<p id="error_fullname" style="color: red;"></p>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 col-sm-offset-2"
												for="email">Email:</label>
											<div class="col-sm-5">
												<input type="text" class="form-control"
													id="email_update${customer.id}" name="email"
													placeholder="Please enter your email">
												<p id="error_email" style="color: red;"></p>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 col-sm-offset-2"
												for="email">City:</label>
											<div class="col-sm-5">
												<select class="form-control" id="city_update${customer.id}">

													<c:forEach items="${listCity}" var="listCity">
														<option value="${listCity.cityId}">${listCity.cityName}</option>
													</c:forEach>
												</select>
												<p id="error_city" style="color: red;"></p>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 col-sm-offset-2"
												for="email">District:</label>
											<div class="col-sm-5">
												<select class="form-control" id="district">
													<option></option>
												</select>
												<p id="error_district" style="color: red;"></p>
											</div>
										</div>
									</form>
									<div class="form-group1">
										<div class="col-sm-5 col-sm-offset-4">
											<button type="submit" class="btn btn-default" id="btnAdd">Submit</button>
										</div>
									</div>
									<div class="form-group1">
										<div class="col-sm-5 col-sm-offset-4">
											<p id="notify" style="color: green"></p>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button id="xoa-${customer.id}" type="button"
										class="btn btn-default xoa-customer">Yes</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">No</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
                        $('.xoa-customer').on('click', function() {
                            var id = this.id.split('-')[1];
                            var timenotify = 1000;
                            $.ajax({
                                url: '/pizza_sale/managements/customer_management/delete/' + id,
                                success: function(data) {
                                    $('#notyfi' + id).html('Bạn đã xóa thành công');
                                    setTimeout(function() {
                                        $('#notyfi' + id).fadeOut(function() {
                                            window.location.reload();
                                        });
                                    }, timenotify);

                                },
                            });
                        });
                        $('.sua-customer').on('click', function() {
                        	var id = this.id;
                        	console.log(id);
                            $.ajax({
                                url: '/pizza_sale/managements/customer_management/update/'+id,
                                success: function(data) {
	                                console.log($('#city_update'+id));
	                                $('#fullname_update'+id).val(data.user.fullName);
	                                let arr = $('#city_update'+id)[0].options;
	                               for(let i = 0; i< arr.length; i++){
	                            	   let option = arr[i];
	                            	   if(parseInt(option.value) === data.city.cityId){
	                            		   console.log('ok');
	                            		   option.selected = 'selected';
	                            		   
	                            	   }
	                               }
	                                
	                                $('#email_update'+id).val(data.user.email);
                                },
                                error: function(err) {
                                    console.log('er')
                                }
                            });
                        });
                        // For demo to fit into DataTables site builder...
                        $('#example').removeClass('display').addClass(
                            'table table-striped table-bordered');
                    </script>
</body>

</html>