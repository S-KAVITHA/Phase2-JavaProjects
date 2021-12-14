<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII" errorPage="error.jsp"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>sql:query Tag</title>
</head>
<body>


	<%
		String user = request.getParameter("username");
		String repwd = request.getParameter("repassword");
		String pwd = request.getParameter("password");
		
		if (user == null || "".equals(user) || pwd == null || "".equals(pwd) || repwd == null || "".equals(repwd)) {
			throw new ServletException("Mandatory Input Missing");
		}
		
		 
		if (repwd.equals(pwd)) {}
		else {
			throw new ServletException("Password does not match");
		}
	%>


	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<!-- sql:update tag to INSERT -->
	<sql:update dataSource="${db}" var="count"> 
	INSERT INTO userlogin VALUES ('${param.username}','${param.password}');  
	</sql:update>

	<%	
		out.println("<h2>Account Creation Succesfull !!!</h2>");
	%>
	<br> 



</body>
</html>
