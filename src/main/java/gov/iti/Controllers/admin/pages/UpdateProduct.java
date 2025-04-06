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

@WebServlet(name = "UpdateProduct",value = "/admin/update_product")
public class UpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();
        int id = Integer.parseInt(req.getParameter("product_id"));

        ProductService productService = new ProductService(em);
        Product product = productService.getProductById(id);
        req.setAttribute("product",product);

        req.getRequestDispatcher("/admin/update_product.jsp").forward(req, resp);

        EntityManagerProvider.closeEntityManager(em);
    }
}
