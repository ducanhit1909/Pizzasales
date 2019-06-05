<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Managements</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/admin_managements">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/customer_management/customer-management">Customer Managements</a></li>
				<li><a href="${pageContext.request.contextPath}/product_managements/product-management">Product Managements</a></li>
				<li><a href="#">Order Management</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>