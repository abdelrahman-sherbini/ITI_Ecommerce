<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

			<c:forEach var="categorie" items="${categories}">
			<tr class="text-center">
				<td><img src="/customer/images/product/${categorie.image}"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td>${categorie.name}</td>
				<td><a href="update_category?category_id=${categorie.id}" role="button" class="btn btn-secondary">Update</a>&emsp;<a
					href="AddOperationServlet?category_id=${categorie.id}&operation=deleteCategory"
					class="btn btn-danger" role="button">Delete</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>

		<!-- add  modal-->
		<%@include file="Components/modals.jsp"%>

		<!-- end of modal -->

		
</body>
</html>
