package gov.iti.Controllers.customer;

import gov.iti.Dtos.Message;
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

@WebServlet(name = "UpdateUserServlet", value = "/customer/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager em = EntityManagerProvider.getEntityManager();
        UserDBService userDBService = new UserDBService(em);

        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        Double credit =Double.parseDouble( req.getParameter("credit"));
        String job = req.getParameter("job");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        user.setFirstName(fname);
        user.setLastName(lname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setJob(job);
        user.setCredit(credit);

       userDBService.updateUser(user);
        user = userDBService.refreshUser(user);
        user.getWishlists().size();
        user.getWishlists().size();
        user.getOrders().size();
        req.getSession().setAttribute("LoggedUser", user);
        Message message = new Message("Successfully updated user", "success", "alert-success");
        req.getSession().setAttribute("message", message);
        resp.sendRedirect("dash-my-profile.jsp");





    }
}
