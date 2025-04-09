package gov.iti.Controllers.customer.pages;

import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Dashboard" ,value = "/customer/dashboard")
public class Dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("LoggedUser");

        EntityManager em = EntityManagerProvider.getEntityManager();

        UserDBService userDBService = new UserDBService(em);
        user = userDBService.refreshUser(user);

        user.getOrders().size();
        user.getUserAddresses().size();
        System.out.println(user.getUserAddresses().size());
        user.getUserAddresses().forEach(userAddress -> {
            System.out.println(userAddress.getAddress());
        });
        user.getWishlists().size();
        req.getSession().setAttribute("LoggedUser", user);
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

        EntityManagerProvider.closeEntityManager(em);
    }
}
