package advanced.java.projects;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Servlet implementation class Productoprocess
 */
@WebServlet("/Productprocess")
public class Productprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Productprocess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String Product_Id = request.getParameter("productid");
		String Product_Desc = request.getParameter("productdesc");
		String price = request.getParameter("price");
		String Expiry_Date = request.getParameter("Expiry_Date");
		PrintWriter out = response.getWriter();

		if ((Product_Id == null) || (Product_Id.equals("")) || (Product_Desc == null) || (Product_Desc.equals(""))
				|| (price == null) || (price.equals("")) || (Expiry_Date == null) || (Expiry_Date.equals(""))) {

			RequestDispatcher rd = request.getRequestDispatcher("/ProductHome.jsp");
			rd.include(request, response);
			out.println(("<center><span style = 'color:red'>Mandatory Input Missing!!!</span></center>"));

		} else {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");

			SessionFactory factory = cfg.buildSessionFactory();

			Session session = factory.openSession();

			Transaction t = session.beginTransaction(); // starting/beginning transaction

			Product p1 = new Product(); // transient state

			Float price1 = Float.parseFloat(price);
			p1.setProductId(Product_Id);
			p1.setProductdesc(Product_Desc);
			p1.setPrice(price1);
			p1.setExpiry_date(Expiry_Date);

			session.save(p1); // persist state---> saving into database

			t.commit(); // commit() in DB
			System.out.println("successfully saved");
			factory.close();
			// session.close(); //detached state

			out.println("<h2> Product details updated sucessfully !!! Here is the product details !!!</h2>");
			out.print("<br/>");
			
			out.println("<h4> Product Id  : " + Product_Id + "</h4>");
		
			out.println("<h4> Product Description  : " + Product_Desc + "</h4>");
		
			out.println("<h4> Product Price  : " + price + "</h4>");
		
			out.println("<h4> Product Expiry  : " + Expiry_Date + "</h4>");

		}
	}

}
