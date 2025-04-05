<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="Components/common_css_js.jsp"%>
<style type="text/css">
.cus-active {
	background-color: #e6eefa !important;
	width: 100%;
}

.list-btn {
	font-size: 18px !important;
}

.list-btn:hover {
	color: #2874f0 !important;
}

.no-border {
	border: 0;
	box-shadow: none;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!--admin dashboard -->
	<div class="container-fluid py-4 px-3">

		<div class="row">
			<div class="container text-center" id="details">
				<img src="Images/admin.png" style="max-width: 180px;"
					class="img-fluid">
				<h3>
					Welcome "${activeAdmin.name}"
				</h3>
			</div>
		</div>
		<div class="container">
			<div class="row px-3 py-3">
				<div class="col-md-4">
					<a href="display_category">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/categories.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Category</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_products">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/products.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Products</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_orders">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/order.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Order</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row px-3">
				<div class="col-md-4 offset-md-2">
					<a href="display_users">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/users.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">User's</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_admin">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/add-admin.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Admin</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--end-->

	<!-- add  modal-->
	<%@include file="Components/modals.jsp"%>

	<!-- end of modal -->


</body>
</html>