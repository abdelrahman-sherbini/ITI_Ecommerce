<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
			<c:forEach var="product" items="${products}">
			<tr class="text-center">
				<td><img src="/customer/images/product/${product.category.name}/${product.image}"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td class="text-start">${product.name}</td>
				<td>${product.category.name}</td>
				<td><fmt:formatNumber value="${product.productPriceAfterDiscount}" type="currency" currencySymbol="$" /></td>
				<td>${product.quantity}</td>
				<td>${product.discount}%</td>
				<td><a href="update_product?product_id=${product.id}" role="button" class="btn btn-secondary">Update</a>&emsp;<a
					href="AddOperationServlet?product_id=${product.id}&operation=deleteProduct"
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

