package gov.iti.Controllers.admin.pages;

import gov.iti.Entities.Category;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.CategoryService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Admin",value = "/admin/admin")
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();
        CategoryService categoryService = new CategoryService(em);
        List<Category> categories = categoryService.getAllCategories();
        req.getServletContext().setAttribute("categories", categories);
        req.getRequestDispatcher("admin.jsp").forward(req, resp);
    }
}
