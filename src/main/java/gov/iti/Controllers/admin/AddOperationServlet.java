package gov.iti.Controllers.admin;

import gov.iti.Model.OrderedProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;

import gov.iti.Dtos.Category;
import gov.iti.Dtos.Message;
import gov.iti.Dtos.Product;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Model.CategoryDao;
import gov.iti.Model.ProductDao;


@MultipartConfig
@WebServlet(name = "AddOperationServlet",value = "/admin/AddOperationServlet")
public class AddOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operation = request.getParameter("operation");
		CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
		ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
		OrderedProductDao orderedProductDao = new OrderedProductDao(ConnectionProvider.getConnection());

		HttpSession session = request.getSession();
		Message message ;

		if (operation.trim().equals("addCategory")) {

			String categoryName = request.getParameter("category_name");
			Part part = request.getPart("category_img");
			Category category = new Category(categoryName, part.getSubmittedFileName());
			boolean flag = catDao.saveCategory(category);

			String path = request.getServletContext().getRealPath("/") + "customer/images/product" + File.separator
					+ part.getSubmittedFileName();
			System.out.println(request.getServletContext().getRealPath("/") );
			writeImage(part, path);

			if (flag) {
				message = new Message("Category added successfully!!", "success", "alert-success");
			} else {
				message = new Message("Something went wrong! Try again!!", "error", "alert-danger");
			}
			session.setAttribute("message", message);
			response.sendRedirect("admin.jsp");

		} else if (operation.trim().equals("addProduct")) {

			// add product to database
			String pName = request.getParameter("name");
			String pDesc = request.getParameter("description");
			BigDecimal pPrice = new BigDecimal(request.getParameter("price"));
			int pDiscount = Integer.parseInt(request.getParameter("discount"));
			if (pDiscount < 0 || pDiscount > 100) {
				pDiscount = 0;
			}
			int pQuantity = Integer.parseInt(request.getParameter("quantity"));
			Part part = request.getPart("photo");
			int categoryType = Integer.parseInt(request.getParameter("categoryType"));

			Product product = new Product(pName, pDesc, pPrice, pDiscount, pQuantity, part.getSubmittedFileName(),
					categoryType);
			boolean flag = pdao.saveProduct(product);

			String path = request.getServletContext().getRealPath("/") + "customer/images/product" + File.separator
					+ part.getSubmittedFileName();
			writeImage(part, path);
			if (flag) {
				message = new Message("Product added successfully!!", "success", "alert-success");
			} else {
				message = new Message("Something went wrong! Try again!!", "error", "alert-danger");
			}
			session.setAttribute("message", message);
			response.sendRedirect("admin.jsp");
			
		} else if (operation.trim().equals("updateCategory")) {

			int category_id = Integer.parseInt(request.getParameter("category_id"));
			String name = request.getParameter("category_name");
			Part part = request.getPart("category_img");
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");
				Category category = new Category(category_id, name, image);
				catDao.updateCategory(category);
			} else {
				Category category = new Category(category_id, name, part.getSubmittedFileName());
				catDao.updateCategory(category);
				String path = request.getServletContext().getRealPath("/") + "customer/images/product" + File.separator
						+ part.getSubmittedFileName();
				writeImage(part, path);
			}
			message = new Message("Category updated successfully!!", "success", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("display_category.jsp");
			
		} else if (operation.trim().equals("deleteCategory")) {

			int category_id = Integer.parseInt(request.getParameter("category_id"));
			catDao.deleteCategory(category_id);
			response.sendRedirect("display_category.jsp");

		} else if (operation.trim().equals("updateProduct")) {

			int product_id = Integer.parseInt(request.getParameter("product_id"));
			String name = request.getParameter("name");
			BigDecimal price = new BigDecimal(request.getParameter("price"));
			String description = request.getParameter("description");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int discount = Integer.parseInt(request.getParameter("discount"));
			if (discount < 0 || discount > 100) {
				discount = 0;
			}
			Part part = request.getPart("product_img");
			int category_id = Integer.parseInt(request.getParameter("categoryType"));

			if (category_id == 0) {
				category_id = Integer.parseInt(request.getParameter("category"));
			}
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");
				Product product = new Product(product_id, name, description, price, discount, quantity, image, category_id);
				pdao.updateProduct(product);
			} else {

				Product product = new Product(product_id, name, description, price, discount, quantity,
						part.getSubmittedFileName(), category_id);
				pdao.updateProduct(product);
				// product image upload
				String path = request.getServletContext().getRealPath("/") + "customer/images/product" + File.separator
						+ part.getSubmittedFileName();
				writeImage(part, path);
			}
			message = new Message("Product updated successfully!!", "success", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("display_products.jsp");

		} else if (operation.trim().equals("deleteProduct")) {

			int product_id = Integer.parseInt(request.getParameter("product_id"));
			if(orderedProductDao.isOrdered(product_id)) {
				message = new Message("Product cannot be deleted, it is still in orders!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
			}else{

			pdao.deleteProduct(product_id);
			response.sendRedirect("display_products.jsp");
			}

		}

	}

	private void writeImage(Part part, String path) {
		try {
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = part.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.flush();
			fos.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
