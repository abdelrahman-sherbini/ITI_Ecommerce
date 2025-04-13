package gov.iti.Controllers.customer.pages;

import gov.iti.Dtos.Category;
import gov.iti.Dtos.Product;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CategoryDao;
import gov.iti.Model.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
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
        ProductDao productDao = new ProductDao(con);

        // Get all categories
        List<Category> categories = categoryDao.getAllCategories();
        Map<Long, Integer> productCounts = categoryDao.getProductCountsByCategory();

        // Pagination parameters
        int page = 1;
        int limit = 12; // Default items per page
        String sortParam = request.getParameter("sort");
        String sortBy = "product_id DESC"; // Default sorting

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) { /* Use default */ }

        try {
            limit = Integer.parseInt(request.getParameter("limit"));
        } catch (NumberFormatException e) { /* Use default */ }

        // Price filter parameters
        BigDecimal minPrice = null;
        BigDecimal maxPrice = null;

        try {
            if (request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()) {
                minPrice = new BigDecimal(request.getParameter("minPrice"));
            }
            if (request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()) {
                maxPrice = new BigDecimal(request.getParameter("maxPrice"));
            }
        } catch (NumberFormatException e) {
            // Handle invalid price input
        }

        // Determine sorting
        if (sortParam != null) {
            switch (sortParam) {
                case "name_asc":
                    sortBy = "name ASC";
                    break;
                case "price_asc":
                    sortBy = "price ASC";
                    break;
                case "price_desc":
                    sortBy = "price DESC";
                    break;
                case "discount_desc":
                    sortBy = "discount DESC";
                    break;
                case "newest":
                default:
                    sortBy = "product_id DESC";
                    break;
            }
        }

        int start = (page - 1) * limit;
        int totalProductCount;
        List<Product> products;
        Map<Integer, String> categoryNames = new HashMap<>();

        // Get products based on category parameter
        String categoryParam = request.getParameter("category");

        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                if (minPrice != null && maxPrice != null) {
                    products = productDao.getAllProductsByCategoryIdWithPriceRange(
                            categoryId, start, limit, sortBy, minPrice, maxPrice);
                    totalProductCount = productDao.getProductCountByCategoryWithPriceRange(
                            categoryId, minPrice, maxPrice);
                } else {
                    products = productDao.getAllProductsByCategoryId(categoryId, start, limit, sortBy);
                    totalProductCount = productDao.getTotalProductCountByCategory(categoryId);
                }
            } catch (NumberFormatException e) {
                // Handle invalid category parameter
                if (minPrice != null && maxPrice != null) {
                    products = productDao.getAllProductsWithPriceRange(start, limit, sortBy, minPrice, maxPrice);
                    totalProductCount = productDao.getProductCountWithPriceRange(minPrice, maxPrice);
                } else {
                    products = productDao.getAllProducts(start, limit, sortBy);
                    totalProductCount = productDao.productCount();
                }
            }
        } else {
            if (minPrice != null && maxPrice != null) {
                products = productDao.getAllProductsWithPriceRange(start, limit, sortBy, minPrice, maxPrice);
                totalProductCount = productDao.getProductCountWithPriceRange(minPrice, maxPrice);
            } else {
                products = productDao.getAllProducts(start, limit, sortBy);
                totalProductCount = productDao.productCount();
            }
        }

        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalProductCount / limit);

        // Build category names map
        for (Category category : categories) {
            categoryNames.put((int) category.getCategoryId(), category.getCategoryName());
        }

        // Set attributes for JSP
        request.setAttribute("categories", categories);
        request.setAttribute("productCounts", productCounts);
        request.setAttribute("totalProductCount", totalProductCount);
        request.setAttribute("products", products);
        request.setAttribute("categoryNames", categoryNames);
        request.setAttribute("currentPage", page);
        request.setAttribute("limit", limit);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sort", sortParam);
        request.setAttribute("minPrice", request.getParameter("minPrice"));
        request.setAttribute("maxPrice", request.getParameter("maxPrice"));

        request.getRequestDispatcher("/customer/shop-side-version-2.jsp").forward(request, response);
    }
}