<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update product -->

	<div class="container mt-3">
		<div class="row ">
			<div class="col">
				<div class="card">
					<div class="card-header text-center">
						<h3>Edit Product</h3>
					</div>
					<form action="AddOperationServlet?product_id=${product.id}" method="post"
						name="updateProductForm" enctype="multipart/form-data">
						<div class="card-body">
							<input type="hidden" name="operation" value="updateProduct">
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Product Name</b></label> <input
										type="text" name="name" value="${product.name}"
										class="form-control">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Unit Price</b></label> <input
										class="form-control" type="number" name="price"
										value="${product.price}" required>
								</div>
							</div>
							<div class="mb-2">
								<label class="form-label"><b>Product Description</b></label>
								<textarea class="form-control" name="description" rows="3">${product.description}</textarea>
							</div>
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Product Quantity</b></label> <input
										type="number" name="quantity"
										value="${product.quantity}" class="form-control">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Discount Percentage</b></label> <input
										type="number" name="discount" onblur="validate()"
										value="${product.discount}" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Product Image</b></label><input
										class="form-control" type="file" name="product_img">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Select Category Type</b></label>
									<select
										name="categoryType" class="form-control">
										<option value="0">--Select Category--</option>
										<c:forEach var="categorie" items="${categories}">

										<option value="${categorie.id}">
												${categorie.name}</option>

										</c:forEach>
									</select>
									<input type="hidden" name="category"
										value="${product.category.id}">
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label"><b>Uploaded Image:&nbsp;</b></label>${product.image}
								&emsp;<img src="/customer/images/product/${product.category.name}/${product.image}"
									style="width: 80px; height: 80px; width: auto;"> <input
									type="hidden" name="image"
									value="${product.image}">
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
	<!-- end -->

	<script type="text/javascript">
		function validate() {
			var dis = document.updateProductForm.discount.value;
			if (dis > 100 || dis < 0) {
				alert("Discount need tobe between 0-100 !");
				return false;
			}
		}
	</script>
</body>
</html>