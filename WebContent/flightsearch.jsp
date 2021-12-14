<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	
	
	<form action="flightdetails.jsp">
		<h2>Search flights !!!</h2>
		<br> Enter Date of travel : <input type="text" name="username">
		<br> Enter Source City : <input type="password" name="password">
		<br> Enter Destination City : <input type="password"
			name="password"> <br> Enter Number of persons : <input
			type="password" name="password"> <br> <input
			type="Submit">
	</form>


</body>
</html>