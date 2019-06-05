<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/backend/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.error{
	color:red;
	}
</style>
</head>
<body>

	<!--Horizon menu-->
	<header class="app-header">
		<a class="app-header__logo" href="index.html">Pizza management</a>
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">
			<li class="app-search"><input class="app-search__input"
				type="search" placeholder="Search">
				<button class="app-search__button">
					<i class="fa fa-search"></i>
				</button></li>
			<!-- User Menu-->
			<li class="dropdown"><a class="app-nav__item" href="#"
				data-toggle="dropdown" aria-label="Open Profile Menu"><i
					class="fa fa-user fa-lg"></i></a>
				<ul class="dropdown-menu settings-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
							class="fa fa-sign-out fa-lg"></i> Logout</a></li>
				</ul></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<img class="app-sidebar__user-avatar"
				src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"
				alt="User Image">
			<div>
				<p class="app-sidebar__user-name">Admin</p>
				<p class="app-sidebar__user-designation">Manage your system</p>
			</div>
		</div>
		<ul class="app-menu">
			<li><a class="app-menu__item" href="index.html"><i
					class="app-menu__icon fa fa-dashboard"></i><span
					class="app-menu__label">Dashboard</span></a></li>


			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span
					class="app-menu__label">Pizza Managements</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href="${pageContext.request.contextPath}/managements/pizza_managements/pizzas"><i
							class="icon fa fa-circle-o"></i> Manage pizza</a></li>
					<li><a class="treeview-item" href="${pageContext.request.contextPath}/managements/pizza_managements/add_pizza"><i
							class="icon fa fa-circle-o"></i> Add new pizza</a></li>
				</ul></li>
			

			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span
					class="app-menu__label">Statistic</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item active" href="widgets.html"><i
							class="icon fa fa-circle-o"></i> Widgets</a></li>
					<li><a class="treeview-item" href="charts.html"><i
							class="app-menu__icon fa fa-pie-chart"></i><span
							class="app-menu__label">Charts</span></a></li>
				</ul></li>
		</ul>
	</aside>
</body>
</html>