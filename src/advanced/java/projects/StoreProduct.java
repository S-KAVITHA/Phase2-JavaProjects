package advanced.java.projects;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StoreProduct
 */
@WebServlet("/StoreProduct")
public class StoreProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreProduct() {
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
		PrintWriter out = response.getWriter();

		String ProductId = request.getParameter("productid");
		String productdesc = request.getParameter("productdesc");
		Float price = Float.parseFloat(request.getParameter("price"));
		String Expiry_Date = request.getParameter("Expiry_Date");

		Product prod = new Product();
		prod.setProductId(ProductId);
		prod.setProductdesc(productdesc);
		prod.setPrice(price);
		prod.setExpiry_date(Expiry_Date);
		System.out.println(prod.toString());

		out.println("<html><body bgcolor =pink>");

		HttpSession session = request.getSession();

		session.setAttribute("productid", ProductId);
		session.setAttribute("productdesc", productdesc);
		session.setAttribute("price", price);
		session.setAttribute("Expiry_Date", Expiry_Date);

		RequestDispatcher rd = request.getRequestDispatcher("Prductdisp.jsp");
		rd.forward(request, response);

		out.close();
	}

}
