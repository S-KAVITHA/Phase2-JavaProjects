<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<title>Java Date Picker</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>

<div align="center">
	<form action="Flightsql.jsp">
		<font color="blue"><h2>Welcome to Flyaway.com !!!. You can search available flights here !!!</h2> </font>
		
		<label for="datepicker">Enter Travel Date</label> <input type="date"
			name="traveldate" id="datepicker"> <br> <br> Enter
		Source City <input type="text" name="srccity"><br> <br>
		Enter Destination City <input type="text" name="destcity"> <br>
		<br> Enter Total Travelers <input type="number" name="seatavail">
		<br> <br>
		<button>Submit</button>
	</form>
</div>

</body>
</html>