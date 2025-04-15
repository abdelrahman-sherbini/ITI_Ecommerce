package gov.iti.Controllers.customer;

import java.io.IOException;


import org.apache.commons.beanutils.BeanUtils;

import gov.iti.Dtos.Address;


import gov.iti.Dtos.UserSignUp;
import gov.iti.Entities.User;
import gov.iti.Entities.UserAddress;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Helper.MailMessenger;
import gov.iti.Helper.PasswordHasher;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SignUpServlet" ,value = "/customer/signup")
public class SignUpServlet extends HttpServlet{
    
    private EntityManager em;
    private UserDBService userDBService;

    @Override
    public void init() throws ServletException {
         
        em = EntityManagerProvider.getEntityManager();
        userDBService = new UserDBService(em);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSignUp user = new UserSignUp();
        Address defaultAddress = new Address();
        try {
           
            BeanUtils.populate(user, req.getParameterMap());
            
            BeanUtils.populate(defaultAddress, req.getParameterMap());
            user.setAddress(defaultAddress);
            String dob = (String) req.getParameter("dob");
            user.setDob(dob);
 
            User databaseUser  = signUp(user);

            if (user != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("LoggedUser", databaseUser);
                
               
                // send email
                MailMessenger.successfullyRegister(databaseUser.getFirstName(), databaseUser.getEmail());
                
                // Redirect to home page or welcome page
                resp.sendRedirect("index.jsp");
            } else {
                // Forward to error page or show message
                // req.setAttribute("errorMessage", "Failed to sign up. Please try again.");
                // req.getRequestDispatcher("/signup.jsp").forward(req, resp);
                resp.sendRedirect("404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Replace with proper logging
            resp.sendRedirect("404.jsp");
            // req.setAttribute("errorMessage", "An internal error occurred.");
            // req.getRequestDispatcher("/signup.jsp").forward(req, resp);
        }
    }

    private  User signUp(UserSignUp userSignUpDto){
        // hash password
        userSignUpDto.setPassword(PasswordHasher.hashPassword(userSignUpDto.getPassword()));
        User user = new User();
        user.setFirstName(userSignUpDto.getFirstName());
        user.setLastName(userSignUpDto.getLastName());
        user.setEmail(userSignUpDto.getEmail());
        user.setPassword(userSignUpDto.getPassword());
        user.setPhone(userSignUpDto.getPhone());
        user.setGender(userSignUpDto.getGender());
        user.setJob(userSignUpDto.getJob());
        user.setDob(userSignUpDto.getDob());
        user.setCredit(userSignUpDto.getCreditAsDouble()); 
        
        if (userSignUpDto.getAddress() != null) {
            UserAddress userAddress = new UserAddress();
            userAddress.setAddress(userSignUpDto.getAddress().getAddressDescription());
            userAddress.setCity(userSignUpDto.getAddress().getCity());
            userAddress.setGovernorate(userSignUpDto.getAddress().getGovernorate());
            userAddress.setUser(user);
            userAddress.setPinCode(userSignUpDto.getAddress().getType());
            userAddress.setType(userSignUpDto.getAddress().getType());

            user.setDefaultAddress(userAddress); // Set as default
            user.getUserAddresses().add(userAddress); // Add to the list
        }

        if( userDBService.addUser(user)){
            return user;
        }else{
            return null;
        }
    }

}
