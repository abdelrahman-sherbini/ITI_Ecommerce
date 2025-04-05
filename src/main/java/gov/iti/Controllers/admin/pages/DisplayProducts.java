package gov.iti.Controllers.admin.pages;

import gov.iti.Entities.Product;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayProducts",value = "/admin/display_products")
public class DisplayProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();

        ProductService productService = new ProductService(em);
        List<Product> products = productService.getAllProducts();

        req.setAttribute("products",products);
        req.getRequestDispatcher("/admin/display_products.jsp").forward(req, resp);

        em.close();
    }
}
