<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Java Date Picker</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
    </head>
    <body>
<form >
			<h2>Welcome to Flyaway page !!!</h2>

			<br> Enter User name <input type="text" name="username">
			<br> <br> Enter password <input type="password"
				name="password"> <br> <br>
			<button>Login</button>    	<button>Login3</button>
			<br> <br>
			 
		</form>

  </label>  
       </form> 
    <!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />
        
<sql:query dataSource="${db}" var="rs">  
	SELECT * from emp99;  
</sql:query>  
 
    <c:out value="${rs.rowCount}"/></td>  
    <c:if test="${rs.rowCount > 0 }">
 <strong><font color="red">Error: <%="Invalid Credentials"%></font><br>
			<br> </strong></center>
</c:if>


     <c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.sid}"/></td>  
			<td><c:out value="${table.name}"/></td>  
			<td><c:out value="${table.age}"/></td>  
			<td><c:out value="${table.city}"/></td>  
		</tr>  
	</c:forEach>  
	
	  
    </body>
</html>