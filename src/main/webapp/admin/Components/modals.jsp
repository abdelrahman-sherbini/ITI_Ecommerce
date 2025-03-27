<%@ page import="gov.iti.Model.CategoryDao" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="gov.iti.Dtos.Category" %>
<%@ page import="java.util.List" %><%

    CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
    List<Category> categoryList = catDao.getAllCategories();
%>
<!-- add category modal-->
<div class="modal fade" id="add-category" tabindex="-1"
aria-labelledby="addCategoryModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="addCategoryModalLabel">Add
                Category Here</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
        </div>
        <form action="AddOperationServlet" method="post"
            enctype="multipart/form-data">
            <div class="modal-body">
                <input type="hidden" name="operation" value="addCategory">

                <div class="mb-3">
                    <label class="form-label"><b>Category Name</b></label> <input
                        type="text" name="category_name"
                        placeholder="Enter category here" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label"><b>Category
                            Image</b></label> <input class="form-control" type="file"
                        name="category_img" id="formFile">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary me-3">Add
                    Category</button>
            </div>
        </form>
    </div>
</div>
</div>
<!-- end of modal -->

<!-- add product modal-->
<div class="modal fade" id="add-product" tabindex="-1"
aria-labelledby="addProductModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="addProductModalLabel">Add
                Product Here</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
        </div>
        <form action="AddOperationServlet" method="post"
            name="addProductForm" enctype="multipart/form-data">
            <div class="modal-body">
                <input type="hidden" name="operation" value="addProduct">
                <div>
                    <label class="form-label"><b>Product Name</b></label> <input
                        type="text" name="name" placeholder="Enter product name"
                        class="form-control" required>
                </div>
                <div class="mb-2">
                    <label class="form-label"><b>Product Description</b></label>
                    <textarea class="form-control" name="description" rows="4"
                        placeholder="Enter product description"></textarea>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label class="form-label"><b>Unit Price</b></label> <input
                            type="number" name="price" placeholder="Enter price"
                            class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label class="form-label"><b>Discount Percentage</b></label> <input
                            type="number" name="discount" onblur="validate()"
                            placeholder="Enter discount if any!" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label class="form-label"><b>Product Quantity</b></label> <input
                            type="number" name="quantity"
                            placeholder="Enter product quantity" class="form-control">
                    </div>
                    <div class="col-md-6 mb-2">
                        <label class="form-label"><b>Select Category Type</b></label> <select
                            name="categoryType" class="form-control">
                            <option value="0">--Select Category--</option>
                            <%
                                for (Category c : categoryList) {
                            %>
                            <option value="<%=c.getCategoryId()%>">
                                <%=c.getCategoryName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="mb-2">
                    <label class="form-label"><b>Product Image</b></label> <input
                        type="file" name="photo" class="form-control" required>


                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary me-3">Add
                    Product</button>
            </div>
        </form>
    </div>
</div>
</div>
<!-- end of modal -->