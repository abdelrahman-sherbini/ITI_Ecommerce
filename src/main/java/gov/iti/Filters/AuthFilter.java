package gov.iti.Filters;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.lang3.RandomStringUtils;

import gov.iti.Dtos.AuthToken;
import gov.iti.Dtos.Message;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.HashGenerator;
import gov.iti.Model.AuthDao;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/customer/checkout.jsp", "/customer/CheckOutServlet", "/customer/wishlist.jsp",
        "/customer/dashboard.jsp","/customer/dash-address-add.jsp","/customer/dash-address-book.jsp","/customer/dash-address-edit.jsp",
        "/customer/dash-address-make-default.jsp" ,"/customer/dash-edit-profile.jsp","/customer/dash-my-profile.jsp","/customer/dashboard.jsp"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Cookie[] cookies = httpRequest.getCookies();

        HttpSession session = httpRequest.getSession(true);
        // if not logged in
        if (session.getAttribute("LoggedUser") == null) {
            if (cookies != null) {
                String selector = "";
                String rawValidator = "";

                for (Cookie aCookie : cookies) {
                    if (aCookie.getName().equals("selector")) {
                        selector = aCookie.getValue();
                    } else if (aCookie.getName().equals("validator")) {
                        rawValidator = aCookie.getValue();
                    }
                }
                if (!"".equals(selector) && !"".equals(rawValidator)) {
                    AuthDao authDAO = new AuthDao(ConnectionProvider.getConnection());
                    AuthToken token = authDAO.findBySelector(selector);

                    if (token != null) {
                        String hashedValidatorDatabase = token.getValidator();
                        String hashedValidatorCookie = HashGenerator.generateSHA256(rawValidator);

                        if (hashedValidatorCookie.equals(hashedValidatorDatabase)) {
                            session = httpRequest.getSession();
                            session.setAttribute("userId", token.getUserId());

                            // update new token in database
                            String newSelector = RandomStringUtils.randomAlphanumeric(12);
                            String newRawValidator = RandomStringUtils.randomAlphanumeric(64);

                            String newHashedValidator = HashGenerator.generateSHA256(newRawValidator);

                            token.setSelector(newSelector);
                            token.setValidator(newHashedValidator);
                            authDAO.update(token);

                            // update cookie
                            Cookie cookieSelector = new Cookie("selector", newSelector);
                            cookieSelector.setMaxAge(604800);

                            Cookie cookieValidator = new Cookie("validator", newRawValidator);
                            cookieValidator.setMaxAge(604800);

                            httpResponse.addCookie(cookieSelector);
                            httpResponse.addCookie(cookieValidator);

                        } else {
                            httpResponse.sendRedirect("signin.jsp");
                            return;
                        }
                    } else {
                        httpResponse.sendRedirect("signin.jsp");
                        return;
                    }
                } else {
                    httpResponse.sendRedirect("signin.jsp");
                    return;
                }

            } else {

                httpResponse.sendRedirect("signin.jsp");
                return;
            }

        }

        chain.doFilter(request, response);
    }

}
