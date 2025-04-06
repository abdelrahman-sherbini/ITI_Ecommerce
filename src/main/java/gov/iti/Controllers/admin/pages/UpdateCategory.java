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

@WebServlet(name = "UpdateCategory",value = "/admin/update_category")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();
        Long id = Long.parseLong(req.getParameter("category_id"));

        CategoryService categoryService = new CategoryService(em);
        Category category = categoryService.getCategory(id);
        req.setAttribute("category",category);

        req.getRequestDispatcher("/admin/update_category.jsp").forward(req, resp);

        EntityManagerProvider.closeEntityManager(em);
    }
}
