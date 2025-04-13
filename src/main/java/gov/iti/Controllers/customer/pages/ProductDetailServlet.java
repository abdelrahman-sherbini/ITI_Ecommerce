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
import java.sql.Connection;
import java.util.List;

@WebServlet("/customer/product-detail")
public class ProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("ProductDetailServlet: Request received"); // Debug 1

        int productId;
        try {
            productId = Integer.parseInt(request.getParameter("id"));
            System.out.println("ProductDetailServlet: Product ID = " + productId); // Debug 2
        } catch (NumberFormatException e) {
            System.err.println("ProductDetailServlet: Invalid product ID parameter");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
            return;
        }

        Connection con = ConnectionProvider.getConnection();
        ProductDao productDao = new ProductDao(con);
        Product product = productDao.getProductsByProductId(productId);

        if (product == null) {
            System.err.println("ProductDetailServlet: Product not found for ID: " + productId); // Debug 3
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        System.out.println("ProductDetailServlet: Found product - " + product.getProductName()); // Debug 4

        CategoryDao categoryDao = new CategoryDao(con);
        Category category = categoryDao.getCategoryById(product.getCategoryId());

        if (category == null) {
            System.err.println("ProductDetailServlet: Category not found for product"); // Debug 5
        } else {
            System.out.println("ProductDetailServlet: Found category - " + category.getCategoryName()); // Debug 6
        }


        System.out.println("ProductDetailServlet: Found product - " + product.getProductName());
        request.setAttribute("product", product);
        request.setAttribute("category", category);

        // Fetch similar products
        List<Product> similarProducts = productDao.getAllProductsByCategoryId(product.getCategoryId());
        similarProducts.removeIf(p -> p.getProductId() == productId);
        similarProducts = similarProducts.size() > 4 ? similarProducts.subList(0, 4) : similarProducts;

        System.out.println("ProductDetailServlet: Found " + similarProducts.size() + " similar products"); // Debug 10
        request.setAttribute("similarProducts", similarProducts);

        // Debug before forwarding
        System.out.println("ProductDetailServlet: Forwarding to JSP with all attributes set"); // Debug 11

        request.getRequestDispatcher("/customer/product-detail.jsp").forward(request, response);
    }
}