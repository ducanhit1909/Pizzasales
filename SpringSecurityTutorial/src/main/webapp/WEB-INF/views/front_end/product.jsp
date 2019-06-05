<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Products</title>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.1/jquery.twbsPagination.min.js'></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
  <!--CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.css"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"> </script> 
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script> <!--lock ui-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.5/waypoints.min.js"></script>

<style>
  figure figcaption h3{
  font-size: 1.5rem;
  color: #0078ae;
  font-weight: 900;
  text-transform: uppercase;
  margin-bottom: 15px;
  }
  figcaption #content{
  color: brown
  }
  .product{
  font-family: 'Montserrat',sans-serif;
  }
  .header{
  font-size: 16px;
  font-weight: 700;
  color: saddlebrown;
  font-weight: bold;
  font-family: 'Montserrat';
  transition: all,0.3s;
  text-transform: uppercase;
  padding-top: 10px;
  }
  .content{
  font-size: 1rem;
  font-weight: 400;
  line-height: 16px;
  color: #012333;
  padding: 5px 0px 5px 0px
  }
  .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 5px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 10px 2px;
  cursor: pointer;
  font-size: 14px;
  }

  .order_btn {background-color: #ed1c24;}
  #pagination-demo{
  display: inline-block !important;
  margin-bottom: 1.75em !important;
  }
  #pagination-demo li{
  display: inline-block !important;
  }
  .pagination-sm .page-link {
  padding: .25rem .5rem;
  font-size: .975rem;
  }
  .saction4{
  background: url("${pageContext.request.contextPath}/resources/images/background/product_background.jpg")no-repeat
  center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  }
  .sizes, .toppings{
  padding-top:2px;
  color: #074a69;
  }
  .viewMore{
    display: block;
    overflow: hidden;
    position: relative;
    line-height: 40px;
    font-size: 18px;
    color: #288ad6;
    border: 1px solid #eee;
    background-color:#eee;
    text-align: center;
    border-radius: 3px;
    margin: 10px auto 20px;
    width: 240px;
  }
  a{
  text-decoration: none!important;
  }
  </style>
</head>

<body style="overflow-x: hidden">
  <div class="se-pre-con"></div>
  <jsp:include page="menu.jsp" />
 
  <!--Product-->
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">
      <div class="dotted3 os-animation" data-os-animation="bounceInLeft" data-os-animation-delay="1s"></div>
      <div class="special">
        <h2 class="os-animation" data-os-animation="bounceInDown" data-os-animation-delay="0.50s">Our menu</h2>
        <div class="dotted4 os-animation" data-os-animation="bounceInRight" data-os-animation-delay="1s"></div>
      </div>
    </div>
  </div>
  <section class="saction4" style="margin-top: 10px">
    <div class="container" id="menu">

      <div class="row">
        <c:forEach items="${products}" var="product">
  		<form name="orderForm" method="GET">

          <div class="col-md-6">
            <div class="slider clearfix os-animation" data-os-animation="fadeInDown" data-os-animation-delay="0.20s">

              <div class="row">
                <div class="col-12 col-md-5">
                  <figure style="display: block">
                    <div class="img clearfix"> <img src="${pageContext.request.contextPath}/${product.image}" alt=""
                        class="custom_image" /> </div>
                  </figure>
                </div>

                <div class="col-12 col-md-7">

                  <div class="row">
                    <h3 class="header">
                      <c:out value="${product.name}" />
                    </h3>
                  </div>

                  <div class="row">
                    <div class="content">
                      <c:out value="${product.description}" />
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-12 col-sm-6">
                      <div class="sizes">Sizes</div>
                      <select class="form-control" name="size">
                        <c:forEach items="${product.productSizes}" var="sizes">
                          <option value="${sizes.sizeEntity.id}">
                            <c:out value="${sizes.sizeEntity.size}" />
                          </option>
                        </c:forEach>
                      </select>
                    </div>

                    <div class="col-12 col-sm-6">
                      <div class="toppings">Toppings</div>
                      <select class="form-control" name="topping">
                        <c:forEach var="toppings" items="${product.productToppings}">
                          <option value="${toppings.id}">
                            <c:out value="${toppings.toppingType}" />
                          </option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <input type="hidden" value="${product.id}" name="productId">

                  <div class="row">
                    <div class="col-md-12">
                      <button class="button order_btn" type="submit" name="add_to_card"><span>Add to card <i
                            class="fas fa-shopping-cart"></i></span></button>
                    </div>
                  </div>
                </div>

              </div>


            </div>

          </div>
          </form>
        </c:forEach>
      </div>
      <!-- Paggination -->
    </div>
    <c:if test="${!outOfPage}">
    <div class="row">
      <div class="col-sm-12">
        <a href="javascript:void(0)" class="viewMore">View more 5 products <i class='fas fa-angle-down'></i></a>
      </div>
    </div>
    </c:if>
   
  </section>
</body>
<input type="hidden" value="${page}" name="page">
<script>
	jQuery(document).ready(function(){
		$('.viewMore').on('click',function(e){
			e.preventDefault();
			$(this).text('Loading...');
			let productRequest=parseInt($('input[name=page]').val())+5;
			window.location.href = "/pizza_sale/products/page?productRequest="+productRequest;
		})
	})
</script>
<script src="${pageContext.request.contextPath}/resources/js/custom_logui.js"></script>
<!--Order process-->

<script src="${pageContext.request.contextPath}/resources/js/order.js"></script>
</html>