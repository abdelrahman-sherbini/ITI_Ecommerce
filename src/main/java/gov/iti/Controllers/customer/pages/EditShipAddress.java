package gov.iti.Controllers.customer.pages;

import gov.iti.Entities.User;
import gov.iti.Entities.UserAddress;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditShipAddress" ,value = "/customer/edit-ship-address")
public class EditShipAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager entityManager = EntityManagerProvider.getEntityManager();
        UserDBService userDBService = new UserDBService(entityManager);

        List<UserAddress> addressList = userDBService.getAddresses(user.getId());
        req.setAttribute("addressList", addressList);
        req.getRequestDispatcher("edit-ship-address.jsp").forward(req, resp);
    }
}
