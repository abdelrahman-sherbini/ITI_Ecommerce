package gov.iti.Controllers.admin.pages;

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
import java.util.List;

@WebServlet(name = "DisplayOrders",value = "/admin/display_orders")
public class DisplayOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();

        OrderService orderService = new OrderService(em);
        List<Order> orders = orderService.getAllOrders();

        req.setAttribute("orders",orders);
        req.getRequestDispatcher("/admin/display_orders.jsp").forward(req, resp);

        em.close();
    }
}
