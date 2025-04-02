<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="gov.iti.Dtos.*" %>
<%@ page import="gov.iti.Model.*" %>
<%@ page import="java.sql.Connection" %>

<%
    User activeUser = new User("Alice Johnson","alice@example.com","","1234567890","Female");
    activeUser.setUserId(1);
//    session.setAttribute("activeUser",activeUser);
//    //User activeUser = (User) session.getAttribute("activeUser");
//
//
    Connection connection = ConnectionProvider.getConnection();
//
//    CategoryDao catDao = new CategoryDao(connection);
//    List<Category> categoryList = catDao.getAllCategories();
//
//    ProductDao productDao = new ProductDao(connection);
//
//    CartDao cartDao = new CartDao(connection);
//
    AddressDao addressDao = new AddressDao(connection);
//    List<Cart> cartList = cartDao.getCartListByUserId(activeUser.getUserId());
    List<Address> addressList = addressDao.getAllAddressList(activeUser.getUserId());

    UserDao userDao = new UserDao(connection);
%>
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-body">
            <div class="checkout-modal2">
                <div class="u-s-m-b-30">
                    <div class="dash-l-r">
                        <h1 class="gl-modal-h1">Shipping Address</h1>
                        <div class="dash__link dash__link--brand">

                            <a data-modal="modal" data-modal-id="#add-ship-address" data-dismiss="modal">Add new Address</a></div>
                    </div>
                </div>
                <%--                            <form class="checkout-modal2__form">--%>
                <div class="dash__table-2-wrap u-s-m-b-30 gl-scroll">
                    <table class="dash__table-2">
                        <thead>
                        <tr>
                            <th>Action</th>
                            <th>Full Name</th>
                            <th>Address</th>
                            <th>City</th>
                            <th>Governorate</th>
                            <th>Type</th>
                            <th>Phone Number</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                            for (Address address : addressList) {



                        %>
                        <tr>
                            <td>

                                <!--====== Radio Box ======-->
                                <div class="radio-box">
                                    <input id="addressID" type="hidden" value="<%=address.getAddress_id()%>">
                                    <input type="radio" id="address-1" name="default-address" value="<%=address.getAddressDescription()%> <%=address.getCity()%> <%=address.getGovernorate()%>" checked="">
                                    <div class="radio-box__state radio-box__state--primary">

                                        <label class="radio-box__label" for="address-1"></label></div>
                                </div>
                                <!--====== End - Radio Box ======-->
                            </td>
                            <td><%=userDao.getUserName(activeUser.getUserId())%></td>
                            <td><%=address.getAddressDescription()%></td>
                            <td><%=address.getCity()%></td>
                            <td><%=address.getGovernorate()%></td>
                            <td><%=address.getType()%></td>
                            <td><%=userDao.getUserPhone(activeUser.getUserId())%></td>
                            <% if(activeUser.getDefaultAddress() == address.getAddress_id()){ %>

                            <td>
                                <div class="gl-text">Default Shipping Address</div>
                            </td>
                            <% }else{%>

                            <td>

                            </td>
                            <% }%>
                        </tr>


                        <%
                            }

                        %>
                        </tbody>
                    </table>
                </div>
                <div class="gl-modal-btn-group">

                    <button id="save-address" class="btn btn--e-brand-b-2" data-dismiss="modal" type="submit">SAVE</button>

                    <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button></div>
                <%--                            </form>--%>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        $("#save-address").click(function() {
            let selectedAddress = $('input[name="default-address"]:checked').val();
            $(".ship-b__p").text(selectedAddress);
            let selectedAdressID = $('input[name="default-address"]:checked').prev("#addressID").val();
            $('input[name="address_ID"]').val(selectedAdressID);
            console.log(selectedAdressID);

        });
        // Use event delegation for dynamically loaded elements
        $(document).on('click', '[data-modal-id="#add-ship-address"]', function (e) {
            e.preventDefault();
            $("#add-ship-address").modal("show");
        });
    });
</script>

