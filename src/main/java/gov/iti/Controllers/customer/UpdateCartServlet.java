package gov.iti.Controllers.customer;

import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CartDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateCartServlet", value = "/customer/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String operation = req.getParameter("operation");
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        if (operation.equals("delete")) {
            int cartItem = Integer.parseInt(req.getParameter("cartItem"));
            cartDao.removeProduct(cartItem);
        } else if (operation.equals("UpdateOrder")) {
            int cartItem = Integer.parseInt(req.getParameter("cartItem"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            cartDao.updateQuantity(cartItem, quantity);
        }
    }
}
