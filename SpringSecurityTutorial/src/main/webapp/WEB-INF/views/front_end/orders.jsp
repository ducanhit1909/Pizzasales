<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style_order.css">
<title>Order list</title>
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!--lock ui-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<!--CSS-->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font-awesome.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/animate.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/responsive.css"/>"/>
<style>
strong{
	color:red!important
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"/>
	 <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Order <b>List</b></h2>
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead style="font-weight: bold">
                    <tr>
						<th>
							
						</th>
                        <th>Pizza Name</th>
                        <th>Pizza Topping</th>
						<th>Pizza Size</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="count" value="${0}"/>
                <c:forEach items="${orderDetails}" var="orderDetail">	
                <c:set var="count" value="${count+1}" />			
					<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox5" name="options[]" value="1">
								<label for="checkbox5"></label>
							</span>
						</td>
                        <td class="${orderDetail.productEntity.id}"><c:out value="${orderDetail.productEntity.name}"></c:out> </td>
                        <td class="${orderDetail.productTopping.id}"><c:out value="${orderDetail.productTopping.toppingType}"/></td>
						<td class="${orderDetail.productSize.id}"><c:out value="${orderDetail.productSize.size}"/></td>
                        <td>
                        	 <input type="number" min="1" max="10" step="1" value ="${orderDetail.quantity}"/>
                        </td>
                        <td>
                            <a href="#deleteProductModal${count}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    	<td>
                    	<div id="deleteProductModal${count}" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">						
											<h4 class="modal-title">Delete Pizza</h4>
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">					
											<p>Are you sure you want to delete pizza: <strong>${orderDetail.productEntity.name}</strong>, With topping: <strong>${orderDetail.productTopping.toppingType}</strong>, and  Size: <strong>${orderDetail.productSize.size}</strong></p>
											<p class="text-warning"><small>This action cannot be undo.</small></p>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
											<input type="button" class="btn btn-danger" value="Delete" name="delete" data-dismiss="modal">
										</div>
									</form>
								</div>
							</div>
						</div>
						</td>
                    </tr> 
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
  
<div class="container">
	<div class="row">
		<div class="col-md-6"></div>
		<div class="col-md-6">
		<div class="col-md-3"><strong>Total products:</strong><p id="tquantity">${sessionScope.orderJson.quantity}</p></div>
		<div class="col-md-4"><strong>Total price:</strong><p id="tprice">${sessionScope.orderJson.totalPriceOfOrder}</p></div>
		<div class="col-md-2"><a href="${pageContext.request.contextPath}/order/place_order?orderId=${orderDetails[0].orderEntity.id}"><button class="btn btn-primary" name="orderbtn">Place order <span class="glyphicon glyphicon-check"></span></button></a></div>
		</div>
	</div>
	
</div>

</body>
<input type="hidden" value="${orderDetails[0].orderEntity.id}" id="orderId">
<script src="${pageContext.request.contextPath}/resources/js/order.js"></script>
<!-- Log UI for change order -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/custom_logui.js'></script>
</html>