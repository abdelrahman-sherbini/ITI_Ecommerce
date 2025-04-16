package gov.iti.Controllers.customer;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

import gov.iti.Entities.PasswordResetToken;
import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Helper.PasswordHasher;
import gov.iti.Services.PasswordResetService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ResetPasswordServlet" ,value = "/customer/resetPassword")
public class ResetPasswordServlet extends HttpServlet{
    private EntityManager em;
    private UserDBService userDBService;
    private PasswordResetService passwordResetService;

    @Override
    public void init() throws ServletException {
        em = EntityManagerProvider.getEntityManager();
        userDBService = new UserDBService(em);
        passwordResetService = new PasswordResetService(em);
             
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String token = req.getParameter("token");

        resp.setContentType("application/json");

        PasswordResetToken passwordResetToken  = passwordResetService.findByToken(token);
        if(passwordResetToken != null){
            Timestamp now = Timestamp.from(Instant.now());
            if (now.after(passwordResetToken.getExpirationTime())) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"status\": \"error\", \"message\": \"Token has expired.\"}");
            } else {
                User user = passwordResetToken.getUser();
                String hashedPassword =PasswordHasher.hashPassword(password);
                user.setPassword(hashedPassword);
                userDBService.updateUser(user);
                em.clear();
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().write("{\"status\": \"success\", \"message\": \"Token is valid.\"}");
            }
        }else{
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write("{\"status\": \"error\", \"message\": \"Invalid token.\"}");
        }
    }
    
}
