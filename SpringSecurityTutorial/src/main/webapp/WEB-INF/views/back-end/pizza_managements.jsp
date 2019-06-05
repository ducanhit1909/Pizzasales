<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pizzas</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="app sidebar-mini rtl">
	<jsp:include page="menu.jsp" />
	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Pizza Managements
			</h1>
			<p>Pizza list</p>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Pizza_Managements</li>
			<li class="breadcrumb-item active"><a href="#">Pizza list</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<table class="table table-hover table-bordered" id="sampleTable">
						<thead>
							<tr>
								<th>Pizza name</th>
								<th>Pizza categories</th>
								<th>Pizza toppings</th>
								<th>Pizza sizes</th>
								<th>Pizza price</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pizzas_admin}" var="pizza">
								<tr>
									<td><c:out value="${pizza.name}" /></td>
									<td><c:out
											value="${pizza.productCategory.productCategory}" /></td>

									<td><c:forEach items="${pizza.productToppings}"
											var="productTopping">
                    		${productTopping.toppingType} ;
                    		</c:forEach></td>

									<td>
										<ul>
											<c:forEach items="${pizza.productSizes}" var="productSize">
												<li>${productSize.sizeEntity.size}</li>
											</c:forEach>
										</ul>
									</td>

									<td>
										<ul>
											<c:forEach items="${pizza.productSizes}" var="productPrice">
												<li><fmt:formatNumber>${productPrice.price}</fmt:formatNumber>
													VNĐ</li>
											</c:forEach>
										</ul>
									</td>

									<td><a href="${pageContext.request.contextPath}/managements/pizza_managements/edit_pizza?pizzaId=${pizza.id}"><button
												class="btn btn-primary">
												<i class="far fa-edit"></i>
											</button></a>
										<button class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<script src="${pageContext.request.contextPath}/resources/backend/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/backend/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="${pageContext.request.contextPath}/resources/backend/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<!-- Data table plugin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/backend/js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/backend/js/plugins/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">$('#sampleTable').DataTable();</script>
	<!-- Google analytics script-->
</body>
</html>