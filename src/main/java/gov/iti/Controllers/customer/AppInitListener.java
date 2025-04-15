package gov.iti.Controllers.customer;

import gov.iti.Dtos.Category;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CategoryDao;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.sql.Connection;
import java.util.List;

public class AppInitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Replace with your actual database connection logic
        Connection con = ConnectionProvider.getConnection();
        CategoryDao categoryDao = new CategoryDao(con);
        List<Category> categories = categoryDao.getAllCategories();
        System.out.println("AppInitListener initialized, Categories: " + categories.size());
        sce.getServletContext().setAttribute("headercategories", categories);
        System.out.println("Categories set in application scope: " + categories);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed (e.g., close connection)
    }
}
