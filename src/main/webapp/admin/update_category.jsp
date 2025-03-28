<%@ include file="Components/common_imports.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update category -->
	<%
	int category_id = Integer.parseInt(request.getParameter("category_id"));
	Category category = catDao.getCategoryById(category_id);
	%>
	<div class="container mt-5">
		<div class="row row-cols-1 row-cols-md-1 offset-md-2">
			<div class="col">
				<div class="card w-75">
					<div class="card-header text-center">
						<h3>Edit Category</h3>
					</div>
					<form action="AddOperationServlet?category_id=<%=category_id%>" method="post"
						enctype="multipart/form-data">
						<div class="card-body">
							<input type="hidden" name="operation" value="updateCategory">
							<div class="mb-3">
								<label class="form-label"><b>Category Name</b></label> <input
									type="text" name="category_name" value="<%=category.getCategoryName()%>" class="form-control" >
							</div>
							<div class="mb-3">
								<label class="form-label"><b>Category
										Image</b></label><input class="form-control" type="file" name="category_img">
							</div>
							<div class="mb-3">
								<label class="form-label"><b>Uploaded Image:&nbsp;</b></label><%=category.getCategoryImage()%>&emsp;<img
									src="\customer\images\product<%=category.getCategoryImage()%>"
									style="width: 80px; height: 80px; width: auto;">
								<input type="hidden" name="image" value="<%=category.getCategoryImage()%>">
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-lg btn-primary me-3">Update</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end-->
</body>
</html>