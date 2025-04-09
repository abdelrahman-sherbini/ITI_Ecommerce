package gov.iti.Controllers.customer.pages;

import gov.iti.Dtos.Message;
import gov.iti.Entities.User;
import gov.iti.Entities.UserAddress;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AddressService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "dashAddressEdit" ,value = "/customer/dash-address-edit")
public class dashAddressEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager entityManager = EntityManagerProvider.getEntityManager();
        UserDBService userDBService = new UserDBService(entityManager);
        AddressService addressService = new AddressService(entityManager);

        Message message;

        String address_I = req.getParameter("id");
        if(address_I == null || address_I.isEmpty()|| Integer.parseInt(address_I) <=0){
            message = new Message("Choose a valid address!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("dash-address-book.jsp");
            return;
        }
        Long address_ID = Long.parseLong(address_I);
        UserAddress address= addressService.getAddressByID(address_ID);

        if(address.getUser().getId() != user.getId()) {
            message = new Message("Address does not exist!", "error", "alert-danger");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("dash-address-book.jsp");
            return;
        }

        req.setAttribute("address", address);

        req.getRequestDispatcher("dash-address-edit.jsp").forward(req, resp);
    }
}