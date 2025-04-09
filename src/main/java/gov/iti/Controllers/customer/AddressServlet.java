package gov.iti.Controllers.customer;

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
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;

@WebServlet(name = "AddressServlet" ,value = "/customer/AddressServlet")
public class AddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");
        User user = (User) req.getSession().getAttribute("LoggedUser");
        EntityManager em = EntityManagerProvider.getEntityManager();
        AddressService addressService = new AddressService(em);
        UserDBService userDBService = new UserDBService(em);
        user = userDBService.refreshUser(user);

        Message message ;
        if (operation.equals("addAddress")) {
            UserAddress address = new UserAddress();
            String dash = req.getParameter("dash");
            try{
                BeanUtils.populate(address,req.getParameterMap());
            }catch(Exception e){
                e.printStackTrace();
            }
            address.setUser(user);
            addressService.addAddress(address);
//            addressDao.insertAddress(address, user.getUserId());
            if(dash != null && !dash.isEmpty()){
                user = userDBService.refreshUser(user);
                user.getWishlists().size();
                user.getWishlists().size();
                user.getOrders().size();
                req.getSession().setAttribute("LoggedUser", user);
                message = new Message("Added address successfully!", "success", "alert-success");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
            }
        }
        else if(operation.equals("updateAddress")) {
            Long address_id = Long.parseLong(req.getParameter("address_id"));
            UserAddress address = addressService.getAddressByID(address_id);
            if(address.getUser().getId() != user.getId()) {
                message = new Message("Address does not exist!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
                return;
            }

            try{
                BeanUtils.populate(address,req.getParameterMap());
            }catch(Exception e){
                e.printStackTrace();
            }

            address.setUser(user);

            if(addressService.updateAddress(address)){

                user = userDBService.refreshUser(user);
                user.getWishlists().size();
                user.getWishlists().size();
                user.getOrders().size();
                req.getSession().setAttribute("LoggedUser", user);
            message = new Message("Updated address successfully!", "success", "alert-success");
            req.getSession().setAttribute("message", message);
            }else{
                message = new Message("Failed to update address!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
            }
            resp.sendRedirect("dash-address-book.jsp");

        }
        else if(operation.equals("deleteAddress")) {

            Long address_id = Long.parseLong(req.getParameter("address_id"));
            UserAddress address = addressService.getAddressByID(address_id);
            if(address.getUser().getId() != user.getId()) {
                message = new Message("Address does not exist!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
                return;
            }
            if(addressService.deleteAddress(address_id)){
                user = userDBService.refreshUser(user);
                user.getWishlists().size();
                user.getWishlists().size();
                user.getOrders().size();
                req.getSession().setAttribute("LoggedUser", user);
            }


        }else if(operation.equals("makeDefaultAddress")) {
            Long address_id = Long.parseLong(req.getParameter("address_id"));
            UserAddress address = addressService.getAddressByID(address_id);
            if(address.getUser().getId() != user.getId()) {
                message = new Message("Address does not exist!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
                return;
            }

                user.setDefaultAddress(address);
                if(userDBService.updateUser(user)){
                    user = userDBService.refreshUser(user);
                    user.getWishlists().size();
                    user.getWishlists().size();
                    user.getOrders().size();
                    req.getSession().setAttribute("LoggedUser", user);
                }
                message = new Message("Default address successfully!", "success", "alert-success");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");

        }

    }
}
