<%--
  Created by IntelliJ IDEA.
  User: abdel
  Date: 3/30/2025
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<!--====== Mini Product Container ======-->
<div class="mini-product-container gl-scroll u-s-m-b-15">


<c:forEach var="cart" items="${LoggedUser.carts}">
  <!--====== Card for mini cart ======-->
  <div class="card-mini-product">
    <div class="mini-product">
      <div class="mini-product__image-wrapper">

        <a class="mini-product__link" href="product-detail.jsp?id=${cart.product.id}">

          <img class="u-img-fluid" src="images/product/${cart.product.category.name}/${cart.product.image}" alt=""></a></div>
      <div class="mini-product__info-wrapper">

                                                    <span class="mini-product__category">

                                                        <a href="shop-side-version-2.jsp?id=${cart.product.category.id}">${cart.product.category.name}</a></span>

        <span class="mini-product__name">

                                                        <a href="product-detail.jsp?id=${cart.product.id}">${cart.product.name}</a></span>

        <span class="mini-product__quantity">${cart.quantity} x</span>

        <span class="mini-product__price"><fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="$" /></span></div>
    </div>

    <%--                                            <a class="mini-product__delete-link far fa-trash-alt"></a>--%>
    <button type="button" class="mini-product__delete-link far fa-trash-alt border-0 bg-transparent"></button>
    <input type="hidden" name="cartItem" value="${cart.id}">
  </div>
  <!--====== End - Card for mini cart ======-->
</c:forEach>


</div>
<!--====== End - Mini Product Container ======-->


<!--====== Mini Product Statistics ======-->
<div class="mini-product-stat">
  <div class="mini-total">

    <span class="subtotal-text">SUBTOTAL</span>
    <span class="subtotal-value"><fmt:formatNumber value="${LoggedUser.totalPrice}" type="currency" currencySymbol="$" /></span></div>
  <div class="mini-action">

    <a class="mini-link btn--e-brand-b-2" href="checkout.jsp">PROCEED TO CHECKOUT</a>

    <a class="mini-link btn--e-transparent-secondary-b-2" href="cart">VIEW CART</a></div>
</div>
<!--====== End - Mini Product Statistics ======-->
<script>
  jQuery(document).ready(function(){
    $('.mini-product__delete-link').on('click', function (e) {
      e.preventDefault(); // Prevent default button behavior
      $(this).off();

      var $miniCartCount = $(".total-item-round");
      var $miniCartCountval = parseInt($miniCartCount.last().text());

      var $button = $(this);
      var $row = $button.closest('div'); // Find the closest parent div to remove
      var cartItem = $button.siblings('[name="cartItem"]').val(); // Get cart item ID
      var $priceSpan = $(".mini-total").find('.subtotal-value');
      var pri = parseFloat($priceSpan.text().replace("$", ""));
      updateMiniTotals(pri *-1,$priceSpan);
      if (!cartItem) return;

      $.post("UpdateCartServlet", {
        operation: "delete",
        cartItem: cartItem
      }, function (response) {
        $miniCartCount.text($miniCartCountval-1);
        // Fade out and remove the row smoothly
        $row.fadeOut(300, function () {
          $(this).remove();
        });
      }).fail(function () {
        alert("Failed to delete item. Please try again."); // Handle errors
      });
    });
  });
  function updateMiniTotals(addme,pricespan) {
    var subtotal = 0;


    subtotal += parseFloat(pricespan.text().replace("$", "")); // Remove "$" and convert to number
    subtotal += addme;


    pricespan.text(`$${subtotal.toFixed(2)}`);

  }
</script>