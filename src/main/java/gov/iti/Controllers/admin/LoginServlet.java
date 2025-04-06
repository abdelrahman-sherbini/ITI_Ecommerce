package gov.iti.Controllers.admin;

import gov.iti.Dtos.Message;
import gov.iti.Entities.Admin;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AdminService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet" ,value = "/admin/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			  {

				  EntityManager em = EntityManagerProvider.getEntityManager();
				  AdminService adminService = new AdminService(em);
			try {
				String userName = request.getParameter("email");
				String password = request.getParameter("password");

				Admin admin = adminService.getAdminByEmailAndPassword(userName,password);
				
				HttpSession session = request.getSession();
				if (admin != null) {
					session.setAttribute("activeAdmin", admin);
					System.out.println("Admin logged in");
					response.sendRedirect("admin");
				} else {
					Message message = new Message("Invalid details! Try again!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("adminlogin.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
				  EntityManagerProvider.closeEntityManager(em);
	}

}
