<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
</head>
<style>
.hello {
	white-space: nowrap;
	color: red;
	font-size: 19px;
}
</style>
<body>
	<header>
		<div class="container">
			<div class="row clearfix" id="home">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<img alt=""
						src="${pageContext.request.contextPath}/resources/images/logo/logo.png"
						width="22%">
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="contact">
						<p>
							Have any questions? Feel free for call us!<span class="number"><a
								href="#">18000900</a></span><span class="time">(11 AM-11 PM)</span>
						</p>
					</div>

				</div>
				<div class="col-lg-9 col-md-6 col-sm-6 col-xs-12"></div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12"
					style="padding-top: 10px">
					<security:authorize access="hasRole('USER')">
						<div class="hello">
							<p>
								Hello:
								<security:authentication property="principal.username" />
							</p>
						</div>
						<div>Let's order right now!</div>
					</security:authorize>
				</div>
			</div>
		</div>
	</header>

	<section class="saction1">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="menu">
						<div class="mobile-nav-container"></div>
						<nav>
							<ul>
								<li><a href="<c:url value="/"/>">Home</a></li>
								<li><a href="<c:url value="/products"/>">Pizza </a></li>
								<li><a href="#contact">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="login">
						<ul>
							<security:authorize access="!isAuthenticated()">
								<li><a href="<c:url value="/signin"/>">Login</a></li>
								<li><a href="<c:url value="/signup"/>">Register</a></li>
							</security:authorize>

							<security:authorize access="hasRole('ADMIN')">
								<li><a href="<c:url value="/managements/admin_managements"/>"><span><i class="fas fa-user-shield"></i></span> Admin</a></li>
							</security:authorize>

							<security:authorize access="isAuthenticated()">
								<li><a href="<c:url value="/logout"/>">Logout</a></li>
							</security:authorize>

							<li><a
								href="${pageContext.request.contextPath}/order/orderDetail"><i
									class="fas fa-shopping-cart" style="font-size: 28px;"></i> <span
									class="badge badge-light"><c:out
											value="${sessionScope.orderJson.quantity}" /></span></a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>