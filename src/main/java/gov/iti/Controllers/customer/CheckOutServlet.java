package gov.iti.Controllers.customer;


import gov.iti.Controllers.admin.OrderSSE;
import gov.iti.Dtos.Message;
import gov.iti.Entities.*;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AddressService;
import gov.iti.Services.OrderService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@WebServlet(name = "CheckOutServlet" ,value = "/customer/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String payment = req.getParameter("payment");
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager em = EntityManagerProvider.getEntityManager();
        AddressService addressService = new AddressService(em);
        UserDBService userDBService = new UserDBService(em);
        OrderService orderService = new OrderService(em);

        Message message ;
        String address_I = req.getParameter("address_ID");
        if(address_I == null || address_I.isEmpty()|| Integer.parseInt(address_I) <=0){
            message = new Message("Choose a valid address!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("/customer/checkout");
            return;
        }
        Long address_ID = Long.parseLong(address_I);
        UserAddress address= addressService.getAddressByID(address_ID);



        Set<Cart> cartList = user.getCarts();


        BigDecimal totalPrice = user.getTotalPrice();


        Payment payment1 = new Payment();
        payment1.setAmount(totalPrice);
        payment1.setMethod(payment);
        payment1.setUser(user);
        payment1.setStatus("paid");

        Set<OrderedProduct> orderedProducts = new HashSet<>();


        Order order = new Order();
        order.setUser(user);
        order.setPayment(payment1);
        order.setStatus("Order Confirmed");
        order.setAddress(address.getAddress());
        order.setCity(address.getCity());
        order.setGovernorate(address.getGovernorate());

        for(Cart cart : cartList){
            OrderedProduct orderedProduct = new OrderedProduct();
            orderedProduct.setProduct(cart.getProduct());
            orderedProduct.setQuantity(cart.getQuantity());
            orderedProduct.setPrice(cart.getTotal());
            orderedProduct.setOrder(order);
            orderedProducts.add(orderedProduct);
        }

        order.setOrderedProducts(orderedProducts);

        if(orderService.addOrder(order)){
            OrderSSE.broadcast(order);

        if(userDBService.removeAllCarts(user.getId())){
            user = userDBService.refreshUser(user);
            req.getSession().setAttribute("LoggedUser", user);
        }
        }


        resp.sendRedirect("/customer/checkout?done=true");


    }
}
