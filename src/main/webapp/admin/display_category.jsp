<%@ page import="gov.iti.Dtos.Admin" %>
<%@ page import="gov.iti.Dtos.Category" %>
<%@ page import="gov.iti.Model.CategoryDao" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
	CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
	List<Category> categoryList = catDao.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Categories</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- Category -->
	<div class="container mt-3">
	<%@include file="Components/alert_message.jsp"%>
		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>Image</th>
				<th>Category Name</th>
				<th>Action</th>
			</tr>
			<%
			for (Category c : categoryList) {
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=c.getCategoryImage()%>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td><%=c.getCategoryName()%></td>
				<td><a href="update_category.jsp?category_id=<%=c.getCategoryId()%>" role="button" class="btn btn-secondary">Update</a>&emsp;<a
					href="AddOperationServlet?category_id=<%=c.getCategoryId()%>&operation=deleteCategory"
					class="btn btn-danger" role="button">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>
