<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="gov.iti.Dtos.*" %>
<%@ page import="gov.iti.Model.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %>
<%
//    User activeUser = new User("Alice Johnson","alice@example.com","","1234567890","Female");
//    activeUser.setUserId(1);
//    session.setAttribute("activeUser",activeUser);
//    User activeUser = (User) session.getAttribute("activeUser");

    User activeUser = (User) session.getAttribute("LoggedUser");
    Connection connection = ConnectionProvider.getConnection();

    CategoryDao catDao = new CategoryDao(connection);
    List<Category> categoryList = catDao.getAllCategories();

    ProductDao productDao = new ProductDao(connection);

    WishlistDao wishlistDao = new WishlistDao(connection);

    OrderDao orderDao = new OrderDao(connection);
    List<Wishlist> wishList  =  wishlistDao.getListByUserId(activeUser.getUserId());
    if(wishList.isEmpty()){
        request.getRequestDispatcher("empty-wishlist.jsp").forward(request,response);
    }

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

                                        <a href="wishlist.jsp">Wishlist</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section 1 ======-->


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary">Wishlist</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Intro ======-->


                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <%

                                    for (Wishlist wishlist : wishList) {

                                        Product prod  = productDao.getProductsByProductId(wishlist.getProductId());
                                        Category category = catDao.getCategoryById(prod.getCategoryId());



                                %>
                                <!--====== Wishlist Product ======-->
                                <div class="w-r u-s-m-b-30">
                                    <div class="w-r__container">
                                        <div class="w-r__wrap-1">
                                            <div class="w-r__img-wrap">

                                                <img class="u-img-fluid" src="images/product/<%=category.getCategoryName()%>/<%=prod.getProductImages()%>" alt=""></div>
                                            <div class="w-r__info">

                                                <span class="w-r__name">

                                                    <a href="product-detail.jsp?id=<%=prod.getProductId()%>"><%=prod.getProductName()%></a></span>

                                                <span class="w-r__category">

                                                    <a href="shop-side-version-2.jsp<%=category.getCategoryId()%>"><%=category.getCategoryName()%></a></span>
                                                <% if(prod.getProductPriceAfterDiscount().equals(prod.getProductPrice())){ %>
                                                <span class="w-r__price">$<%=prod.getProductPrice()%></span>
                                            <% }else{%>

                                                <span class="w-r__price">$<%=prod.getProductPriceAfterDiscount()%>

                                                    <span class="w-r__discount">$<%=prod.getProductPrice()%></span></span>
                                                <% }%>
                                            </div>
                                        </div>
                                        <div class="w-r__wrap-2">

                                            <a
                                                id="add-to-cart-btn-wishlist"
                                                class="w-r__link btn--e-brand-b-2"
                                               data-toggle="modal"
                                               data-name="<%=prod.getProductName()%>"
                                               data-image="images/product/electronic/<%=prod.getProductImages()%>"
                                               data-price="<%=prod.getProductPriceAfterDiscount()%>"
                                               data-id="<%=prod.getProductId()%>"
                                               >ADD TO CART</a>

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="product-detail.jsp?id=<%=prod.getProductId()%>">VIEW</a>

<%--                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="#">REMOVE</a></div>--%>
                                        <button type="button" class="w-r__link deleteWish btn--e-transparent-platinum-b-2">Remove</button>
                                        <input type="hidden" name="wishItem" value="<%=wishlist.getWishlistId()%>">
                                    </div>
                                </div>


                                </div>
                                <!--====== End - Wishlist Product ======-->
                                <%
                                    }

                                %>
                            </div>
                            <div class="col-lg-12">
                                <div class="route-box">
                                    <div class="route-box__g">

                                        <a class="route-box__link" href="shop-side-version-2.jsp"><i class="fas fa-long-arrow-alt-left"></i>

                                            <span>CONTINUE SHOPPING</span></a></div>
                                    <div class="route-box__g">

                                        <a id="deleteWishList" class="route-box__link" ><i class="fas fa-trash"></i>

                                            <span>CLEAR WISHLIST</span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            <!--====== End - Section 2 ======-->
        </div>
        <!--====== End - App Content ======-->


        <!--====== Main Footer ======-->
        <jsp:include page="footer.jsp"/>

        <!--====== Modal Section ======-->


        <!--====== Add to Cart Modal ======-->
        <div class="modal fade" id="add-to-cart">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content modal-radius modal-shadow">

                    <button class="btn dismiss-button fas fa-times" type="button" data-dismiss="modal"></button>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="success u-s-m-b-30">
                                    <div class="success__text-wrap"><i class="fas fa-check"></i>

                                        <span>Item is added successfully!</span></div>
                                    <div class="success__img-wrap">

                                        <img class="u-img-fluid" src="images/product/electronic/product1.jpg" alt=""></div>
                                    <div class="success__info-wrap">

                                        <span class="success__name">Beats Bomb Wireless Headphone</span>

                                        <span class="success__quantity">Quantity: 1</span>

                                        <span class="success__price">$170.00</span></div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="s-option">

                                    <span class="s-option__text">1 item (s) in your cart</span>
                                    <div class="s-option__link-box">

                                        <a class="s-option__link btn--e-white-brand-shadow" data-dismiss="modal">CONTINUE SHOPPING</a>

                                        <a class="s-option__link btn--e-white-brand-shadow" href="cart.jsp">VIEW CART</a>

                                        <a class="s-option__link btn--e-brand-shadow" href="checkout.jsp">PROCEED TO CHECKOUT</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Add to Cart Modal ======-->
        <!--====== End - Modal Section ======-->
    </div>
    <!--====== End - Main App ======-->


    <!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
    <script>
        window.ga = function() {
            ga.q.push(arguments)
        };
        ga.q = [];
        ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto');
        ga('send', 'pageview')
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async defer></script>

    <!--====== Vendor Js ======-->
    <script src="js/vendor.js"></script>

    <!--====== jQuery Shopnav plugin ======-->
    <script src="js/jquery.shopnav.js"></script>

    <!--====== App ======-->
    <script src="js/app.js"></script>

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