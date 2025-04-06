package gov.iti.Controllers.admin;

import gov.iti.Dtos.Message;
import gov.iti.Entities.Category;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Model.CategoryDao;
import gov.iti.Model.OrderedProductDao;
import gov.iti.Model.ProductDao;
import gov.iti.Services.CategoryService;
import gov.iti.Services.OrderedProductService;
import gov.iti.Services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;


@MultipartConfig
@WebServlet(name = "AddOperationServlet",value = "/admin/AddOperationServlet")
public class AddOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManager em = EntityManagerProvider.getEntityManager();
		ProductService productService = new ProductService(em);
		OrderedProductService orderedProductService = new OrderedProductService(em);
		CategoryService categoryService = new CategoryService(em);

		String operation = request.getParameter("operation");
		CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
		ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
		OrderedProductDao orderedProductDao = new OrderedProductDao(ConnectionProvider.getConnection());

		HttpSession session = request.getSession();
		Message message ;

		if (operation.trim().equals("addCategory")) {

			String categoryName = request.getParameter("category_name");
			Part part = request.getPart("category_img");
			gov.iti.Entities.Category category = new gov.iti.Entities.Category(categoryName,part.getSubmittedFileName());
//			Category category = new Category(categoryName, part.getSubmittedFileName());
			boolean flag = categoryService.createCategory(category);


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
			response.sendRedirect("admin");

		} else if (operation.trim().equals("addProduct")) {

			// add product to database
			String name = request.getParameter("name");
			BigDecimal price = new BigDecimal(request.getParameter("price"));
			String description = request.getParameter("description");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Long discount = Long.parseLong(request.getParameter("discount"));
			if (discount < 0 || discount > 100) {
				discount = 0L;
			}
			Part part = request.getPart("photo");
			Long category_id = Long.parseLong(request.getParameter("categoryType"));

			if (category_id == 0) {
				category_id = Long.parseLong(request.getParameter("category"));
			}

			gov.iti.Entities.Category category = categoryService.getCategory(category_id);

				gov.iti.Entities.Product p = new gov.iti.Entities.Product(  name, description, price, discount, quantity, part.getSubmittedFileName(), category);
			boolean flag = productService.addProduct(p);
				// product image upload
				String path = request.getServletContext().getRealPath("/") + "customer/images/product/"+category.getName() + File.separator
						+ part.getSubmittedFileName();
				writeImage(part, path);



			if (flag) {
				message = new Message("Product added successfully!!", "success", "alert-success");
			} else {
				message = new Message("Something went wrong! Try again!!", "error", "alert-danger");
			}
			session.setAttribute("message", message);
			response.sendRedirect("admin");
			
		} else if (operation.trim().equals("updateCategory")) {

			Long category_id = Long.parseLong(request.getParameter("category_id"));

			String name = request.getParameter("category_name");
			Part part = request.getPart("category_img");
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");

				gov.iti.Entities.Category category = new gov.iti.Entities.Category(category_id,name,image);

				 categoryService.updateCategory(category);
			} else {
				gov.iti.Entities.Category category = new gov.iti.Entities.Category(category_id,name,part.getSubmittedFileName());

				categoryService.updateCategory(category);
				String path = request.getServletContext().getRealPath("/") + "customer/images/product" + File.separator
						+ part.getSubmittedFileName();
				writeImage(part, path);
			}
			message = new Message("Category updated successfully!!", "success", "alert-success");
			session.setAttribute("message", message);
			List<Category> categories = categoryService.getAllCategories();
			request.getServletContext().setAttribute("categories", categories);
			response.sendRedirect("display_category");
			
		} else if (operation.trim().equals("deleteCategory")) {

			Long category_id = Long.parseLong(request.getParameter("category_id"));
			categoryService.deleteCategory(category_id);
			List<Category> categories = categoryService.getAllCategories();
			request.getServletContext().setAttribute("categories", categories);
			response.sendRedirect("display_category");

		} else if (operation.trim().equals("updateProduct")) {

			Long product_id = Long.parseLong(request.getParameter("product_id"));
			String name = request.getParameter("name");
			BigDecimal price = new BigDecimal(request.getParameter("price"));
			String description = request.getParameter("description");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Long discount = Long.parseLong(request.getParameter("discount"));
			if (discount < 0 || discount > 100) {
				discount = 0L;
			}
			Part part = request.getPart("product_img");
			Long category_id = Long.parseLong(request.getParameter("categoryType"));

			if (category_id == 0) {
				category_id = Long.parseLong(request.getParameter("category"));
			}
			gov.iti.Entities.Category category = categoryService.getCategory(category_id);
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");

				gov.iti.Entities.Product p = new gov.iti.Entities.Product( product_id, name, description, price, discount, quantity, image, category);
				productService.updateProduct(p);
			} else {
				gov.iti.Entities.Product p = new gov.iti.Entities.Product( product_id, name, description, price, discount, quantity, part.getSubmittedFileName(), category);
				productService.updateProduct(p);
				// product image upload
				String path = request.getServletContext().getRealPath("/") + "customer/images/product/"+category.getName() + File.separator
						+ part.getSubmittedFileName();
				writeImage(part, path);
			}
			message = new Message("Product updated successfully!!", "success", "alert-success");
			session.setAttribute("message", message);

			response.sendRedirect("display_products");

		} else if (operation.trim().equals("deleteProduct")) {

			int product_id = Integer.parseInt(request.getParameter("product_id"));


			gov.iti.Entities.Product product = productService.getProductById(product_id);

			if(orderedProductService.isOrdered(product) ) {
				message = new Message("Product cannot be deleted, it is still in orders!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products");
			}else{
			productService.deleteProduct(product);
				message = new Message("Product deleted successfully", "success", "alert-success");
				session.setAttribute("message", message);
			response.sendRedirect("display_products");
			}

		}
		EntityManagerProvider.closeEntityManager(em);
	}

	private void writeImage(Part part, String path) {
		File targetDir = new File(path).getParentFile();

// Check if the directory exists, and if not, create it
		if (!targetDir.exists()) {
			if (targetDir.mkdirs()) {
				System.out.println("Directory created: " + targetDir.getAbsolutePath());
			} else {
				System.out.println("Failed to create directory: " + targetDir.getAbsolutePath());
			}
		}

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
