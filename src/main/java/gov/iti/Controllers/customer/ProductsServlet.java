package gov.iti.Controllers.customer;

import com.google.gson.Gson;
import gov.iti.Dtos.Product;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/customer/ProductsServlet")
public class ProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println("doGet called in ProductsServlet");

        try {
            ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
            String categoryId = request.getParameter("categoryId");

            List<Product> products;
            if (categoryId == null || categoryId.equals("0")) {
                // Get all products if no categoryId or categoryId is 0 (ALL)
                products = productDao.getAllProducts();
            } else {
                // Get products by category
                products = productDao.getAllProductsByCategoryId(Integer.parseInt(categoryId));
            }

            // Convert to JSON
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(products);

            // Send response
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
            System.out.println("json response written");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading products");
        }
    }
}