<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit pizza informations</title>
</head>
<body class="app sidebar-mini rtl">
	<jsp:include page="menu.jsp" />
	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-edit"></i> Pizza Management
			</h1>
			<p>Edit pizza</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Pizza Managements</li>
			<li class="breadcrumb-item"><a href="#">Edit pizza
					informations</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">Pizza informations</h3>
				 <c:if test="${!empty success}">
  	<h3 class="error"><c:out value="${success}"/></h3>
  </c:if>
				<div class="tile-body">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/managements/pizza_managements/edit_pizza" method="POST" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="control-label col-md-3">Pizza name</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="pizzaName"
									placeholder="Enter pizza name" value="${product.name}">
							</div>
						</div>
						<input type="hidden" value="${product.id}" name="productId">
						<div class="form-group row">
							<label class="control-label col-md-3">Pizza categories</label>
							<div class="col-md-8">
								<select name="pizzaCategory" id="" class="form-control">
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
								<div class="col-md-8">
								<c:if test="${!empty topping_err}">
									<p class="error">
										<c:out value="${topping_err}"/>
									</p>
								</c:if>
							</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-3">Pizza sizes </label>
							<div class="col-md-8">
								<div class="row">
									<c:forEach items="${product.productSizes}" var="productSize">
										<div class="col-md-1">
											<input class="form-check-input sizes" type="checkbox"
												value="${productSize.sizeEntity.id}" name="size" checked onclick="return false;">${productSize.sizeEntity.size}
										</div>
										<div class="col-md-3">
											<input class="form-control" type="number"
												placeholder="Enter pizza price" name="price" step="0.01" value="${productSize.price}">
										</div>
									</c:forEach>
								</div>
								<br>
								<div class="col-md-3"></div>
								
							<div class="col-md-8">
								<c:if test="${!empty price_err}">
									<p class="error">
										<c:out value="${price_err}"/>
									</p>
								</c:if>
							</div>
							
							</div>
							
						</div>
						
						
						<div class="form-group row">
							<label class="control-label col-md-3">Pizza image</label>
							<div class="col-md-8">
								<input class="form-control" type="file" name="pizza_image">
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-3">Pizza description</label>
							<div class="col-md-8">
								<textarea class="form-control" rows="4"
									placeholder="Enter pizza's description" name="description"required>${product.description}</textarea>
							</div>
						</div>

					<div class="tile-footer">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-9 col-md-offset-3">
							<button class="btn btn-primary" type="submit">
								<i class="fa fa-fw fa-lg fa-check-circle"></i>Update
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
</body>
	<script src="${pageContext.request.contextPath}/resources/backend/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="${pageContext.request.contextPath}/resources/backend/js/plugins/pace.min.js"></script>
</html>