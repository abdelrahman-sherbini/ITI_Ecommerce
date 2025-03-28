<%@ include file="Components/common_imports.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product's</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update product -->
	<div class="container mt-3">
		<%@include file="Components/alert_message.jsp"%>
		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>Image</th>
				<th>Name</th>
				<th class="text-start">Category</th>
				<th>Price</th>
				<th class="text-start">Quantity</th>
				<th class="text-start">Discount</th>
				<th>Action</th>
			</tr>
			<%
			List<Product> productList = productDao.getAllProducts();
			for (Product prod : productList) {
				String category = catDao.getCategoryName(prod.getCategoryId());
			%>
			<tr class="text-center">
				<td><img src="\customer\images\product\<%=prod.getProductImages()%>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td class="text-start"><%=prod.getProductName()%></td>
				<td><%=category%></td>
				<td>&#8377;<%=prod.getProductPriceAfterDiscount()%></td>
				<td><%=prod.getProductQunatity()%></td>
				<td><%=prod.getProductDiscount()%>%</td>
				<td><a href="update_product.jsp?product_id=<%=prod.getProductId()%>" role="button" class="btn btn-secondary">Update</a>&emsp;<a
					href="AddOperationServlet?product_id=<%=prod.getProductId()%>&operation=deleteProduct"
					class="btn btn-danger" role="button">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

		<!-- add  modal-->
		<%@include file="Components/modals.jsp"%>

		<!-- end of modal -->

		
</body>
</html>

