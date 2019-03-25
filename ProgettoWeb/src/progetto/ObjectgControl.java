package progetto;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrdersControl
 */
public class ObjectgControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// OrdersModelDS usa il DataSource
	// OrdersModelDM usa il DriverManager	
	static boolean isDataSource = true;
	static ObjectgModel model;
	static CartNavBar  model2;

	
	static {
		if (isDataSource) {
			model = new ObjectgModelDS();
			model2 = new CarrelloNavBarModel();

		}
	}

	public ObjectgControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
			
	
		
		String action = request.getParameter("action");
		try {
			if (action != null) {
				if (action.equalsIgnoreCase("read")) {
					String id = request.getParameter("id");
					request.removeAttribute("oggetto");
					request.setAttribute("oggetto", model.doRetrieveByKey(id));
				}
			}
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}	

		String sort = request.getParameter("sort");
		try {
			request.removeAttribute("oggetti");
			request.setAttribute("oggetti", model.doRetrieveAll(sort));
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	
		
		  String email = "noemail";
			if (request.getCookies() != null) {
			       
			    for (int i = 0; i < request.getCookies().length; i++) {
			        if (request.getCookies()[i].getName().equals("email")) {
			        	
			        	email =  request.getCookies()[i].getValue();
			        	
			        }
			    }
			   } 

			request.removeAttribute("email");
			request.setAttribute("email", model2.Getemail(email));
	

		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/oggettog.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}