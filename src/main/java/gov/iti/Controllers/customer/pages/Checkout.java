package gov.iti.Controllers.customer.pages;

import gov.iti.Entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet(name = "Checkout" ,value = "/customer/checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("LoggedUser");




        Set<gov.iti.Entities.Cart> cartList = user.getCarts();
        if(cartList.isEmpty()){
            req.getRequestDispatcher("empty-cart.jsp").forward(req,resp);
        }else{

            req.setAttribute("cartList", cartList);
            req.getRequestDispatcher("checkout.jsp").forward(req,resp);
        }

    }
}
