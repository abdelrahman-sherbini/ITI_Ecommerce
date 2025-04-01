package gov.iti.Controllers.customer;

import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;

import org.apache.commons.beanutils.BeanUtils;

import gov.iti.Dtos.Address;
import gov.iti.Dtos.Cart;
import gov.iti.Dtos.UserSignUp;
import gov.iti.Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SignUpServlet" ,value = "/customer/signup")
public class SignUpServlet extends HttpServlet{
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService(); 
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSignUp user = new UserSignUp();
        Address defaultAddress = new Address();
        try {
            BeanUtils.populate(user, req.getParameterMap());
            BeanUtils.populate(defaultAddress, req.getParameterMap());
            user.setAddress(defaultAddress);
            int userId = userService.SignUp(user);

            if (userId > 0) {
                HttpSession session = req.getSession(true);
                session.setAttribute("UserId", userId);
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("lastName", user.getLastName());
                Cart  cart = new Cart();
                // add cart in session
                session.setAttribute("cart", cart);
                Writer out = resp.getWriter();
                out.write((String) session.getAttribute("firstName"));
                // send email
                
                // Redirect to home page or welcome page
                resp.sendRedirect("index.jsp");
            } else {
                // Forward to error page or show message
                // req.setAttribute("errorMessage", "Failed to sign up. Please try again.");
                // req.getRequestDispatcher("/signup.jsp").forward(req, resp);
                resp.sendRedirect("404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Replace with proper logging
            resp.sendRedirect("404.jsp");
            // req.setAttribute("errorMessage", "An internal error occurred.");
            // req.getRequestDispatcher("/signup.jsp").forward(req, resp);
        }
        
    

        
        
        

        
        

        
    }
    
}
