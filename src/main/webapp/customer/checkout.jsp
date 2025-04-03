<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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

    AddressDao addressDao = new AddressDao(connection);
    List<Cart> cartList = cartDao.getCartListByUserId(activeUser.getUserId());
    List<Address> addressList = addressDao.getAllAddressList(activeUser.getUserId());
    if(cartList.isEmpty()){
        request.getRequestDispatcher("empty-cart.jsp").forward(request,response);
    }
    UserDao userDao = new UserDao(connection);
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="images/favicon.png" rel="shortcut icon">
    <title>Ludus - Electronics, Apparel, Computers, Books, DVDs & more</title>

    <!--====== Google Font ======-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

    <!--====== Vendor Css ======-->
    <link rel="stylesheet" href="css/vendor.css">

    <!--====== Utility-Spacing ======-->
    <link rel="stylesheet" href="css/utility.css">

    <!--====== App ======-->
    <link rel="stylesheet" href="css/app.css">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>
<body class="config">
    <div class="preloader is-active">
        <div class="preloader__wrap">

            <img class="preloader__img" src="images/preloader.png" alt=""></div>
    </div>

    <!--====== Main App ======-->
    <div id="app">

        <!--====== Main Header ======-->
        <jsp:include page="header.jsp"/>
        <!--====== End - Main Header ======-->


        <!--====== App Content ======-->
        <div class="app-content">

            <!--====== Section 1 ======-->
            <div class="u-s-p-y-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="breadcrumb">
                            <div class="breadcrumb__wrap">
                                <ul class="breadcrumb__list">
                                    <li class="has-separator">

                                        <a href="index.jsp">Home</a></li>
                                    <li class="is-marked">

                                        <a href="checkout.jsp">Checkout</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section 1 ======-->


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                    <%@include file="Components/alert_message.jsp"%>
                                <div id="checkout-msg-group">
                                    <div class="msg u-s-m-b-30">

                                        <span class="msg__text">Returning customer?

                                            <a class="gl-link" href="#return-customer" data-toggle="collapse">Click here to login</a></span>
                                        <div class="collapse" id="return-customer" data-parent="#checkout-msg-group">
                                            <div class="l-f u-s-m-b-16">

                                                <span class="gl-text u-s-m-b-16">If you have an account with us, please log in.</span>
                                                <form class="l-f__form">
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-15">

                                                            <label class="gl-label" for="login-email">E-MAIL *</label>

                                                            <input class="input-text input-text--primary-style" type="text" id="login-email" placeholder="Enter E-mail"></div>
                                                        <div class="u-s-m-b-15">

                                                            <label class="gl-label" for="login-password">PASSWORD *</label>

                                                            <input class="input-text input-text--primary-style" type="text" id="login-password" placeholder="Enter Password"></div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-15">

                                                            <button class="btn btn--e-transparent-brand-b-2" type="submit">LOGIN</button></div>
                                                        <div class="u-s-m-b-15">

                                                            <a class="gl-link" href="lost-password.jsp">Lost Your Password?</a></div>
                                                    </div>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="remember-me">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="remember-me">Remember Me</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="msg">
                                        <span class="msg__text">Have a coupon?

                                            <a class="gl-link" href="#have-coupon" data-toggle="collapse">Click Here to enter your code</a></span>
                                        <div class="collapse" id="have-coupon" data-parent="#checkout-msg-group">
                                            <div class="c-f u-s-m-b-16">

                                                <span class="gl-text u-s-m-b-16">Enter your coupon code if you have one.</span>
                                                <form class="c-f__form">
                                                    <div class="u-s-m-b-16">
                                                        <div class="u-s-m-b-15">

                                                            <label for="coupon"></label>

                                                            <input class="input-text input-text--primary-style" type="text" id="coupon" placeholder="Coupon Code"></div>
                                                        <div class="u-s-m-b-15">

                                                            <button class="btn btn--e-transparent-brand-b-2" type="submit">APPLY</button></div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            <!--====== End - Section 2 ======-->


            <!--====== Section 3 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="checkout-f">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                                    <form class="checkout-f__delivery">
                                        <div class="u-s-m-b-30">
                                            <div class="u-s-m-b-15">

                                                <!--====== Check Box ======-->
                                                <div class="check-box">

                                                    <input type="checkbox" id="get-address">
                                                    <div class="check-box__state check-box__state--primary">

                                                        <label class="check-box__label" for="get-address">Use default shipping and billing address from account</label></div>
                                                </div>
                                                <!--====== End - Check Box ======-->
                                            </div>

                                            <!--====== First Name, Last Name ======-->
                                            <div class="gl-inline">
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-fname">FIRST NAME *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="billing-fname" data-bill=""></div>
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-lname">LAST NAME *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="billing-lname" data-bill=""></div>
                                            </div>
                                            <!--====== End - First Name, Last Name ======-->


                                            <!--====== E-MAIL ======-->
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-email">E-MAIL *</label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-email" data-bill=""></div>
                                            <!--====== End - E-MAIL ======-->


                                            <!--====== PHONE ======-->
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-phone">PHONE *</label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-phone" data-bill=""></div>
                                            <!--====== End - PHONE ======-->


                                            <!--====== Street Address ======-->
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-street">STREET ADDRESS *</label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-street" placeholder="House name and street name" data-bill=""></div>
                                            <div class="u-s-m-b-15">

                                                <label for="billing-street-optional"></label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-street-optional" placeholder="Apartment, suite unit etc. (optional)" data-bill=""></div>
                                            <!--====== End - Street Address ======-->


                                            <!--====== Country ======-->
                                            <div class="u-s-m-b-15">

                                                <!--====== Select Box ======-->

                                                <label class="gl-label" for="billing-country">COUNTRY *</label><select class="select-box select-box--primary-style" id="billing-country" data-bill="">
                                                    <option selected value="">Choose Country</option>
                                                    <option value="uae">United Arab Emirate (UAE)</option>
                                                    <option value="uk">United Kingdom (UK)</option>
                                                    <option value="us">United States (US)</option>
                                                </select>
                                                <!--====== End - Select Box ======-->
                                            </div>
                                            <!--====== End - Country ======-->


                                            <!--====== Town / City ======-->
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-town-city" data-bill=""></div>
                                            <!--====== End - Town / City ======-->


                                            <!--====== STATE/PROVINCE ======-->
                                            <div class="u-s-m-b-15">

                                                <!--====== Select Box ======-->

                                                <label class="gl-label" for="billing-state">STATE/PROVINCE *</label><select class="select-box select-box--primary-style" id="billing-state" data-bill="">
                                                    <option selected value="">Choose State/Province</option>
                                                    <option value="al">Alabama</option>
                                                    <option value="al">Alaska</option>
                                                    <option value="ny">New York</option>
                                                </select>
                                                <!--====== End - Select Box ======-->
                                            </div>
                                            <!--====== End - STATE/PROVINCE ======-->


                                            <!--====== ZIP/POSTAL ======-->
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-zip">ZIP/POSTAL CODE *</label>

                                                <input class="input-text input-text--primary-style" type="text" id="billing-zip" placeholder="Zip/Postal Code" data-bill=""></div>
                                            <!--====== End - ZIP/POSTAL ======-->
                                            <div class="u-s-m-b-10">

                                                <!--====== Check Box ======-->
                                                <div class="check-box">

                                                    <input type="checkbox" id="make-default-address" data-bill="">
                                                    <div class="check-box__state check-box__state--primary">

                                                        <label class="check-box__label" for="make-default-address">Make default shipping and billing address</label></div>
                                                </div>
                                                <!--====== End - Check Box ======-->
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <a class="gl-link" href="#create-account" data-toggle="collapse">Want to create a new account?</a></div>
                                            <div class="collapse u-s-m-b-15" id="create-account">

                                                <span class="gl-text u-s-m-b-15">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</span>
                                                <div>

                                                    <label class="gl-label" for="reg-password">Account Password *</label>

                                                    <input class="input-text input-text--primary-style" type="text" data-bill id="reg-password"></div>
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <label class="gl-label" for="order-note">ORDER NOTE</label><textarea class="text-area text-area--primary-style" id="order-note"></textarea></div>
                                            <div>

                                                <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button></div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-6">
                                    <h1 class="checkout-f__h1">ORDER SUMMARY</h1>

                                    <!--====== Order Summary ======-->
                                    <div class="o-summary">
                                        <div class="o-summary__section u-s-m-b-30">
                                            <div class="o-summary__item-wrap gl-scroll">
                                                <%
                                                    BigDecimal totalPrice = BigDecimal.valueOf(0);
                                                    for (Cart cart : cartList) {

                                                        Product prod  = productDao.getProductsByProductId(cart.getProductId());
                                                        Category category = catDao.getCategoryById(prod.getCategoryId());
                                                        int quantity = cart.getQuantity();
                                                        totalPrice = totalPrice.add (prod.getProductPriceAfterDiscount().multiply(BigDecimal.valueOf( quantity)));
                                                        int id = cart.getCartId();

                                                %>
                                                <div class="o-card">
                                                    <div class="o-card__flex">
                                                        <div class="o-card__img-wrap">

                                                            <img class="u-img-fluid" src="images/product/<%=category.getCategoryName()%>/<%=prod.getProductImages()%>" alt=""></div>
                                                        <div class="o-card__info-wrap">

                                                            <span class="o-card__name">

                                                                <a href="product-detail.jsp?id=<%=prod.getProductId()%>"><%=prod.getProductName()%></a></span>

                                                            <span class="o-card__quantity">Quantity x <%=cart.getQuantity()%></span>

                                                            <span class="o-card__price">$<%=prod.getProductPriceAfterDiscount().multiply(BigDecimal.valueOf( cart.getQuantity())) %></span></div>
                                                    </div>

<%--                                                    <a class="o-card__del far fa-trash-alt"></a>--%>
<%--                                                    <button type="button" class="o-card__del far fa-trash-alt"></button>--%>
<%--                                                    <input type="hidden" name="cartItem" value="<%=cart.getCartId()%>">--%>
                                                </div>
                                                <%
                                                    }

                                                %>
                                            </div>
                                        </div>
                                        <div class="o-summary__section u-s-m-b-30">
                                            <div class="o-summary__box">
                                                <h1 class="checkout-f__h1">SHIPPING & BILLING</h1>
                                                <div class="ship-b">

                                                    <span class="ship-b__text">Ship to:</span>

                                                    <div class="ship-b__box u-s-m-b-10">
