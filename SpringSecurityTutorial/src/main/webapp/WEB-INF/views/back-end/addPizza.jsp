<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pizza Managements</title>
</head>
<body class="app sidebar-mini rtl">
	<jsp:include page="menu.jsp" />
	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-edit"></i> Pizza Management
			</h1>
			<p>Add pizza</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Pizza Managements</li>
			<li class="breadcrumb-item"><a href="#">Add pizza</a></li>
		</ul>
	</div>
	<c:if test="${!empty success }">
		<p class="error">
			<c:out value="${success}" />
		</p>
	</c:if>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">Pizza informations</h3>
				<div class="tile-body">
					<form class="form-horizontal"
						action="${pageContext.request.contextPath}/managements/pizza_managements/add_pizza"
						method="POST" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="control-label col-md-3">Pizza name</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									placeholder="Enter pizza name" name="pizza_name" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-3">Pizza categories</label>
							<div class="col-md-8">
								<select name="category" id="" class="form-control">
									<c:forEach items="${categories}" var="category">
										<option value="${category.id}">${category.productCategory}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-3">Pizza toppings </label>
							<div class="col-md-8">
								<c:forEach items="${toppings}" var="topping">
									<div class="col-md-4">
										<input class="form-check-input" type="checkbox"
											name="toppings" value="${topping.id}">${topping.toppingType}
									</div>
								</c:forEach>
							</div>

						</div>
						<div class="form-group row">
							<div class="col-md-3"></div>
							<div class="col-md-8">
								<c:if test="${!empty err_topping }">
									<p class="error">
										<c:out value="${err_topping }" />
									</p>
								</c:if>
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-3">Pizza sizes </label>
							<div class="col-md-8">
								<c:forEach items="${sizes}" var="size">
									<div class="col-md-1">
										<input class="form-check-input" type="checkbox" name="sizes"
											value="${size.id}">${size.size}
									</div>
								</c:forEach>
							</div>

						</div>

						<div class="form-group row">
							<div class="col-md-3"></div>
							<div class="col-md-8">
								<c:if test="${!empty err_size }">
									<p class="error">
										<c:out value="${err_size }" />
									</p>
								</c:if>
							</div>

						</div>


						<div class="form-group row">
							<label class="control-label col-md-3">Pizza image</label>
							<div class="col-md-8">
								<input class="form-control" type="file" name="pizza_image"
									required>
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-3">Pizza description</label>
							<div class="col-md-8">
								<textarea class="form-control" rows="4"
									placeholder="Enter pizza's description" name="description" required></textarea>
							</div>
						</div>

						<div class="tile-footer">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-9 col-md-offset-3">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-fw fa-lg fa-check-circle"></i>Add
									</button>
									&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i
										class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
								</div>
							</div>
						</div>

					</form>
				</div>

			</div>
		</div>
		<div class="clearix"></div>

	</div>
	</main>
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
</body>
</html>