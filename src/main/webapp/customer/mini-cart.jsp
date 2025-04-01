<%--
  Created by IntelliJ IDEA.
  User: abdel
  Date: 3/30/2025
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page errorPage="404.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="gov.iti.Dtos.*" %>
<%@ page import="gov.iti.Model.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %>
<%
  User activeUser = new User("Alice Johnson","alice@example.com","","1234567890","Female");
  activeUser.setUserId(1);
  session.setAttribute("activeUser",activeUser);
//    User activeUser = (User) session.getAttribute("activeUser");


  Connection connection = ConnectionProvider.getConnection();

  CategoryDao catDao = new CategoryDao(connection);
  List<Category> categoryList = catDao.getAllCategories();

  ProductDao productDao = new ProductDao(connection);

  CartDao cartDao = new CartDao(connection);

  OrderDao orderDao = new OrderDao(connection);

  List<Cart> cartList = cartDao.getCartListByUserId(activeUser.getUserId());

  List<Order> orderList = orderDao.getAllOrder();

  OrderedProductDao ordProdDao = new OrderedProductDao(connection);

  UserDao userDao = new UserDao(connection);
%>
<!--====== Mini Product Container ======-->
<div class="mini-product-container gl-scroll u-s-m-b-15">


  <%
    BigDecimal totalPrice = BigDecimal.valueOf(0);

    for (Cart cart : cartList) {

      Product prod  = productDao.getProductsByProductId(cart.getProductId());
      Category category = catDao.getCategoryById(prod.getCategoryId());
      int quantity = cart.getQuantity();
      totalPrice = totalPrice.add (prod.getProductPrice().multiply(BigDecimal.valueOf( quantity)));
      int id = cart.getCartId();

  %>
  <!--====== Card for mini cart ======-->
  <div class="card-mini-product">
    <div class="mini-product">
      <div class="mini-product__image-wrapper">

        <a class="mini-product__link" href="product-detail.jsp?id=<%=prod.getProductId()%>">

          <img class="u-img-fluid" src="images/product/<%=category.getCategoryName()%>/<%=prod.getProductImages()%>" alt=""></a></div>
      <div class="mini-product__info-wrapper">

                                                    <span class="mini-product__category">

                                                        <a href="shop-side-version-2.jsp?id=<%=category.getCategoryId()%>"><%=category.getCategoryName()%></a></span>

        <span class="mini-product__name">

                                                        <a href="product-detail.jsp?id=<%=prod.getProductId()%>"><%=prod.getProductName()%></a></span>

        <span class="mini-product__quantity"><%=cart.getQuantity()%> x</span>

        <span class="mini-product__price">$<%=prod.getProductPrice().multiply(BigDecimal.valueOf( cart.getQuantity())) %></span></div>
    </div>

    <%--                                            <a class="mini-product__delete-link far fa-trash-alt"></a>--%>
    <button type="button" class="mini-product__delete-link far fa-trash-alt border-0 bg-transparent"></button>
    <input type="hidden" name="cartItem" value="<%=cart.getCartId()%>">
  </div>
  <!--====== End - Card for mini cart ======-->

  <%
    }

  %>

</div>
<!--====== End - Mini Product Container ======-->


<!--====== Mini Product Statistics ======-->
<div class="mini-product-stat">
  <div class="mini-total">

    <span class="subtotal-text">SUBTOTAL</span>
    <span class="subtotal-value">$<%=totalPrice%></span></div>
  <div class="mini-action">

    <a class="mini-link btn--e-brand-b-2" href="checkout.jsp">PROCEED TO CHECKOUT</a>

    <a class="mini-link btn--e-transparent-secondary-b-2" href="cart.jsp">VIEW CART</a></div>
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