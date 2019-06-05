<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<!--MOBILE DEVICE-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<!--JS-->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/resources/js/scripts.js"/>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!--lock ui-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<!--CSS-->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font-awesome.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/animate.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/responsive.css"/>"/>

</head>
<body style="overflow-x:hidden ">
<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->

<jsp:include page="menu.jsp"/>
<c:if test="${not empty sendTokenMessage}">
 <div class="alert alert-danger" style="width: 300px;height: 100px;margin: 10px 500px">
    <strong>Success!</strong> ${sendTokenMessage}
  </div>
</c:if>
<section class="backgraound">
  <div class="container" >
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="back">
          <div class="line1 os-animation" data-os-animation="rotateInDownLeft" data-os-animation-delay="1s"> </div>
          <div class="line2 os-animation" data-os-animation="rotateInDownLeft" data-os-animation-delay="1s"> </div>
          <h2 class="os-animation" data-os-animation="zoomIn" data-os-animation-delay="0.50s">We have more than 30 different styles of pizza</h2>
          <h3 class="os-animation" data-os-animation="zoomIn" data-os-animation-delay="1s">To Order Online</h3>
          <div class="line3 os-animation" data-os-animation="rotateInDownRight" data-os-animation-delay="1s"> </div>
          <div class="line4 os-animation" data-os-animation="rotateInDownRight" data-os-animation-delay="1s"> </div>
        </div>
      </div>
    </div>

  </div>
</section>
<footer class="saction9" id="contact">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="email">&copy; All right reserved 2019  /  PizzaHPN </div>
      
      </div>
      
    </div>
  </div>
</footer>
<script>
	jQuery(document).ready(function(){
		$('.alert-danger').fadeOut(8000);
	})
</script>
</body>
</html>