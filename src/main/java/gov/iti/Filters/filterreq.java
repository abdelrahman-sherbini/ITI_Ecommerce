package gov.iti.Filters;

import java.io.IOException;
import java.util.ArrayList;

import gov.iti.Dtos.Message;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class filterreq implements Filter{
     public void init(FilterConfig filterConfig)
        throws ServletException
    {
    }
 
    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
        throws IOException, ServletException
    {
         HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getServletPath(); // Get requested URL
        ArrayList<String> exclude = new ArrayList<>();
        exclude.add("/admin/adminlogin.jsp");
        exclude.add("/admin/LoginServlet");
        exclude.add("/admin/CSS");
        exclude.add("/admin/JS");
        exclude.add("/admin/Images");
        exclude.add("/admin/Components");
        boolean isExcluded = exclude.stream().anyMatch(path::startsWith);
        if(!isExcluded) {


        HttpSession session = httpRequest.getSession(true);

        if (session.getAttribute("activeAdmin") == null) {
            Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
            session.setAttribute("message", message);
            httpResponse.sendRedirect("adminlogin.jsp");
            return;  // Stop further processing of the request
        }

        }
        chain.doFilter(request, response);
    }

}
