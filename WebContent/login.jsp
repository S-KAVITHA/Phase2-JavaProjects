<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>User Home Page</title>
</head>
<body>
<%
String user = request.getParameter("username");	
String repwd = request.getParameter("repassword");
	String pwd = request.getParameter("password");
	
	if(user == null || "".equals(user) || pwd == null || "".equals(pwd) || repwd == null || "".equals(repwd) ){
		throw new ServletException("Mandatory Parameter missing");
	}
	if (repwd != pwd ){
		throw new ServletException("Password does not match");	
	}
	
%>

<%-- do some DB processing, not doing anything for simplicity --%>
Hi <%=user %>
</body>