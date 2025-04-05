<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User's</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid px-5 py-3">
		<table class="table table-hover">
			<tr class="text-center table-primary" style="font-size: 18px;">
				<th>User Name</th>
				<th>Email</th>
				<th>Phone No.</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Register Date</th>
				<th>Action</th>
			</tr>
			<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.firstName} ${user.lastName}</td>
				<td>${user.email}</td>
				<td>${user.phone}</td>
				<td>${user.gender}</td>
				<td>${user.job}</td>
				<td>${user.registerDate}</td>
<%--				<td><a href="UpdateUserServlet?operation=deleteUser&uid=<%=u.getUserId()%>" role="button" class="btn btn-danger">Remove</a></td>--%>
			</tr>
			</c:forEach>
		</table>
	</div>

		<!-- add  modal-->
		<%@include file="Components/modals.jsp"%>

		<!-- end of modal -->
	
		
</body>
</html>