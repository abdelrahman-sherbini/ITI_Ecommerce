package gov.iti.Controllers.customer;

import java.io.IOException;

import gov.iti.Dtos.Address;
import gov.iti.Dtos.User;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.AddressDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddressServlet" ,value = "/customer/AddressServlet")
public class AddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");
        User user = (User) req.getSession().getAttribute("activeUser");
        AddressDao addressDao = new AddressDao(ConnectionProvider.getConnection());
        if (operation.equals("addAddress")) {
            Address address = new Address();
            String addressDesc = req.getParameter("addressDesc");
            String governorate = req.getParameter("governorate");
            String city = req.getParameter("city");
            String type = req.getParameter("type");
            address.setAddressDescription(addressDesc);
            address.setCity(city);
            address.setGovernorate(governorate);
            address.setType(type);
            addressDao.insertAddress(address, user.getUserId());
        }

    }
}
