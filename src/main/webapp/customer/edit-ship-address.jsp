<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page errorPage="404.jsp" %>

<%--@elvariable id="LoggedUser" type="gov.iti.Entities.User"--%>
<%--@elvariable id="address" type="gov.iti.Entities.UserAddress"--%>

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
                        <c:forEach var="address" items="${addressList}">
                        <tr>
                            <td>

                                <!--====== Radio Box ======-->
                                <div class="radio-box">
                                    <input class="addressID" type="hidden" value="${address.id}">
                                    <input type="radio" id="address-1" name="default-address" value="${address.address} - ${address.city} - ${address.governorate}" >
                                    <div class="radio-box__state radio-box__state--primary">

                                        <label class="radio-box__label" for="address-1"></label></div>
                                </div>
                                <!--====== End - Radio Box ======-->
                            </td>
                            <td>${LoggedUser.firstName} ${LoggedUser.lastName}</td>
                            <td>${address.address}</td>
                            <td>${address.city}</td>
                            <td>${address.governorate}</td>
                            <td>${address.type} </td>
                            <td>${LoggedUser.phone}</td>
                            <c:choose>
                                <c:when test="${LoggedUser.defaultAddress.id == address.id}">
                                    <td>
                                        <div class="gl-text">Default Shipping Address</div>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>

                                    </td>
                                </c:otherwise>
                            </c:choose>

                        </tr>


                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="gl-modal-btn-group">

                    <button id="save-address" class="btn btn--e-brand-b-2" data-dismiss="modal" type="submit">SAVE</button>

                    <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button></div>
                <%--                            </form>--%>

</div>

<script>
    $(document).ready(function () {
        let check = true;
        if(  $('input[name="first_time"]').val() ==1 ){
            $('input[name="first_time"]').val(0)
            $('.addressID').each(function() {
            if ($(this).val() == ${LoggedUser.defaultAddress.id}) {
                // Find the next radio button and check it
                $(this).next('input[type="radio"]').prop('checked', true);
                let selectedAddress = $('input[name="default-address"]:checked').val();
                $(".ship-b__p").text(selectedAddress);
                check = false;
            }
        });
        if(check){
            $('.addressID').first().next('input[type="radio"]').prop('checked', true);
            let selectedAddress = $('input[name="default-address"]:checked').val();
            $(".ship-b__p").text(selectedAddress);
        }
        let selectedAdressID = $('input[name="default-address"]:checked').prev(".addressID").val();
        $('input[name="address_ID"]').val(selectedAdressID);
        }else{
            $('.addressID').each(function() {
                if ($(this).val() == $('input[name="address_ID"]').val()) {
                    // Find the next radio button and check it
                    $(this).next('input[type="radio"]').prop('checked', true);

                }
            });
        }

        $("#save-address").click(function() {
            let selectedAddress = $('input[name="default-address"]:checked').val();
            $(".ship-b__p").text(selectedAddress);
            let selectedAdressID = $('input[name="default-address"]:checked').prev(".addressID").val();
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

