<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset token</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>">
    <!--Loading style vendors-->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
    <!--Loading style-->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/pink-violet.css"/>" id="theme-change" class="style-change color-change">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
     <body id="error-page" class="animated bounceInLeft">

     
    <div id="error-page-content">
    	<!-- Alert -->
    	<c:choose>
    	<c:when test="${errorMessage!=null}">
		  <div class="alert alert-danger" style="width: 400px;height: 60px;margin: 0 auto">
		    <strong><c:out value="${errorMessage}"/></strong>
		  </div>
		 </c:when>
		 </c:choose>
 		<!--  -->
    
        <h1>Reset token</h1>
        <h3>Enter your email to reset the token</h3>
       
        <form action="<c:url value="/signup/reset_token"/>" class="mbm" method="POST">
            <div class="input-group">
                <input type="text" placeholder="Enter your email" class="form-control" name="email" required><span class="input-group-btn"><input class="btn btn-primary" type="submit">Search</span></div>
        </form>
        
        <div class="container">
        <div class="row">
        <div class="col-md-4">
        <a href="<c:url value="/"/>">Home</a> <a href="<c:url value="/signin"/>">Login page</a>
        </div>
        
        </div>
        </div>
    </div>

    <script>
        //BEGIN CHECKBOX & RADIO
        $('input[type="checkbox"]').iCheck({
            checkboxClass: 'icheckbox_minimal-grey',
            increaseArea: '20%' // optional
        });
        $('input[type="radio"]').iCheck({
            radioClass: 'iradio_minimal-grey',
            increaseArea: '20%' // optional
        });
        //END CHECKBOX & RADIO
    </script>
    <script>
    	$('.alert').fadeOut(12000);
    </script>
</body>
</html>