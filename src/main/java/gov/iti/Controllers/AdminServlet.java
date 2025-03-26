package gov.iti.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import gov.iti.Dtos.Admin;
import gov.iti.Dtos.Message;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.AdminDao;

@WebServlet(name = "AdminServlet" ,value = "/admin/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		AdminDao adminDao = new AdminDao(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();
		Message message = null;
		
		if(operation.trim().equals("save")) {
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			
			Admin admin = new Admin(name, email, phone, password);
			boolean flag = adminDao.saveAdmin(admin);

			if(flag) {
				message = new Message("New admin register successfully!", "success", "alert-success");
			}else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}

		}else if(operation.trim().equals("delete")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = adminDao.deleteAdmin(id);
			if(flag) {
				message = new Message("Admin deleted successfully!", "success", "alert-success");
			}else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}
		}
		session.setAttribute("message", message);
		response.sendRedirect("display_admin.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
