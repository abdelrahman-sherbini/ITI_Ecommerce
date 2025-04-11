package gov.iti.Controllers.customer;

import java.io.IOException;
import java.util.List;

import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import gov.iti.Services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidatePhoneEdit" ,value = "/customer/phoneedit")
public class ValidatePhoneEdit extends HttpServlet {
    private EntityManager entityManager;
    private UserDBService userDBService;
    

    @Override
    public void init() throws ServletException {
        entityManager = EntityManagerProvider.getEntityManager();
        userDBService = new UserDBService(entityManager);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = request.getParameter("phone");
        User user = (User) request.getSession().getAttribute("LoggedUser");
        List<String> phoneNumbers = userDBService.getAllPhoneNumbersExcept(user.getId());
        
        boolean isInvalid = phoneNumbers.contains(phone);

        
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(isInvalid));
    }

}
