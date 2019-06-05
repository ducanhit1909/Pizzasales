<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome page</title>
</head>
<body>
<a href="<c:url value="/signin"/>">Login</a>
${serverTime}
<a href='<c:url value="/signup"/>'>Register</a>
<p style="color:red">${confirmTokenMessage}</p>
</body>
</html>