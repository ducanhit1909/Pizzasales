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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	`
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
.method {
	border-radius: .28125em;
	border: 1px solid #fff;
	padding: 50px 30px 50px 30px;
	color: white;
	text-transform: uppercase;
	font-weight: 800;
	text-decoration: none
}

.home_delivery {
	background: #0078ae;
}

.store_receive {
	background: #e51937
}

.odmethod {
	padding: 100px 10px 10px 80px;
}

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
</head>
<body style="overflow-x: hidden">
	<jsp:include page="menu.jsp" />
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="dotted3 os-animation" data-os-animation="bounceInLeft"
				data-os-animation-delay="1s"></div>
			<div class="special">
				<h2 class="os-animation" data-os-animation="bounceInDown"
					data-os-animation-delay="0.50s">Order Method</h2>
				<div class="dotted4 os-animation" data-os-animation="bounceInRight"
					data-os-animation-delay="1s"></div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${orderId}" id="odid">
	<div class="container">
		<div class="row odmethod">
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<div class="col-md-5">
					<button class="method home_delivery" id="1"><span><i
							class="fas fa-truck" style="font-size: 40px"></i></span> Home Delivery</button>
				</div>
				<div class="col-md-2" style="font-weight: bold;font-weight: 800">OR</div>
				<div class="col-md-5">
					<button class="method store_receive" id="2"><span><i
							class="fas fa-store" style="font-size: 40px"></i></span> Receive at
						store</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/order.js"></script>
</html>