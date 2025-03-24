package gov.iti.Controllers;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "upload", value = "/upload")
@MultipartConfig(location="C:/tmp", fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("fileName");
        Part part = req.getPart("myfile");
//        String fName =part.getName();
        String lName =part.getSubmittedFileName();
        part.write(name +"."+ lName.split("\\.")[1]);

        resp.sendRedirect("index.jsp?success=true");

    }

    public void destroy() {
    }
}