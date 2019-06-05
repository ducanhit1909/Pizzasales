<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management</title>
</head>
<body class="app sidebar-mini rtl">
<jsp:include page="menu.jsp"/>
	<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-archive"></i> Widgets</h1>
          <p>Widgets to interactively display data</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">UI</li>
          <li class="breadcrumb-item"><a href="#">Widgets</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="widget-small primary"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Users</h4>
              <p><b>5</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="widget-small info"><i class="icon fa fa-thumbs-o-up fa-3x"></i>
            <div class="info">
              <h4>Likes</h4>
              <p><b>25</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="widget-small warning"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
              <h4>Uploades</h4>
              <p><b>10</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="widget-small danger"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>Stars</h4>
              <p><b>500</b></p>
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
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/backend/js/plugins/jquery.vmap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/backend/js/plugins/jquery.vmap.world.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/backend/js/plugins/jquery.vmap.sampledata.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      
      	var map = $('#demo-map');
      	map.vectorMap({
      		map: 'world_en',
      		backgroundColor: '#fff',
      		color: '#333',
      		hoverOpacity: 0.7,
      		selectedColor: '#666666',
      		enableZoom: true,
      		showTooltip: true,
      		scaleColors: ['#C8EEFF', '#006491'],
      		values: sample_data,
      		normalizeFunction: 'polynomial'
      	});
      });
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
</body>
</html>