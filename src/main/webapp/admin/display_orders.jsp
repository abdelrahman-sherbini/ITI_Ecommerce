<%@ page import="java.math.BigDecimal" %>
<%@ include file="Components/common_imports.jsp" %>
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
		<%
		if (orderList == null || orderList.size() == 0) {
		%>
		<div class="container mt-5 mb-5 text-center">
			<img src="Images/empty-cart.png" style="max-width: 200px;"
				class="img-fluid">
			<h4 class="mt-3">Zero Order found</h4>
		</div>
		<%
		} else {
		%>
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
				<%
				for (Order order : orderList) {
					List<OrderedProduct> ordProdList = ordProdDao.getAllOrderedProduct(order.getId());
					for (OrderedProduct orderProduct : ordProdList) {
						Product prod = productDao.getProductsByProductId(orderProduct.getProduct_id());

				%>
				<form action="UpdateOrderServlet?oid=<%=order.getId()%>"
					method="post">
				<tr>
					<td class="text-center"><img
						src="\customer\images\product\<%=prod.getProductImages()%>"
						style="width: 50px; height: 50px; width: auto;"></td>
					<td><%=order.getId()%></td>
					<td><%=prod.getProductName()%><br>Quantity: <%=orderProduct.getQuantity()%><br>Total
						Price: &#8377;<%=orderProduct.getPrice().multiply(BigDecimal.valueOf(orderProduct.getQuantity()))%></td>
					<td><%=userDao.getUserName(order.getUserId())%><br>Mobile No. <%=userDao.getUserPhone(order.getUserId())%><br><%=order.getAddress() +" "+order.getCity()%></td>
					<td><%=order.getDate()%></td>
					<td><%= "COD"%></td>
					<td><%=order.getStatus()%></td>
					<td><select id="operation" name="status" class="form-select">
							<option>--Select Operation--</option>
							<option value="Order Confirmed">Order Confirmed</option>
							<option value="Shipped">Shipped</option>
							<option value="Out For Delivery">Out For Delivery</option>
							<option value="Delivered">Delivered</option>
							<option value="Canceled">Canceled</option>
					</select></td>
					<td>
						<%
						if (order.getStatus().equals("Delivered")) {
						%>
						<button type="submit" class="btn btn-success disabled">Update</button>
						<%
						} else {
						%>
						<button type="submit" class="btn btn-secondary">Update</button> 
						<%
						 }
						 %>
					</td>
				</tr>
				</form>
				<%
				}
				}
				%>
			</table>

		</div>
		<%
		}
		%>
	</div>

		<!-- add  modal-->
		<%@include file="Components/modals.jsp"%>

		<!-- end of modal -->
	
</body>
</html>