<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
<title>Login &amp; Signup forms in panel - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<style>
.login_content {
	background:
		url("${pageContext.request.contextPath}/resources/images/background/product_background.jpg")
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.errorClass {
	color: red;
}
</style>
</head>
<body style="overflow-x: hidden">
	<jsp:include page="menu.jsp" />
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="dotted3 os-animation" data-os-animation="bounceInLeft"
				data-os-animation-delay="1s"></div>
			<div class="special">
				<h2 class="os-animation" data-os-animation="bounceInDown"
					data-os-animation-delay="0.50s">Register</h2>
				<div class="dotted4 os-animation" data-os-animation="bounceInRight"
					data-os-animation-delay="1s"></div>
			</div>
		</div>
	</div>
	<div class="login_content">
		<div class="container">
			<div id="signupbox" style="margin-top: 50px"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 85%; position: relative; top: -10px">
							<a id="signinlink"
								href="${pageContext.request.contextPath}/signin">Sign In</a>
						</div>
					</div>
					<div class="panel-body">
						<form id="signupform" class="form-horizontal" role="form" method="POST">

							<div id="signupalert" style="display: none"
								class="alert alert-danger">
								<p>Error:</p>
								<span></span>
							</div>

							<div class="form-group">
								<label for="firstname" class="col-md-3 control-label">Full
									Name</label>
								<div class="col-md-9">
									<input type="text" class="form-control input-form" id="fullName" name="fullName"
										placeholder="First Name">
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-md-3 control-label">Email</label>
								<div class="col-md-9">
									<input type="text" class="form-control input-form" name="email" id="email"
										placeholder="Email Address">
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-3 control-label">Password</label>
								<div class="col-md-9">
									<input type="password" class="form-control input-form" name="password" id="password"
										placeholder="Password">
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-3 control-label">Confirm
									Password</label>
								<div class="col-md-9">
									<input type="password" class="form-control input-form" name="confirmPassWord" id="confirmPassWord"
										placeholder="Confirm Password">
								</div>
							</div>

							<div class="form-group">
								<label for="city" class="col-md-3 control-label">City</label>
								<div class="col-md-9">
									<select  class="form-control input-form" name="cityId" id="cityId">
									<option value="0">Select your city</option>
										<c:forEach items="${citys}" var="city">
											<option value="${city.cityId}">${city.cityName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="city" class="col-md-3 control-label">District</label>
								<div class="col-md-9">
									<select class="form-control input-form" name="districtId" id="districtId">
									<option value="0"></option>
										<option></option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Detailed
									Address</label>
								<div class="col-md-9">
									<textarea rows="4"  cols="45" class="district" name="address" id="address"></textarea>
								</div>
							</div>

						<div class="form-group">
								<!-- Button -->
								<div class="col-md-offset-3 col-md-9">
									<button id="btn-signup" type="button" class="btn btn-info">
										<i class="icon-hand-right"></i> &nbsp Sign Up
									</button>
								</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="saction9" id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="email">&copy; All right reserved 2019 / PizzaHPN
					</div>

				</div>

			</div>
		</div>
	</footer>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/register.js"></script>
</html>