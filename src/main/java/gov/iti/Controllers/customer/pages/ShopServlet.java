package gov.iti.Controllers.customer.pages;

import gov.iti.Dtos.Category;
import gov.iti.Dtos.Product;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CategoryDao;
import gov.iti.Model.ProductDao; // Add this import
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/customer/shop")
public class ShopServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = ConnectionProvider.getConnection();
        CategoryDao categoryDao = new CategoryDao(con);
        ProductDao productDao = new ProductDao(con); // Initialize ProductDao

        // Get all categories
        List<Category> categories = categoryDao.getAllCategories();
        Map<Long, Integer> productCounts = categoryDao.getProductCountsByCategory();

        // Get products based on category parameter
        String categoryParam = request.getParameter("category");
        List<Product> products;
        Map<Integer, String> categoryNames = new HashMap<>();

        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                products = productDao.getAllProductsByCategoryId(categoryId);
            } catch (NumberFormatException e) {
                products = productDao.getAllProducts(); // Fallback to all products
            }
        } else {
            products = productDao.getAllProducts();
        }

        // Build category names map
        for (Category category : categories) {
            categoryNames.put((int) category.getCategoryId(), category.getCategoryName());
        }

        int totalProductCount = productDao.productCount();


        // Set attributes for JSP
        request.setAttribute("categories", categories);
        request.setAttribute("productCounts", productCounts);
        request.setAttribute("totalProductCount", totalProductCount);
        request.setAttribute("products", products);
        request.setAttribute("categoryNames", categoryNames);

        request.getRequestDispatcher("/customer/shop-side-version-2.jsp").forward(request, response);
    }
}