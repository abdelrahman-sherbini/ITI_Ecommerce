package gov.iti.Filters;

import java.io.IOException;

import org.apache.commons.lang3.RandomStringUtils;

import gov.iti.Entities.UserAuth;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Helper.HashGenerator;
import gov.iti.Services.AuthService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/customer/*" })  
public class AutoLoginFilter implements Filter {

    private EntityManager entityManager;
    private AuthService authService;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        entityManager = EntityManagerProvider.getEntityManager();
        authService = new AuthService(entityManager);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        // Only try to auto-login if no session exists or user is not logged in
        if (session == null || session.getAttribute("LoggedUser") == null) {
            Cookie[] cookies = httpRequest.getCookies();
            if (cookies != null) {
                tryAutoLogin(cookies, httpRequest, httpResponse);
            }
        }
        
        // Always continue the filter chain
        chain.doFilter(request, response);
    }
    
    private void tryAutoLogin(Cookie[] cookies, HttpServletRequest request, HttpServletResponse response) {
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
            UserAuth token = authService.findBySelector(selector);
            
            if (token != null) {
                String hashedValidatorDatabase = token.getValidator();
                String hashedValidatorCookie = HashGenerator.generateSHA256(rawValidator);

                if (hashedValidatorCookie.equals(hashedValidatorDatabase)) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("LoggedUser", token.getUser());
                    
                     // update new token in database
                            String newSelector = RandomStringUtils.randomAlphanumeric(12);
                            String newRawValidator = RandomStringUtils.randomAlphanumeric(64);

                            String newHashedValidator = HashGenerator.generateSHA256(newRawValidator);

                            token.setSelector(newSelector);
                            token.setValidator(newHashedValidator);
                            authService.update(token);

                            // update cookie
                            Cookie cookieSelector = new Cookie("selector", newSelector);
                            cookieSelector.setMaxAge(604800);

                            Cookie cookieValidator = new Cookie("validator", newRawValidator);
                            cookieValidator.setMaxAge(604800);

                            response.addCookie(cookieSelector);
                            response.addCookie(cookieValidator);
                }
            }
        }
    }

   
}