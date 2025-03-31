package gov.iti.Controllers.customer;

import java.io.IOException;

import gov.iti.Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidateEmail" ,value = "/customer/email")
public class ValidateEmailServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");

        // Check if email exists in the simulated database
        boolean isInvalid = userService.ValidateEmail(email);

        // Send boolean response
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(isInvalid));
    }
}

