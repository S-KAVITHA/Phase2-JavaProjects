<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h4> Product Detail are dispalyed here !!!</h4>
<%
	out.println("Product Id : " + session.getAttribute("productid") + "<br/>");
	out.println("Product Description : " + session.getAttribute("productdesc") + "<br/>");
	out.println("Product Price : " + session.getAttribute("price") + "<br/>");
	out.println("Product Expiry : " + session.getAttribute("Expiry_Date") + "<br/>");
	
%>


</body>
</html>