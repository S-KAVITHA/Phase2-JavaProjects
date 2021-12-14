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


	<div align="center">
		<form action="Flyawaylogin.jsp">
			<h2>Welcome to Flyaway page !!!</h2>

			<br> Enter User name <input type="text" name="username">
			<br> <br> Enter password <input type="password"
				name="password"> <br> <br>
			<button>Login</button>
			<br> <br>
		</form>

		<form action="createuser.jsp">
			<button>Create Account</button>
			<br> <br>
		</form>

		<form action="changepass.jsp">
			<button>Change Password</button>
			<br> <br>
		</form>


	</div>

	<%
		String id = "";
		String user_id = request.getParameter("username");
		String pwd = request.getParameter("password");

		if ((!(user_id == null || user_id.isEmpty())) || (!(user_id == null || user_id.isEmpty()))) {

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

				String sql = "SELECT * FROM userlogin WHERE username = '" + user_id + "' and password = '" + pwd
						+ "'";
				System.out.printf(sql);

				ResultSet rs = statement.executeQuery(sql);

				if (rs.next()) {
					response.sendRedirect("flightsearch.jsp");

				} else {
	
					out.println(("<strong><center><span style = 'color:red'>Invalid Credentials!!!</span></center></strong>"));
	
	
		}

			} catch (Exception e) {
				e.printStackTrace();
			}

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