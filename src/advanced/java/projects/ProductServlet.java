package advanced.java.projects;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ProductServlet extends HttpServlet {

	private static final String url = "jdbc:mysql://localhost:3306/db_world";
	private static final String user = "root";
	private static final String password = "root";

	// JDBC variables for opening and managing connection
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		out.println("<html><body bgcolor =pink>");

		String productid = request.getParameter("productid");

		String query = "select * from  product where id = " + productid;
		try {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("conn success!" + query);
			} catch (ClassNotFoundException ex) {
				System.out.println("Error: unable to load driver class!");
				System.exit(1);
			}

			con = DriverManager.getConnection(url, user, password);
			// getting Statement object to execute query
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("conn success!" + rs);

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				float price = rs.getFloat(3);

				out.println(" <h1><b>Product Details</h1></b>");
				out.println(" <b><font color='blue'>Product Id = " + id + "</b>");
				out.println("<br>");
				out.println(" <b><font color='blue'>Product Name = " + name + "</b>");
				out.println("<br>");
				out.println(" <b><font color='blue'>Product Price = " + price + "</b>");
				out.println("<br>");

				out.println("</body></html>");

			}

		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} finally {
			// close connection ,stmt and result set here
			try {
				con.close();
			} catch (SQLException se) {
				/* can't do anything */ }
			try {
				stmt.close();
			} catch (SQLException se) {
				/* can't do anything */ }
			try {
				rs.close();
			} catch (SQLException se) {
				/* can't do anything */ }
		}

	}

}
