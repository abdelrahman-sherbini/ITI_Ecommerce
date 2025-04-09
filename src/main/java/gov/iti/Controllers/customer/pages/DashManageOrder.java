package gov.iti.Controllers.customer.pages;

import gov.iti.Dtos.Message;
import gov.iti.Entities.Order;
import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AddressService;
import gov.iti.Services.OrderService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DashManageOrder" ,value = "/customer/dash-manage-order")
public class DashManageOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager entityManager = EntityManagerProvider.getEntityManager();
        UserDBService userDBService = new UserDBService(entityManager);
        OrderService orderService = new OrderService(entityManager);
        AddressService addressService = new AddressService(entityManager);

        Message message;

        String order_Id = req.getParameter("orderId");
        if(order_Id == null || order_Id.isEmpty()|| Integer.parseInt(order_Id) <=0){
            message = new Message("Choose a valid order!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("dash-my-order.jsp");
            return;
        }
        Long orderID = Long.parseLong(order_Id);
        Order order = orderService.getOrder(orderID);


        if(order.getUser().getId() != user.getId()) {
            message = new Message("Order does not exist!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("dash-my-order.jsp");
            return;
        }
        order.getOrderedProducts().size();

        req.setAttribute("order", order);

        EntityManagerProvider.closeEntityManager(entityManager);
        req.getRequestDispatcher("dash-manage-order.jsp").forward(req, resp);
    }
}