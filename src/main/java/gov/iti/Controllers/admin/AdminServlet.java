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

import java.io.IOException;

@WebServlet(name = "AdminServlet" ,value = "/admin/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  IOException {
		EntityManager em = EntityManagerProvider.getEntityManager();
		AdminService adminService = new AdminService(em);
		String operation = request.getParameter("operation");

		HttpSession session = request.getSession();
		Message message = null;
		
		if(operation.trim().equals("save")) {
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			
			Admin admin = new Admin(name, email, phone, password);
			boolean flag =adminService.createAdmin(admin);
;

			if(flag) {
				message = new Message("New admin register successfully!", "success", "alert-success");
			}else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}

		}else if(operation.trim().equals("delete")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = adminService.deleteAdmin(id);
			if(flag) {
				message = new Message("Admin deleted successfully!", "success", "alert-success");
			}else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}
		}
		session.setAttribute("message", message);
		response.sendRedirect("display_admin");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
		doGet(request, response);
	}

}
