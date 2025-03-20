package gov.iti;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "download", value = "/download")
public class download extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fileName");
        FileInputStream fis = new FileInputStream("C:/tmp/"+fileName);
//        resp.setContentType("text/plain");
//        resp.setHeader("Content-disposition", "attachment; filename="+fileName+ "\"");

        try(InputStream in = new FileInputStream("C:/tmp/"+fileName);
            OutputStream out = resp.getOutputStream()) {

//            byte[] buffer = new byte[ARBITARY_SIZE];
//
//            int numBytesRead;
//            while ((numBytesRead = in.read(buffer)) > 0) {
//                out.write(buffer, 0, numBytesRead);
//            }
            int temp;

            // If there is content inside file
            // than read
            while ((temp = in.read()) != -1)
                out.write((byte)temp);

        }

    }

    public void destroy() {
    }
}
