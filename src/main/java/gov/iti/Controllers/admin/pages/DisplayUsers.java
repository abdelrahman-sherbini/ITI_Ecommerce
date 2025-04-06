package gov.iti.Controllers.admin.pages;

import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayUsers",value = "/admin/display_users")
public class DisplayUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();

        UserDBService userDBService = new UserDBService(em);
        List<User> users = userDBService.getUsers();
        req.setAttribute("users",users);
        req.getRequestDispatcher("display_users.jsp").forward(req,resp);

        EntityManagerProvider.closeEntityManager(em);
    }
}
