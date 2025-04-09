package gov.iti.Controllers.customer.pages;

import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Header" ,value = "/customer/header")
public class Header extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        EntityManager entityManager = EntityManagerProvider.getEntityManager();
        User user = entityManager.find(User.class, 13);
        req.getSession().setAttribute("LoggedUser", user);

        EntityManagerProvider.closeEntityManager(entityManager);

    }
}
