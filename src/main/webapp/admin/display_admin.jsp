<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Admin's</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid px-5 py-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body px-3">
						<div class="container text-center">
							<img src="Images/admin.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Add Admin</h3>
						<%@include file="Components/alert_message.jsp"%>

						<!--admin-form-->
						<form action="AdminServlet?operation=save" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input type="text"
									name="name" placeholder="Enter name" class="form-control"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" placeholder="Email address" class="form-control"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" placeholder="Enter password"
									class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Phone</label> <input type="number"
									name="phone" placeholder="Enter phone number"
									class="form-control" required>
							</div>
							<div class="d-grid gap-2 col-6 mx-auto py-3">
								<button type="submit" class="btn btn-primary me-3">Register</button>
							</div>
						</form>
					</div>

				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body px-3">
						<table class="table table-hover">
							<tr class="text-center table-primary" style="font-size: 18px;">
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Action</th>
							</tr>

							<c:forEach var="admin" items="${admins}">
							<tr class="text-center">
								<td>${admin.name}</td>
								<td>${admin.email}</td>
								<td>${admin.phone}</td>
								<td><a href="AdminServlet?operation=delete&id=${admin.id}" role="button" class="btn btn-danger">Remove</a></td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- add  modal-->
	<%@include file="Components/modals.jsp"%>

	<!-- end of modal -->

</body>
</html>