package gov.iti.Controllers.customer;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import gov.iti.Entities.PasswordResetToken;
import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Helper.MailMessenger;
import gov.iti.Services.PasswordResetService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LostPasswordServlet" ,value = "/customer/lostPassword")
public class LostPasswordServlet extends HttpServlet{
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
            resp.setContentType("application/json");
            String email = req.getParameter("resetEmail");
            String token = UUID.randomUUID().toString();
            Timestamp expiration = new Timestamp(System.currentTimeMillis() + 60 * 60 * 1000);

            // get user by email
            User user = userDBService.getUserByEmail(email);

            if (user == null) {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("{\"status\": \"error\", \"message\": \"Email not found in our system.\"}");
                return;
            }

            // update token if exists
            PasswordResetToken exitingToken = passwordResetService.findByUser(user);
            if(exitingToken != null){
                exitingToken.setToken(token);
                exitingToken.setExpirationTime(expiration);
                passwordResetService.update(exitingToken);
                
            }else{
                PasswordResetToken passwordResetToken = new PasswordResetToken(token, user, expiration);
                passwordResetService.add(passwordResetToken);
            }
            MailMessenger.sendresetPassword(email, token);
            // send an email with the token
            // return json 
            resp.setStatus(HttpServletResponse.SC_OK);

            resp.getWriter().write("{\"status\": \"success\", \"message\": \"A reset link has been sent to your email.\"}");


        }
}
