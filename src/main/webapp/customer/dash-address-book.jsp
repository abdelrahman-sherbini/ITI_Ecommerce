<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--@elvariable id="LoggedUser" type="gov.iti.Entities.User"--%>
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

                                        <a href="dash-address-book.jsp">My Account</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section 1 ======-->


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">
                <%@include file="Components/alert_message.jsp"%>
                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="dash">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-12">

                                    <!--====== Dashboard Features ======-->
                                    <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
                                        <div class="dash__pad-1">

                                            <span class="dash__text u-s-m-b-16">Hello, ${LoggedUser.firstName} ${LoggedUser.lastName}</span>
                                            <ul class="dash__f-list">
                                                <li>

                                                    <a href="dashboard.jsp">Manage My Account</a></li>
                                                <li>

                                                    <a href="dash-my-profile.jsp">My Profile</a></li>
                                                <li>

                                                    <a class="dash-active" href="dash-address-book.jsp">Address Book</a></li>
                                                <li>

                                                    <a href="dash-track-order.jsp">Track Order</a></li>
                                                <li>

                                                    <a href="dash-my-order.jsp">My Orders</a></li>
                                                <li>

                                                    <a href="dash-payment-option.jsp">My Payment Options</a></li>
                                                <li>

                                                    <a href="dash-cancellation.jsp">My Returns & Cancellations</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
                                        <jsp:include page="orderPlacedProfile.jsp"/>
                                    </div>
                                    <!--====== End - Dashboard Features ======-->
                                </div>
                                <div class="col-lg-9 col-md-12">
                                    <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                        <div class="dash__pad-2">
                                            <div class="dash__address-header">
                                                <h1 class="dash__h1">Address Book</h1>
                                                <div>

                                                    <span class="dash__link dash__link--black u-s-m-r-8">

                                                        <a href="dash-address-make-default.jsp">Make default shipping address</a></span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius u-s-m-b-30">
                                        <div class="dash__table-2-wrap gl-scroll">
                                            <table class="dash__table-2">
                                                <thead>
                                                <tr>
                                                    <th>Action</th>
                                                    <th>Address</th>
                                                    <th>City</th>
                                                    <th>Governorate</th>
                                                    <th>Type</th>
                                                    <th>Status</th>
                                                    <th>Delete</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <c:forEach var="address" items="${LoggedUser.userAddresses}">
                                                <tr>
                                                    <td>

                                                        <a class="address-book-edit btn--e-transparent-platinum-b-2" href="dash-address-edit?id=${address.id}">Edit</a>
                                                    </td>
                                                    <td>${address.address}</td>
                                                    <td> ${address.city}</td>
                                                    <td>${address.governorate}</td>
                                                    <td> ${address.type}</td>
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
                                                    <td>
                                                        <button type="button" class="far fa-trash-alt table-p__delete-link deleteAddress btn--e-transparent-platinum-b-2"></button>
                                                        <input type="hidden" name="addressID" value="${address.id}">
                                                    </td>
                                                </tr>

                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div>

                                        <a class="dash__custom-link btn--e-brand-b-2" href="dash-address-add.jsp"><i class="fas fa-plus u-s-m-r-8"></i>

                                            <span>Add New Address</span></a></div>
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