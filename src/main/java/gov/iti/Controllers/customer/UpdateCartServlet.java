package gov.iti.Controllers.customer;


import gov.iti.Entities.Cart;
import gov.iti.Entities.Product;
import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.CartService;
import gov.iti.Services.ProductService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
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

        EntityManager em = EntityManagerProvider.getEntityManager();
        CartService cartService = new CartService(em);
        UserDBService userDBService = new UserDBService(em);
        ProductService productService = new ProductService(em);

        String operation = req.getParameter("operation");
        User user = (User) req.getSession().getAttribute("LoggedUser");

//        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        if (operation.equals("delete")) {
            Long cartItem = Long.parseLong(req.getParameter("cartItem"));
            if(cartService.removeCart(cartItem)){

            user = userDBService.refreshUser(user);
            req.getSession().setAttribute("LoggedUser", user);
                System.out.println(user.getCarts().size() + " carts removed");

            }
//            cartDao.removeProduct(cartItem);
        } else if (operation.equals("UpdateOrder")) {
            Long cartItem = Long.parseLong(req.getParameter("cartItem"));
            Long quantity = Long.parseLong(req.getParameter("quantity"));
            if(cartService.updateCartQuantity(cartItem, quantity)){
                user = userDBService.refreshUser(user);
                req.getSession().setAttribute("LoggedUser", user);
            }

//            cartDao.updateQuantity(cartItem, quantity);
        }else if (operation.equals("AddOrder")){
            Cart cart = new Cart();
            cart.setQuantity(1L);
            cart.setUser(user);
            Long productID = Long.parseLong(req.getParameter("productID"));
            Product product = productService.getProductById(productID);
            cart.setProduct(product);
//            cart.setProductId(productID);
            if(cartService.addCart(cart)){
                user = userDBService.refreshUser(user);
                req.getSession().setAttribute("LoggedUser", user);
            }
//            cartDao.addToCart(cart);
            
        }

        EntityManagerProvider.closeEntityManager(em);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int deleteCartItem = Integer.parseInt(req.getParameter("deleteCart"));
        EntityManager em = EntityManagerProvider.getEntityManager();
        User user = (User) req.getSession().getAttribute("LoggedUser");
        UserDBService userDBService = new UserDBService(em);
        if(deleteCartItem == 1){
            if(userDBService.removeAllCarts(user.getId())){
                user = userDBService.refreshUser(user);
                req.getSession().setAttribute("LoggedUser", user);
            }
//            cartDao.removeAllProduct(user.getUserId());
            resp.sendRedirect("cart");
        }
    }
}
