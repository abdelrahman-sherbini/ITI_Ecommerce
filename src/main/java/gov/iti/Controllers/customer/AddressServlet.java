package gov.iti.Controllers.customer;

import java.io.IOException;

import gov.iti.Dtos.Address;
import gov.iti.Dtos.Message;
import gov.iti.Dtos.User;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.AddressDao;
import gov.iti.Model.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

@WebServlet(name = "AddressServlet" ,value = "/customer/AddressServlet")
public class AddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");
        User user = (User) req.getSession().getAttribute("LoggedUser");
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        AddressDao addressDao = new AddressDao(ConnectionProvider.getConnection());
        Message message ;
        if (operation.equals("addAddress")) {
            Address address = new Address();
            String dash = req.getParameter("dash");
            try{
                BeanUtils.populate(address,req.getParameterMap());
            }catch(Exception e){
                e.printStackTrace();
            }

            addressDao.insertAddress(address, user.getUserId());
            if(dash != null && !dash.isEmpty()){
                message = new Message("Added address successfully!", "success", "alert-success");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
            }
        }else if(operation.equals("updateAddress")) {
            int address_id = Integer.parseInt(req.getParameter("address_id"));
            if(!addressDao.checkAddress(address_id, user.getUserId())) {

                message = new Message("Address does not exist!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
                return;
            }
            Address address = new Address();
            try{
                BeanUtils.populate(address,req.getParameterMap());
            }catch(Exception e){
                e.printStackTrace();
            }


            addressDao.updateAddress(address_id,address);
            message = new Message("Updated address successfully!", "success", "alert-success");
            req.getSession().setAttribute("message", message);
            resp.sendRedirect("dash-address-book.jsp");

        }else if(operation.equals("deleteAddress")) {
            int address_id = Integer.parseInt(req.getParameter("address_id"));
            if(!addressDao.checkAddress(address_id, user.getUserId())) {
                return;
            }
            addressDao.deleteAddressById(address_id);

        }else if(operation.equals("makeDefaultAddress")) {
            int address_id = Integer.parseInt(req.getParameter("address_id"));
            if(!addressDao.checkAddress(address_id, user.getUserId())) {
                message = new Message("Address does not exist!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
                return;
            }
            User user2 = userDao.getUserByID(user.getUserId());
            if(user2 != null) {
                user2.setDefaultAddress(address_id);
                userDao.updateUserDefaultAddresss(user2);
                req.getSession().setAttribute("LoggedUser", user2);
                message = new Message("Default address successfully!", "success", "alert-success");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
            }else{
                message = new Message("Error!", "error", "alert-danger");
                req.getSession().setAttribute("message", message);
                resp.sendRedirect("dash-address-book.jsp");
            }
        }

    }
}
