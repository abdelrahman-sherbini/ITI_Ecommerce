package gov.iti.Controllers.customer;

import com.google.gson.Gson;
import gov.iti.Dtos.Category;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CategoryDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/customer/CategoriesServlet")
public class CategoriesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println("CategoriesServlet");

        try {
            // Get categories from database
            CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
            List<Category> categories = categoryDao.getAllCategories();

            // Convert to JSON
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(categories);
            System.out.println(jsonResponse);

            // Send response
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading categories");
        }
    }
}
