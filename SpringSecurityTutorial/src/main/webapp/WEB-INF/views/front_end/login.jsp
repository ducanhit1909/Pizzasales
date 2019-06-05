<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
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
</head>
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
</style>
<body style="overflow-x: hidden">
	<jsp:include page="menu.jsp" />
	<!-- This message will display if the user confirm token through mail -->
	<header style="color: red; font-size: 25px">
		<p id="success_message">
			<c:if test="${not empty tokenMessage}">
	      			${tokenMessage}
	      		</c:if>
		</p>
	</header>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="dotted3 os-animation" data-os-animation="bounceInLeft"
				data-os-animation-delay="1s"></div>
			<div class="special">
				<h2 class="os-animation" data-os-animation="bounceInDown"
					data-os-animation-delay="0.50s">Login to system</h2>
				<div class="dotted4 os-animation" data-os-animation="bounceInRight"
					data-os-animation-delay="1s"></div>
			</div>
		</div>
	</div>
	<div class="login_content">
		<div class="container">
			<div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign In</div>
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							<a href="#">Forgot password?</a>
						</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">
						<c:if test="${not empty errorLoginMessage}">
							<p class="errorMessage" style="color: red">
								<strong><c:out value="${errorLoginMessage}" /></strong>
							</p>
						</c:if>
						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<form id="loginform" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/loginProcesses"
							method="POST">

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									id="login-username" type="text" class="form-control"
									name="username" value="" placeholder="username or email"
									required>
							</div>

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									id="login-password" type="password" class="form-control"
									name="password" placeholder="password" required>
							</div>

							<div style="margin-top: 10px" class="form-group">
								<!-- Button -->

								<div class="col-sm-12 controls">
									<button class="btn btn-primary" type="submit">Login</button>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-12 control">
									<div
										style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
										Don't have an account! <a
											href="${pageContext.request.contextPath}/signup"> Sign Up
											Here </a>
									</div>
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
<script>
    	jQuery(document).ready(function(){
    		$('.errorMessage, #success_message').fadeOut(5500);
    	})
</script>
</html>