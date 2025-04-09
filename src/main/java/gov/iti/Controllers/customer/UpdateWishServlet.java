package gov.iti.Controllers.customer;


import gov.iti.Entities.User;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import gov.iti.Services.WishListService;
import jakarta.persistence.EntityManager;
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
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager entityManager = EntityManagerProvider.getEntityManager();
        WishListService wishListService = new WishListService(entityManager);
        UserDBService userDBService = new UserDBService(entityManager);

        String operation = req.getParameter("operation");
        if (operation.equals("delete")) {
            Long wishItem = Long.parseLong(req.getParameter("wishItem"));
            wishListService.deleteWishList(wishItem);

        }else if(operation.equals("deleteAll")){
            userDBService.removeAllWishes(user.getId());

        }

        EntityManagerProvider.closeEntityManager(entityManager);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
