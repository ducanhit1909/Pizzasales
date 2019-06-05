<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Quản lý khách hàng</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
<script>
$(document).ready(function() {
		$('#email').on('keyup',function(){
			$.ajax({
				url: '/pizza_sale/user_management/validate-email',
				data:{
					email:  $('#email').val()
				},
				success: function(data){
					console.log(data);
				},
				error: function(err){
					console.log(err);
				}
			});
		});
	
        $('#FormAddCustomer')
            .bind({
                'submit': function() {
                    if ($('#firstname').val() == '') {
                        $("#firstname").css(
                            "border",
                            "1px solid red");
                        $('#error_firstname')
                            .html(
                                'First name is invalid!');
                        return false;
                    }
                    if ($('#lastname').val() == '') {
                        $("#lastname").css(
                            "border",
                            "1px solid red");
                        $('#error_lastname')
                            .html(
                                'Last name is invalid!');
                        return false;
                    }
                    if ($('#email').val() == '') {
                        $("#email").css("border",
                            "1px solid red");
                        $('#error_email')
                            .html(
                                'Email is invalid!');
                        return false;
                    }
                    if ($('#password').val() == '' || $('#password').val().length < 6) {
                        $("#password").css(
                            "border",
                            "1px solid red");
                        $('#error_password')
                            .html(
                                'Password must be at least 6 characters!');
                        return false;
                    }
                    if ($('#firstname').val() == '') {
                        $("#firstname").css(
                            "border",
                            "1px solid red");
                        $('#error_firstname')
                            .html(
                                'Bạn chưa nhập email');
                        return false;
                    }
                    return true;
                },
                'keydown': function() {
                    if ($('#firstname').val().length > 0) {
                        $("#firstname").css(
                            "border",
                            "1px solid green");
                        $('#error_firstname').html(
                            '');
                    }
                    if ($('#lastname').val().length > 0) {
                        $("#lastname").css(
                            "border",
                            "1px solid green");
                        $('#error_lastname').html(
                            '');
                    }
                    if ($('#email').val().length > 0) {
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
                    /* if ($('#tenkhachhang').val().length > 0) {
												$("#tenkhachhang").css("border", "1px solid green");
												$('#error_tenkhachhang').html('');
											}
											if ($('#password').val().length > 0) {
												$("#password").css("border", "1px solid green");
												$('#error_password').html('');
											}
											if ($('#confirm_password').val() == $('#password').val()) {
												$("#confirm_password").css("border", "1px solid green");
												$('#error_confirm_password').html('');

											} */

                }
            });
    });
</script>

</head>

<body>
	<jsp:include page="admin_index.jsp"></jsp:include>

	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">Add new customer</div>
			<div class="panel-body">
				<spring:url value="/save" var="saveURL"></spring:url>
				<form action="${saveURL}" method="post" modelAttribute="user"
					id="FormAddCustomer">
					<div class="form-group">
						<label for="exampleInputPassword1">First name</label> <input
							type="text" class="form-control" id="firstname" name="firstName"
							placeholder="Please enter your first name">
						<p id="error_firstname" style="color: red;"></p>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Last name</label> <input
							type="text" class="form-control" id="lastname" name="lastName"
							placeholder="Please enter your last name">
						<p id="error_lastname" style="color: red;"></p>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="Please enter your email">
						<p id="error_email" style="color: red;"></p>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Please enter your password">
						<p id="error_password" style="color: red;"></p>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Confirm Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							name="confirmPassWord"
							placeholder="Please enter confirm your password">
						<p id="error_confirmpassword" style="color: red;"></p>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

			</div>
		</div>


	</div>

	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
</body>

</html>