<%--                                                        <p class="ship-b__p">4247 Ashford Drive Virginia VA-20006 USA (+0) 900901904</p>--%>
                                                        <p class="ship-b__p"></p>

                                                        <a class="ship-b__edit btn--e-transparent-platinum-b-2" data-modal="modal" data-modal-id="#edit-ship-address" data-dismiss="modal">Edit</a>
                                                    </div>
                                                    <div class="ship-b__box">

                                                        <span class="ship-b__text">Bill to default billing address</span>

                                                        <a class="ship-b__edit btn--e-transparent-platinum-b-2" data-modal="modal" data-modal-id="#edit-ship-address" data-dismiss="modal">Edit</a></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="o-summary__section u-s-m-b-30">
                                            <div class="o-summary__box">
                                                <table class="o-summary__table">
                                                    <tbody>
                                                        <tr>
                                                            <td>SHIPPING</td>
                                                            <td>$4.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>TAX</td>
                                                            <td>$0.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>SUBTOTAL</td>
                                                            <td>$<%=totalPrice%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>GRAND TOTAL</td>
                                                            <td>$<%=totalPrice.add(BigDecimal.valueOf(4))%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="o-summary__section u-s-m-b-30">
                                            <div class="o-summary__box">
                                                <h1 class="checkout-f__h1">PAYMENT INFORMATION</h1>
                                                <input type="hidden" name="first_time" value="1">
                                                <form class="checkout-f__payment" action="CheckOutServlet" method="post">
                                                    <input type="hidden" name="address_ID" value="<%=activeUser.getDefaultAddress()%>">
                                                    <div class="u-s-m-b-10">

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="cash-on-delivery" name="payment" value="COD">
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="cash-on-delivery">Cash on Delivery</label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->

                                                        <span class="gl-text u-s-m-t-6">Pay Upon Cash on delivery. (This service is only available for some countries)</span>
                                                    </div>
                                                    <div class="u-s-m-b-10">

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="direct-bank-transfer" name="payment" value="DIRECTBANK">
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="direct-bank-transfer">Direct Bank Transfer</label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->

                                                        <span class="gl-text u-s-m-t-6">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.</span>
                                                    </div>
                                                    <div class="u-s-m-b-10">

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="pay-with-check" name="payment" value="PAYCHECK">
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="pay-with-check">Pay With Check</label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->

                                                        <span class="gl-text u-s-m-t-6">Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</span>
                                                    </div>
                                                    <div class="u-s-m-b-10">

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="pay-with-card" name="payment" value="PAYCREDIT">
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="pay-with-card">Pay With Credit / Debit Card</label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->

                                                        <span class="gl-text u-s-m-t-6">International Credit Cards must be eligible for use within the United States.</span>
                                                    </div>
                                                    <div class="u-s-m-b-10">

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="pay-pal" name="payment" value="PAYPAL" required>
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="pay-pal">Pay Pal</label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->

                                                        <span class="gl-text u-s-m-t-6">When you click "Place Order" below we'll take you to Paypal's site to set up your billing information.</span>
                                                    </div>
                                                    <div class="u-s-m-b-15">

                                                        <!--====== Check Box ======-->
                                                        <div class="check-box">

                                                            <input type="checkbox" id="term-and-condition" required>
                                                            <div class="check-box__state check-box__state--primary">

                                                                <label class="check-box__label" for="term-and-condition">I consent to the</label></div>
                                                        </div>
                                                        <!--====== End - Check Box ======-->

                                                        <a class="gl-link">Terms of Service.</a>
                                                    </div>
                                                    <div>

                                                        <button class="btn btn--e-brand-b-2" type="submit">PLACE ORDER</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!--====== End - Order Summary ======-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            <!--====== End - Section 3 ======-->
        </div>
        <!--====== End - App Content ======-->


        <!--====== Main Footer ======-->
        <jsp:include page="footer.jsp"/>

        <!--====== Modal Section ======-->


        <!--====== Shipping Address Add Modal ======-->
        <div class="modal fade" id="edit-ship-address">
            <jsp:include page="edit-ship-address.jsp"/>

        </div>
        <!--====== End - Shipping Address Add Modal ======-->


        <!--====== Shipping Address Add Modal ======-->
        <div class="modal fade" id="add-ship-address">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="checkout-modal1">
                            <form id="checkout-address" class="checkout-modal1__form" >
                                <input type="hidden" name="operation" value="addAddress">
                                <div class="u-s-m-b-30">
                                    <h1 class="gl-modal-h1">Add new Shipping Address</h1>
                                </div>
                                <div class="gl-inline">
                                    <div class="u-s-m-b-30">

                                        <label class="gl-label" for="address-address">ADDRESS DESCRIPTION *</label>

                                        <input class="input-text input-text--primary-style" type="text" name="addressDescription" id="address-address" placeholder="ADDRESS DESCRIPTION" required>
                                    </div>
                                    <div class="u-s-m-b-30">

                                        <label class="gl-label" for="address-governorate">GOVERNORATE *</label>

