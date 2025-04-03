package gov.iti.Controllers.customer;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.RandomStringUtils;

import gov.iti.Dtos.AuthToken;
import gov.iti.Dtos.User;
import gov.iti.Dtos.UserSignIn;
import gov.iti.Helper.HashGenerator;
import gov.iti.Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CustomerLoginServlet", value = "/customer/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserSignIn userSignIn = new UserSignIn();

        try {
            BeanUtils.populate(userSignIn, req.getParameterMap());
            User databaseUser = userService.logIn(userSignIn);

            if (databaseUser != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("LoggedUser",databaseUser);
                // remmber me checked
                if (userSignIn.getRememberMe()) {
                    String selector = RandomStringUtils.randomAlphanumeric(12);
                    String rawValidator = RandomStringUtils.randomAlphanumeric(64);
                    int user_id = databaseUser.getUserId();
                    String hashValidator = HashGenerator.generateSHA256(rawValidator);

                    AuthToken authToken = new AuthToken(user_id, selector, hashValidator);
                    userService.generateAuthToken(authToken);
                    Cookie cookieSelector = new Cookie("selector", selector);
                    cookieSelector.setMaxAge(604800);

                    Cookie cookieValidator = new Cookie("validator", rawValidator);
                    cookieValidator.setMaxAge(604800);

                    resp.addCookie(cookieSelector);
                    resp.addCookie(cookieValidator);

                }
                resp.sendRedirect("index.jsp");
            } else {
                // show error message
                req.setAttribute("userSignIn", userSignIn);
                req.setAttribute("errorMessage", "Invalid username or password");
                req.getRequestDispatcher("/customer/signin.jsp").forward(req, resp);

            }
            
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            resp.sendRedirect("404.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("Servlet is working!");
    }

}
