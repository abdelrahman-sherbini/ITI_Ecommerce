package gov.iti.Controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import gov.iti.Dtos.Order;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.MailMessenger;
import gov.iti.Model.OrderDao;
import gov.iti.Model.UserDao;



@WebServlet(name = "UpdateOrderServlet" ,value = "/admin/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int oid = Integer.parseInt(request.getParameter("oid"));
		String status = request.getParameter("status");
		OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
		orderDao.updateOrderStatus(oid, status);
		if (status.trim().equals("Shipped") || status.trim().equals("Out For Delivery")) {
			Order order = orderDao.getOrderById(oid);
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			// MailMessenger.orderShipped(userDao.getUserName(order.getUserId()), userDao.getUserEmail(order.getUserId()),
			// 		String.valueOf( order.getId()), order.getDate().toString());
		}
		response.sendRedirect("display_orders.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
