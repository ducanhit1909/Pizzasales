<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customers</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.form-group {
	margin-bottom: 0rem !important;
}
</style>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Customer Managements
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Customer_Managements</li>
			<li class="breadcrumb-item active"><a href="#">Customer list</a></li>
		</ul>
	</div>
	<!-- modal -->
	<div class="modal fade" id="modalAdd" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 style="text-align: center;">Add new customer</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="FormAddCustomer">
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">Full
								name</label>
							<div class="col-md-6">
								<input class="form-control" type="text"
									placeholder="Enter full name" id="fullname" name="fullname">
								<p id="error_fullname" style="color: red;"></p>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">Email</label>
							<div class="col-md-6">
								<input class="form-control" type="text"
									placeholder="Enter email address" id="email" name="email">
								<p id="error_email" style="color: red;"></p>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">Password</label>
							<div class="col-md-6">
								<input class="form-control" type="password"
									placeholder="Enter your password" id="password" name="password">
								<p id="error_password" style="color: red;"></p>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">Confirm
								password</label>
							<div class="col-md-6">
								<input class="form-control" type="password"
									placeholder="Enter your password" id="confirmPassWord"
									name="confirmPassWord">
								<p id="error_confirmpassword" style="color: red;"></p>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">City</label>
							<div class="col-md-6">
								<select class="form-control" id="city">
									<option value="ok">Chọn tỉnh/thành phố</option>
									<c:forEach items="${listCity}" var="listCity">
										<option value="${listCity.cityId}">${listCity.cityName}</option>
									</c:forEach>
								</select>
								<p id="error_city" style="color: red;"></p>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2 offset-md-2">District</label>
							<div class="col-md-6">
								<select class="form-control" id="district">
									<option></option>
								</select>
							</div>
						</div>
						<div class="form-groupp row" style="margin-top: 10px;">
							<label class="control-label col-md-2 offset-md-2"></label>
							<div class="col-md-6">
								<button id="btnAdd" class="btn btn-success" type="button">Submit</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#modalAdd">
						<i class="fa fa-plus" aria-hidden="true"></i> Add new customer
					</button>
					<br> <br>
					<table class="table table-hover table-bordered" id="sampleTable">
						<thead>
							<tr>
								<th>User id</th>
								<th>Full name</th>
								<th>Email</th>
								<th>City</th>
								<th>District</th>
								<th>Actions</th>
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
									<td><button title="Edit customer"
											class="btn btn-primary sua-customer" id="${customer.id}"
											data-toggle="modal" data-target="#modalUpdate${customer.id}">
											<i class="far fa-edit"></i>
										</button>
										<button title="Delete customer" class="btn btn-danger"
											data-toggle="modal" data-target="#modalDelete${customer.id}">
											<i class="far fa-trash-alt"></i>
										</button></td>
								</tr>
							</c:forEach>
							<c:forEach items="${list}" var="customer">
								<div id="modalDelete${customer.id}" class="modal fade"
									role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title"
													style="text-align: center; font-weight: bold;">Delete
													a customer</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body" style="text-align: center;">Are
												you sure delete this customer?</div>
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
												<h4 class="modal-title"
													style="text-align: center; font-weight: bold;">Update
													a customer</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" id="FormAddCustomer">
													<div class="form-group row">
														<label class="control-label col-md-2 offset-md-2">Full
															name</label>
														<div class="col-md-6">
															<input class="form-control" type="text"
																placeholder="Enter full name" id="fullname_update${customer.id}"
																name="fullname">
															<p id="error_fullname" style="color: red;"></p>
														</div>
													</div>
													<div class="form-group row">
														<label class="control-label col-md-2 offset-md-2">Email</label>
														<div class="col-md-6">
															<input class="form-control" type="text"
																placeholder="Enter email address" id="email_update${customer.id}"
																name="email">
															<p id="error_email" style="color: red;"></p>
														</div>
													</div>
													<div class="form-group row">
														<label class="control-label col-md-2 offset-md-2">City</label>
														<div class="col-md-6">
															<select class="form-control" id="city_update">
																<c:forEach items="${listCity}" var="listCity">
																	<option value="${listCity.cityId}">${listCity.cityName}</option>
																</c:forEach>
															</select>
															<p id="error_city" style="color: red;"></p>
														</div>
													</div>
													<div class="form-group row">
														<label class="control-label col-md-2 offset-md-2">District</label>
														<div class="col-md-6">
															<select class="form-control" id="district_update">
																<option></option>
															</select>
														</div>
													</div>
													<div class="form-groupp row" style="margin-top: 10px;">
														<label class="control-label col-md-2 offset-md-2"></label>
														<div class="col-md-6">
															<button id="btnAdd" class="btn btn-success" type="button">Submit</button>
														</div>
													</div>
												</form>
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
			</div>
		</div>
	</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<script
		src="${pageContext.request.contextPath}/resources/backend/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/backend/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/backend/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/backend/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script
		src="${pageContext.request.contextPath}/resources/backend/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<!-- Data table plugin-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/backend/js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/backend/js/plugins/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$('#sampleTable').DataTable();
	</script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<!-- Google analytics script-->
	<script>
    $(document).ready(function () {
        $('#email').on('keyup', function () {
            $.ajax({
                url: '/pizza_sale/managements/validate-email',
                data: {
                    email: $('#email').val()
                },
                success: function (
                data) {
                    if (data == "yes") {
                        $("#email").css("border", "1px solid red");
                        $('#error_email').html('Email is exits!');
                        //
                        isValid = false;
                    } else {
                        $("#email").css("border", "1px solid green");
                        $('#error_email').html('');
                        //
                        isValid = true;
                    }
                },
                error: function (
                err) {
                    console.log(err);
                }
            });
        });
        $('#city').on('change', function () {
            $.ajax({
                url: '/pizza_sale/managements/select-city',
                data: {
                    cityId: $('#city').val()
                },
                success: function (
                data) {
                    console.log(data);
                    var option;
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value=' + data[i].districtId + '>' + data[i].districtName + '</option>'
                    }
                    $('select[id=district]').html(
                    option);
                },
            });
        });
        $('#city_update').on('change', function () {
            $.ajax({
                url: '/pizza_sale/managements/select-city',
                data: {
                    cityId: $('#cityupdate').val()
                },
                success: function (
                data) {
                    console.log(data);
                    var option;
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value=' + data[i].districtId + '>' + data[i].districtName + '</option>'
                    }
                    $('select[id=district_update]').html(
                    option);
                },
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
        $('#btnAdd').click(function () {
            $.ajax({
                url: '/pizza_sale/managements/validate-email',
                data: {
                    email: $('#email').val()
                },
                success: function (
                data) {
                    if (data == "no") {
                        var isValid = true;
                        if ($('#fullname').val() == '') {
                            $("#fullname").css("border", "1px solid red");
                            $('#error_fullname').html('Full name is invalid!');
                            isValid = false;
                        }
                        if ($('#email').val() == '' || !validateEmail($('#email').val())) {
                            $("#email").css("border", "1px solid red");
                            $('#error_email').html('Email is invalid!');
                            isValid = false;
                        }
                        if ($('#password').val() == '' || $('#password').val().length < 6) {
                            $("#password").css("border", "1px solid red");
                            $('#error_password').html('Password must be at least 6 characters!');
                            isValid = false;
                        }
                        if ($('#confirmPassWord').val() != $('#password').val()) {
                            $("#confirmPassWord").css("border", "1px solid red");
                            $('#error_confirmpassword').html('Password incorrect!');
                            isValid = false;
                        }
                        if ($('#city').val() == 'ok') {
                            $("#city").css("border", "1px solid red");
                            $('#error_city').html('Please choose city!');
                            isValid = false;
                        }
                        if (isValid) {
                            $.ajax({
                                url: '/pizza_sale/managements/save',
                                type: 'post',
                                data: {
                                    'fullName': $('#fullname').val(),
                                    'email': $('#email').val(),
                                    'password': $('#password').val(),
                                    'confirmPassWord': $('#confirmPassWord').val(),
                                    'cityId': $('#city').val(),
                                    'districtId': $('#district').val()
                                },
                                success: function (
                                data) {
                                    if (data === 'ok') {
                                        console.log(data);
                                        window.location.reload();
                                        alert("Bạn đã thêm khách hàng thành công");
                                    }
                                },
                                error: function (
                                err) {
                                    console.log('er')
                                }
                            });
                        }
                    } else {
                    }
                },
                error: function (
                err) {
                    console.log(err);
                }
            });
        });
        $('#FormAddCustomer').bind({
            'keydown': function () {
                if ($('#fullname').val().length > 0) {
                    $("#fullname").css("border", "1px solid green");
                    $('#error_fullname').html('');
                }
                if ($('#email').val().length > 0 && !validateEmail($('#email').val())) {
                    $("#email").css("border", "1px solid green");
                    $('#error_email').html('');
                }
                if ($('#password').val().length >= 6) {
                    $("#password").css("border", "1px solid green");
                    $('#error_password').html('');
                }
                if ($('#confirmPassWord').val() == $('#password').val() && $('#password').val().length > 0) {
                    $("#confirmPassWord").css("border", "1px solid green");
                    $('#error_confirmpassword').html('');
                }
                if ($('#city').val() != 'ok') {
                    $("#city").css("border", "1px solid green");
                    $('#error_city').html('');
                }
            }
        });
    })
</script>
    <script type="text/javascript">
        $('.xoa-customer').on('click', function () {
            var id = this.id.split('-')[1];
            var timenotify = 1000;
            $.ajax({
                url: '/pizza_sale/managements/delete/'+id,
                success: function (data) {
                    alert("Bạn đã xóa thành công")
                    window.location.reload();
                },
            });
        });
        $('.sua-customer').on('click', function () {
            var id = this.id;
            //console.log(id);
            $.ajax({
                url: '/pizza_sale/managements/update/' + id,
                success: function (data) {
                    $('#fullname_update' + id).val(data.user.fullName);
                    $('#email_update' + id).val(data.user.email);
                                    },
                error: function (err) {
                    console.log('er')
                }
            });
        });
        //
        
        $('#example').removeClass('display').addClass('table table-striped table-bordered');
    
    </script>
</body>
</html>