package gov.iti.Controllers.customer;

import java.io.IOException;

import gov.iti.Dtos.AuthToken;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.AuthDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerLogoutServlet" , value="/customer/logout")
public class LogoutServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("LoggedUser");
     
        Cookie[] cookies = request.getCookies();
         
        if (cookies != null) {
            String selector = "";
             
            for (Cookie aCookie : cookies) {
                if (aCookie.getName().equals("selector")) {
                    selector = aCookie.getValue();
                }
            }
             
            if (!selector.isEmpty()) {
                // delete token from database
                AuthDao authDao = new AuthDao(ConnectionProvider.getConnection());
                AuthToken token = authDao.findBySelector(selector);
                 
                if (token != null) {
                    authDao.delete(token.getUserId());
                     
                    Cookie cookieSelector = new Cookie("selector", "");
                    cookieSelector.setMaxAge(0);
                     
                    Cookie cookieValidator = new Cookie("validator", "");
                    cookieValidator.setMaxAge(0);
                    response.addCookie(cookieSelector);
                    response.addCookie(cookieValidator);                   
                }
            }
        }
         
         
        response.sendRedirect("/");
    }
    
}
