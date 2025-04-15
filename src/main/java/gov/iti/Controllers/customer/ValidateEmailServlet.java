package gov.iti.Controllers.customer;

import java.io.IOException;
import java.util.List;

import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidateEmail" ,value = "/customer/email")
public class ValidateEmailServlet extends HttpServlet {
    private EntityManager entityManager;
    private UserDBService userDBService;

    @Override
    public void init() throws ServletException {
        entityManager = EntityManagerProvider.getEntityManager();
        userDBService = new UserDBService(entityManager);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        List<String> emails = userDBService.getAllEmails();

        
        boolean isInvalid = emails.contains(email);

        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(isInvalid));
    }
}

