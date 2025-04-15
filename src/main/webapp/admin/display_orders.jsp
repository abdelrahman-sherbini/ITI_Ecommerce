<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Order's</title>
	<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- order details -->

	<div class="container-fluid px-3 py-3">
		<c:if test="${empty orders || empty orders}">
		<div class="container mt-5 mb-5 text-center">
			<img src="Images/empty-cart.png" style="max-width: 200px;"
				class="img-fluid">
			<h4 class="mt-3">Zero Order found</h4>
		</div>
			</c:if>

		<c:if test="${not empty orders}">


		<div class="container-fluid">
			<table class="table table-hover">
				<tr class="table-primary" style="font-size: 18px;">
					<th class="text-center">Product</th>
					<th>Order ID</th>
					<th>Product Details</th>
					<th>Delivery Address</th>
					<th>Date & Time</th>
					<th>Payment Type</th>
					<th>Status</th>
					<th colspan="2" class="text-center">Action</th>
				</tr>
				<c:forEach var="order" items="${orders}">
				<c:forEach var="orderedProduct" items="${order.orderedProducts}">

				<form action="UpdateOrderServlet?oid=${order.id}"
					method="post">
				<tr>
					<td class="text-center"><img
						src="/customer/images/product/${orderedProduct.product.category.name}/${orderedProduct.product.image}"
						style="width: 50px; height: 50px; width: auto;"></td>
					<td>${order.id}</td>
					<td>${orderedProduct.product.name}<br>Quantity: ${orderedProduct.quantity}<br>Total
						Price:<fmt:formatNumber value="${orderedProduct.price}" type="currency" currencySymbol="$" /> </td>
					<td>${order.user.firstName} ${order.user.lastName}<br>Mobile No. ${order.user.phone}<br>${order.address} ${order.city}</td>
					<td>${order.date}</td>
					<td><%= "COD"%></td>
					<td>${order.status}</td>
					<td><select id="operation" name="status" class="form-select">
							<option>--Select Operation--</option>
							<option value="Order Confirmed">Order Confirmed</option>
							<option value="Shipped">Shipped</option>
							<option value="Out For Delivery">Out For Delivery</option>
							<option value="Delivered">Delivered</option>
							<option value="Canceled">Canceled</option>
					</select></td>
					<td>

						<c:choose>
							<c:when test="${order.status == 'Delivered'}">
								<button type="submit" class="btn btn-success disabled">Update</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-secondary">Update</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</form>
				</c:forEach>
				</c:forEach>
			</table>

		</div>
		</c:if>
	</div>

		<!-- add  modal-->
		<%@include file="Components/modals.jsp"%>

		<!-- end of modal -->
	<script src="JS/script.js"></script>
</body>
</html>