<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  jQuery BlockUI Plugin - Block page elements or whole page to simulate AJAX request and prevemnt user interaction while processing items -<br><a href="http://malsup.com/jquery/block" target="_blank">http://malsup.com/jquery/block</a> 
<br><a href="https://github.com/malsup/blockui/" target="_blank">https://github.com/malsup/blockui/</a><br><hr><br><br>

<button id="demo2">BlockUI</button>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/custom_logui.js'></script>

</body>
</html>