<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>

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

                                        <a href="wishlist">Wishlist</a></li>
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
                                <%--@elvariable id="wishlist" type="gov.iti.Entities.Wishlist"--%>
                                <c:forEach var="wishlist" items="${wishlists}">
                                <!--====== Wishlist Product ======-->
                                <div class="w-r u-s-m-b-30">
                                    <div class="w-r__container">
                                        <div class="w-r__wrap-1">
                                            <div class="w-r__img-wrap">

                                                <img class="u-img-fluid" src="images/product/${wishlist.product.category.name}/${wishlist.product.image}" alt=""></div>
                                            <div class="w-r__info">

                                                <span class="w-r__name">

                                                    <a href="product-detail?id=${wishlist.product.id}">${wishlist.product.name}</a></span>

                                                <span class="w-r__category">

                                                    <a href="shop-side-version-2.jsp?id=${wishlist.product.category.id}">${wishlist.product.category.name}</a></span>

                                                <c:choose>
                                                    <c:when test="${wishlist.product.productPriceAfterDiscount == wishlist.product.price}">
                                                        <span class="w-r__price">$${wishlist.product.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="w-r__price">
                                                            $${wishlist.product.productPriceAfterDiscount}
                                                            <span class="w-r__discount">
                                                                $${wishlist.product.price}
                                                            </span>
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>

<%--                                                <% if(prod.getProductPriceAfterDiscount().equals(prod.getProductPrice())){ %>--%>
<%--                                                <span class="w-r__price">$<%=prod.getProductPrice()%></span>--%>
<%--                                            <% }else{%>--%>

<%--                                                <span class="w-r__price">$<%=prod.getProductPriceAfterDiscount()%>--%>

<%--                                                    <span class="w-r__discount">$<%=prod.getProductPrice()%></span></span>--%>
<%--                                                <% }%>--%>
                                            </div>
                                        </div>
                                        <div class="w-r__wrap-2">

                                            <a

                                                class="w-r__link btn--e-brand-b-2 add-to-cart-btn-wishlist"
                                               data-toggle="modal"
                                               data-name="${wishlist.product.name}"
                                               data-image="images/product/${wishlist.product.category.name}/${wishlist.product.image}"
                                               data-price="${wishlist.product.productPriceAfterDiscount}"
                                               data-id="${wishlist.product.id}"
                                               >ADD TO CART</a>

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="product-detail?id=${wishlist.product.id}">VIEW</a>

<%--                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="#">REMOVE</a></div>--%>
                                        <button type="button" class="w-r__link deleteWish btn--e-transparent-platinum-b-2">Remove</button>
                                        <input type="hidden" name="wishItem" value="${wishlist.id}">
                                    </div>
                                </div>


                                </div>
                                <!--====== End - Wishlist Product ======-->
                                </c:forEach>
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

                                        <a class="s-option__link btn--e-white-brand-shadow" href="cart">VIEW CART</a>

                                        <a class="s-option__link btn--e-brand-shadow" href="checkout">PROCEED TO CHECKOUT</a></div>
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