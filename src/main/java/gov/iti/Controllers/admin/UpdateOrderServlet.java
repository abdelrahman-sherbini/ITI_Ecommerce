package gov.iti.Controllers.admin;


import gov.iti.Entities.Order;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.OrderService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;



@WebServlet(name = "UpdateOrderServlet" ,value = "/admin/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManager em = EntityManagerProvider.getEntityManager();


		int oid = Integer.parseInt(request.getParameter("oid"));
		String status = request.getParameter("status");

		OrderService orderService = new OrderService(em);
		Order order = orderService.getOrder(oid);
		order.setStatus(status);
		orderService.updateOrder(order);

		EntityManagerProvider.closeEntityManager(em);
		response.sendRedirect("display_orders");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
