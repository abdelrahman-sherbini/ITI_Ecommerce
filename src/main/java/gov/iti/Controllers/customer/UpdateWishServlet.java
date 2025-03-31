package gov.iti.Controllers.customer;

import gov.iti.Dtos.User;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CartDao;
import gov.iti.Model.WishlistDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateWishServlet", value = "/customer/UpdateWishServlet")
public class UpdateWishServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("activeUser");

        String operation = req.getParameter("operation");
        WishlistDao wishlistDao = new WishlistDao(ConnectionProvider.getConnection());
        if (operation.equals("delete")) {
            int wishItem = Integer.parseInt(req.getParameter("wishItem"));
            wishlistDao.deleteWishlist(wishItem);
        }else if(operation.equals("deleteAll")){
            wishlistDao.deleteAllWishlist(user.getUserId());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
