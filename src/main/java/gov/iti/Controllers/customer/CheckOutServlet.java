package gov.iti.Controllers.customer;

import gov.iti.Dtos.*;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "CheckOutServlet" ,value = "/customer/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String payment = req.getParameter("payment");
        User user = (User) req.getSession().getAttribute("activeUser");
        Message message ;
        String address_I = req.getParameter("address_ID");
        if(address_I == null || address_I.isEmpty()|| Integer.parseInt(address_I) <=0){
            message = new Message("Choose a valid address!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("/customer/checkout.jsp");
            return;
        }
        int address_ID = Integer.parseInt(address_I);
        AddressDao addressDao = new AddressDao(ConnectionProvider.getConnection());
        Address address = addressDao.getAddressById(address_ID);

        OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
        OrderedProductDao orderedProductDao = new OrderedProductDao(ConnectionProvider.getConnection());
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
        List<Cart> cartList = cartDao.getCartListByUserId(user.getUserId());


        BigDecimal totalPrice = BigDecimal.valueOf(0);
        for (Cart cart : cartList) {
            Product prod  = productDao.getProductsByProductId(cart.getProductId());
            int quantity = cart.getQuantity();
            totalPrice = totalPrice.add (prod.getProductPriceAfterDiscount().multiply(BigDecimal.valueOf( quantity)));
        }

        Payment payment1 = new Payment();
        payment1.setAmount(totalPrice);
        payment1.setMethod(payment);
        payment1.setUser_id(user.getUserId());
        payment1.setStatus("paid");

        PaymentDao paymentDao = new PaymentDao(ConnectionProvider.getConnection());
        int paymentID =0;
        if(paymentDao.insertPayment(payment1)){
            paymentID = payment1.getPayment_id();
        }

        Order order = new Order(address.getAddressDescription(),address.getCity(),address.getGovernorate(),paymentID,"Order Confirmed",null, user.getUserId());
        int orderID = orderDao.insertOrder(order);

        for(Cart cart : cartList){
            OrderedProduct orderedProduct = new OrderedProduct();
            orderedProduct.setOrderId(orderID);
            orderedProduct.setProduct_id(cart.getProductId());
            orderedProduct.setQuantity(cart.getQuantity());
            orderedProduct.setPrice(productDao.getProductsByProductId(cart.getProductId()).getProductPriceAfterDiscount().multiply(BigDecimal.valueOf(cart.getQuantity())));
            orderedProductDao.insertOrderedProduct(orderedProduct);
        }
        cartDao.removeAllProduct(user.getUserId());
        resp.sendRedirect("/customer/checkout.jsp?done=true");


    }
}
