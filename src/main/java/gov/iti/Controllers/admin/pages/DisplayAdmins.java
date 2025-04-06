package gov.iti.Controllers.admin.pages;

import gov.iti.Entities.Admin;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AdminService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayAdmins",value = "/admin/display_admin")
public class DisplayAdmins  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = EntityManagerProvider.getEntityManager();

        AdminService adminService = new AdminService(em);
        List<Admin> admins = adminService.getAllAdmins();
        req.setAttribute("admins", admins);
        EntityManagerProvider.closeEntityManager(em);
        req.getRequestDispatcher("display_admin.jsp").forward(req, resp);

    }
}
