package gov.iti.Controllers.customer;

import java.io.IOException;

import gov.iti.Dtos.User;
import gov.iti.Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidatePhoneEdit" ,value = "/customer/phoneedit")
public class ValidatePhoneEdit extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = request.getParameter("phone");
        User user = (User) request.getSession().getAttribute("LoggedUser");
        // Check if email exists in the simulated database
        boolean isInvalid = userService.ValidatePhoneExcept(phone,user.getUserId());

        // Send boolean response
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(isInvalid));
    }

}
