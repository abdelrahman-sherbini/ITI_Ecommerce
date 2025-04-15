package gov.iti.Controllers.customer;

import java.io.IOException;

import javax.swing.text.html.parser.Entity;

import gov.iti.Dtos.AuthToken;
import gov.iti.Entities.UserAuth;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Model.AuthDao;
import gov.iti.Services.AuthService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerLogoutServlet" , value="/customer/logout")
public class LogoutServlet extends HttpServlet{
    private EntityManager em;
    private AuthService authService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        em = EntityManagerProvider.getEntityManager();
        authService = new AuthService(em);
        
    }
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

                UserAuth token = authService.findBySelector(selector);
                 
                if (token != null) {
                    authService.delete(token);
                     
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
