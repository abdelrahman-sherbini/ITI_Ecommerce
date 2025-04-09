package gov.iti.Controllers.customer.pages;

import gov.iti.Entities.User;
import gov.iti.Entities.Wishlist;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WishList" ,value = "/customer/wishlist")
public class WishList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = EntityManagerProvider.getEntityManager();

        UserDBService userDBService = new UserDBService(entityManager);
        User user = (User) req.getSession().getAttribute("LoggedUser");


        List<Wishlist> wishlists = userDBService.getWishlists(user.getId());
        if(wishlists.isEmpty()){
            req.getRequestDispatcher("empty-wishlist.jsp").forward(req,resp);
        }else{

        req.setAttribute("wishlists", wishlists);
        req.getRequestDispatcher("wishlist.jsp").forward(req, resp);
        }

        EntityManagerProvider.closeEntityManager(entityManager);
    }
}
