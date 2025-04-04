package gov.iti.Controllers.customer;

import gov.iti.Dtos.Cart;
import gov.iti.Dtos.User;
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
        User user = (User) req.getSession().getAttribute("LoggedUser");

        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        if (operation.equals("delete")) {
            int cartItem = Integer.parseInt(req.getParameter("cartItem"));
            cartDao.removeProduct(cartItem);
        } else if (operation.equals("UpdateOrder")) {
            int cartItem = Integer.parseInt(req.getParameter("cartItem"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            cartDao.updateQuantity(cartItem, quantity);
        }else if (operation.equals("AddOrder")){
            Cart cart = new Cart();
            cart.setQuantity(1);
            cart.setUserId(user.getUserId());
            int productID = Integer.parseInt(req.getParameter("productID"));
            cart.setProductId(productID);
            cartDao.addToCart(cart);
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int deleteCartItem = Integer.parseInt(req.getParameter("deleteCart"));
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        User user = (User) req.getSession().getAttribute("LoggedUser");
        if(deleteCartItem == 1){
            cartDao.removeAllProduct(user.getUserId());
            resp.sendRedirect("cart.jsp");
        }
    }
}
