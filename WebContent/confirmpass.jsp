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
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		
		if (user == null || "".equals(user) || oldpass == null || "".equals(oldpass) || newpass == null || "".equals(newpass)) { %>
		
		<h3><strong><font color="red">Error: <%="Mandatory Input Missing"%></font><br>
	<br> </strong></h3>
	
		<%@ include file="changepass.html"%>
		<%
			//throw new ServletException("Mandatory Parameter missing");
		} else {
		
		%>
		
		
<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<!-- sql:update tag to INSERT -->
	
	
        
	<sql:update dataSource="${db}" var="rs">
         UPDATE userlogin SET password="${param.newpass}"
         WHERE username="${param.username}"
               
     </sql:update>
         

	<%
		out.println("<h2>Password Change Succesfull !!!</h2>");
		}
	%>
	<br>
	

</body>
</html>
