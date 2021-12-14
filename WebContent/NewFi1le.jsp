<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	

	<%
		String id = "";
		String username = "a";
		String pwd = "a";
		
		

			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "db_world";
			String userId = "root";
			String password = "root";
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			Connection connection = null;
			Statement statement = null;
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();

				String sql = "SELECT * FROM userlogin WHERE username = '" + username+ "' and password = '" + pwd+"'";
				   System.out.printf(sql); 
				
			 ResultSet rs=  statement.executeQuery(sql);
			if (rs.next()) 
		    	{ 
		    	   String un = rs.getString(1); 
		    	   String name = rs.getString(2); 
		    	 
		    	   System.out.printf(un); 
		    	   System.out.printf(name); 
		    	   
		    	}
			 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
	%>


	<%-- <!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<!-- sql:update tag to INSERT -->

	<c:if test="${param.username != null and param.password != null}">

		<sql:query dataSource="${db}" var="rs">  
			SELECT * from userlogin  WHERE username="${param.username}" and password="${param.password}";  
			
	</sql:query>
		<c:if test="${rs.rowsByINDEX[0][0] == 1}">
		<c:redirect url = "flightsearch.jsp"> </c:redirect>
		</c:if>
		<c:if test="${rs.rowsByINDEX[0][0] == 0}">
		<fieldset>
			<caption>Error: </caption>
			<font color="red">Invalid Credentials</font>
		</fieldset>
		</c:if>
	</c:if> --%>




</body>
</html>