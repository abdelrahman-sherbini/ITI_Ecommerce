package gov.iti.Controllers.customer;

import gov.iti.Dtos.Message;
import gov.iti.Dtos.User;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.UserDao;
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
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String credit = req.getParameter("credit");
        String job = req.getParameter("job");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        user.setUserFirstName(fname);
        user.setUserLastName(lname);
        user.setUserEmail(email);
        user.setUserPhone(phone);
        user.setJob(job);
        user.setCredit(credit);

        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        userDao.updateUser(user);

        user = userDao.getUserByID(user.getUserId());
        req.getSession().setAttribute("LoggedUser", user);
        Message message = new Message("Successfully updated user", "success", "alert-success");
        req.getSession().setAttribute("message", message);
        resp.sendRedirect("dash-my-profile.jsp");


    }
}