<%--                                        <input class="input-text input-text--primary-style" type="text" id="address-governorate" placeholder="GOVERNORATE">--%>
                                        <!--====== Select Box ======-->
                                        <select class="select-box select-box--primary-style" name="governorate" id="address-governorate" required>
                                            <option disabled value="">Choose governorate</option>
                                            <option value="Cairo">Cairo</option>
                                            <option value="Alexandria">Alexandria</option>
                                            <option value="Giza">Giza</option>
                                            <option value="Dakahlia">Dakahlia</option>
                                            <option value="Red Sea">Red Sea</option>
                                            <option value="Beheira">Beheira</option>
                                            <option value="Fayoum">Fayoum</option>
                                            <option value="Gharbia">Gharbia</option>
                                            <option value="Ismailia">Ismailia</option>
                                            <option value="Menoufia">Menoufia</option>
                                            <option value="Minya">Minya</option>
                                            <option value="Qalyubia">Qalyubia</option>
                                            <option value="New Valley">New Valley</option>
                                            <option value="Suez">Suez</option>
                                            <option value="Aswan">Aswan</option>
                                            <option value="Assiut">Assiut</option>
                                            <option value="Beni Suef">Beni Suef</option>
                                            <option value="Port Said">Port Said</option>
                                            <option value="Damietta">Damietta</option>
                                            <option value="Sharkia">Sharkia</option>
                                            <option value="South Sinai">South Sinai</option>
                                            <option value="Kafr El Sheikh">Kafr El Sheikh</option>
                                            <option value="Matrouh">Matrouh</option>
                                            <option value="Luxor">Luxor</option>
                                            <option value="Qena">Qena</option>
                                            <option value="North Sinai">North Sinai</option>
                                            <option value="Sohag">Sohag</option>
                                        </select>
                                        <!--====== End - Select Box ======-->
                                    </div>
                                </div>
                                <div class="gl-inline">
                                    <div class="u-s-m-b-30">

                                        <label class="gl-label" for="address-city">CITY *</label>

                                        <select class="select-box select-box--primary-style" id="address-city" name="city" required>
                                            <option disabled value="">Select City</option>
                                            <option value="Nasr City">Nasr City</option>
                                            <option value="Heliopolis">Heliopolis</option>
                                            <option value="Maadi">Maadi</option>
                                            <option value="Shubra">Shubra</option>
                                            <option value="Zamalek">Zamalek</option>
                                            <option value="New Cairo">New Cairo</option>
                                            <option value="El Marg">El Marg</option>
                                            <option value="Ain Shams">Ain Shams</option>
                                            <option value="El Sayeda Zeinab">El Sayeda Zeinab</option>
                                            <option value="Helwan">Helwan</option>
                                            <option value="6th of October">6th of October</option>
                                            <option value="Obour">Obour</option>
                                        </select>

                                    </div>
                                    <div class="u-s-m-b-30">

                                        <label class="gl-label" for="address-type">Type *</label>

                                        <input class="input-text input-text--primary-style" type="text" name="type" id="address-type" placeholder="House OR Work" required>
                                    </div>
                                </div>

                                <div class="gl-modal-btn-group">

                                    <button class="btn btn--e-brand-b-2" type="submit">SAVE</button>

                                    <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Shipping Address Add Modal ======-->
        <!--====== End - Modal Section ======-->
    </div>
    <!--====== End - Main App ======-->

    <!--====== Vendor Js ======-->
    <script src="js/vendor.js"></script>

    <!--====== jQuery Shopnav plugin ======-->
    <script src="js/jquery.shopnav.js"></script>

    <!--====== App ======-->
    <script src="js/app.js"></script>


    <!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
    <script>
        const citiesByGovernorate = {
            "Cairo": ["Nasr City", "Heliopolis", "Maadi", "Zamalek", "Downtown", "6th of October"],
            "Alexandria": ["Sidi Gaber", "Sporting", "Miami", "Stanley", "Agami"],
            "Giza": ["Dokki", "Mohandessin", "Haram", "Sheikh Zayed"],
            "Dakahlia": ["Mansoura", "Mit Ghamr", "Talkha"],
            "Red Sea": ["Hurghada", "Safaga", "Marsa Alam"],
            "Beheira": ["Damanhur", "Kafr El Dawwar", "Rashid"],
            "Fayoum": ["Fayoum City", "Ibsheway"],
            "Gharbia": ["Tanta", "El Mahalla El Kubra"],
            "Ismailia": ["Ismailia City", "El Qantara"],
            "Menoufia": ["Shebin El Kom", "Menouf"],
            "Minya": ["Minya City", "Beni Mazar"],
            "Qalyubia": ["Banha", "Shubra El Kheima"],
            "New Valley": ["Kharga", "Dakhla"],
            "Suez": ["Suez City"],
            "Aswan": ["Aswan City", "Edfu"],
            "Assiut": ["Assiut City", "Dairut"],
            "Beni Suef": ["Beni Suef City"],
            "Port Said": ["Port Said City"],
            "Damietta": ["Damietta City", "New Damietta"],
            "Sharkia": ["Zagazig", "10th of Ramadan"],
            "South Sinai": ["Sharm El Sheikh", "Dahab", "Nuweiba"],
            "Kafr El Sheikh": ["Kafr El Sheikh City"],
            "Matrouh": ["Marsa Matrouh", "Siwa"],
            "Luxor": ["Luxor City"],
            "Qena": ["Qena City"],
            "North Sinai": ["Arish", "Sheikh Zuweid"],
            "Sohag": ["Sohag City"]
        };

        document.getElementById("address-governorate").addEventListener("change", function() {
            let governorate = this.value;
            let citySelect = document.getElementById("address-city");
            citySelect.innerHTML = "<option disabled value=''>Select City</option>"; // Reset cities

            if (governorate && citiesByGovernorate[governorate]) {
                citiesByGovernorate[governorate].forEach(function(city) {
                    let option = document.createElement("option");
                    option.value = city;
                    option.textContent = city;
                    citySelect.appendChild(option);
                });
            }
        });
        window.ga = function() {
            ga.q.push(arguments)
        };
        ga.q = [];
        ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto');
        ga('send', 'pageview')
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async defer></script>

    <!--====== Noscript ======-->
    <noscript>
        <div class="app-setting">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="app-setting__wrap">
                            <h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

                            <span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </noscript>
</body>
</html>