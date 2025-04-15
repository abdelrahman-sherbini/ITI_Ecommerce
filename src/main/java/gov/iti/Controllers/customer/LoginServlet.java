package gov.iti.Controllers.customer;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.RandomStringUtils;



import gov.iti.Dtos.UserSignIn;
import gov.iti.Entities.User;
import gov.iti.Entities.UserAuth;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Helper.HashGenerator;
import gov.iti.Helper.PasswordHasher;
import gov.iti.Services.AuthService;
import gov.iti.Services.UserDBService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CustomerLoginServlet", value = "/customer/login")
public class LoginServlet extends HttpServlet {

    
    private EntityManager em;
    private UserDBService userDBService;
    private AuthService authService;

    @Override
    public void init() throws ServletException {
        em = EntityManagerProvider.getEntityManager();
        userDBService = new UserDBService(em);
        authService = new AuthService(em);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserSignIn userSignIn = new UserSignIn();
        

        try {
            BeanUtils.populate(userSignIn, req.getParameterMap());
            User databaseUser = logIn(userSignIn);

            if (databaseUser != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("LoggedUser",databaseUser);
                System.out.println(req.getParameter("rememberMe"));
                System.out.println(userSignIn.getRememberMe());
                // remmber me checked
                if (userSignIn.getRememberMeAsBoolean()) {
                    String selector = RandomStringUtils.randomAlphanumeric(12);
                    String rawValidator = RandomStringUtils.randomAlphanumeric(64);
                    
                    String hashValidator = HashGenerator.generateSHA256(rawValidator);

                    

                

                    UserAuth existing = authService.getAuthByUser(databaseUser);

                    if (existing != null) {
                        existing.setSelector(selector);
                        existing.setValidator(hashValidator);
                        authService.update(existing); // merge updates
                    } else {
                        UserAuth newAuth = new UserAuth(databaseUser, selector, hashValidator);
                        authService.addAuth(newAuth); // persist new
                    }
                    
                    
                    Cookie cookieSelector = new Cookie("selector", selector);
                    cookieSelector.setMaxAge(604800);

                    Cookie cookieValidator = new Cookie("validator", rawValidator);
                    cookieValidator.setMaxAge(604800);

                    resp.addCookie(cookieSelector);
                    resp.addCookie(cookieValidator);

                }
                resp.sendRedirect("index.jsp");
            } else {
                // show error message
                req.setAttribute("userSignIn", userSignIn);
                req.setAttribute("errorMessage", "Invalid username or password");
                req.getRequestDispatcher("/customer/signin.jsp").forward(req, resp);

            }
            
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            resp.sendRedirect("404.jsp");
        }
    }

    private User logIn(UserSignIn userSignInDto){
        User user = userDBService.getUserByEmail(userSignInDto.getEmail());
       
       if(user != null){
        boolean verify =PasswordHasher.verifyPassword(userSignInDto.getPassword(), user.getPassword());
        System.out.println(verify);
        if(verify){
            return user;
        }else{
            return null;
        }
       }else{
        return null;
       }
    }

}
