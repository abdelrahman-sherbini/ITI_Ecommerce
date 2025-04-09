<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--@elvariable id="LoggedUser" type="gov.iti.Entities.User"--%>
<%--@elvariable id="order" type="gov.iti.Entities.Order"--%>
<%--@elvariable id="ordProd" type="gov.iti.Entities.OrderedProduct"--%>
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

                                        <a href="dash-edit-profile.jsp">My Account</a></li>
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

                                                    <a class="dash-active" href="dashboard">Manage My Account</a></li>
                                                <li>

                                                    <a href="dash-my-profile.jsp">My Profile</a></li>
                                                <li>

                                                    <a href="dash-address-book.jsp">Address Book</a></li>
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
                                    <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                        <div class="dash__pad-2">
                                            <h1 class="dash__h1 u-s-m-b-14">Edit Profile</h1>

                                            <span class="dash__text u-s-m-b-30">Looks like you haven't updated your profile</span>
                                            <div class="dash__link dash__link--secondary u-s-m-b-30">

                                                <a data-modal="modal" data-modal-id="#dash-newsletter">Subscribe Newsletter</a></div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <form class="dash-edit-p" id="editProfileForm" action="UpdateUserServlet" method="POST">
                                                        <div class="gl-inline">
                                                            <div class="u-s-m-b-30">

                                                                <label class="gl-label" for="reg-fname">FIRST NAME *</label>
                                                                <div class="gl-error" id="reg-fname-error"></div>
                                                                <input class="input-text input-text--primary-style" type="text" name="fname" id="reg-fname" value="${LoggedUser.firstName}" required ></div>
                                                            <div class="u-s-m-b-30">

                                                                <label class="gl-label" for="reg-lname">LAST NAME *</label>
                                                                <div class="gl-error" id="reg-lname-error"></div>
                                                                <input class="input-text input-text--primary-style" type="text" name="lname" id="reg-lname" value="${LoggedUser.lastName}" required></div>
                                                        </div>
                                                        <div class="gl-inline">
                                                            <div class="u-s-m-b-30">

                                                                <label class="gl-label" for="reg-credit">CREDIT *</label>
                                                                <div class="gl-error" id="reg-credit-error"></div>
                                                                <input class="input-text input-text--primary-style" type="number" min="500" id="reg-credit" name="credit" placeholder="credit limit" value="${LoggedUser.credit}"></div>
                                                            <div class="u-s-m-b-30">

                                                                <label class="gl-label" for="reg-job">JOB</label>
                                                                <div class="gl-error" id="reg-job-error"></div>
                                                                <input class="input-text input-text--primary-style" type="text" name="job" id="reg-job" value="${LoggedUser.job}"></div>
                                                        </div>

                                                        <div class="gl-inline">
                                                            <div class="u-s-m-b-30">

                                                                <!--====== Date of Birth Select-Box ======-->

                                                                <span class="gl-label">BIRTHDAY</span>
                                                                <input class="input-text input-text--primary-style" type="text" readonly value="${LoggedUser.dob}" >
                                                            </div>
                                                            <div class="u-s-m-b-30">

                                                                <label class="gl-label" >GENDER</label>
                                                                <input class="input-text input-text--primary-style" type="text" readonly value="${LoggedUser.gender}" >
                                                            </div>
                                                        </div>
                                                        <div class="gl-inline">
                                                            <div class="u-s-m-b-30">
                                                                <label class="gl-label" for="reg-email">E-MAIL *</label>
                                                                <div class="gl-error" id="reg-email-error"></div>
<%--                                                                <span class="dash__text">johndoe@domain.com</span>--%>
                                                                <input class="input-text input-text--primary-style" type="email" name="email" id="reg-email" value="${LoggedUser.email}" required >

                                                            </div>
                                                            <div class="u-s-m-b-30">
                                                                <label class="gl-label" for="reg-phone">PHONE *</label>
                                                                <div class="gl-error" id="reg-phone-error"></div>
                                                                <input class="input-text input-text--primary-style" type="tel" name="phone" id="reg-phone"  value="${LoggedUser.phone}" required >



                                                            </div>
                                                        </div>

                                                        <button class="btn btn--e-brand-b-2" id="editProfileFormButton" type="submit">SAVE</button>
                                                    </form>
                                                </div>
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
        </div>

        <!--====== Main Footer ======-->
        <jsp:include page="footer.jsp"/>

        <!--====== Modal Section ======-->


        <!--====== Unsubscribe or Subscribe Newsletter ======-->
        <div class="modal fade" id="dash-newsletter">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content modal--shadow">
                    <div class="modal-body">
                        <form class="d-modal__form">
                            <div class="u-s-m-b-15">
                                <h1 class="gl-modal-h1">Newsletter Subscription</h1>

                                <span class="gl-modal-text">I have read and understood</span>

                                <a class="d_modal__link" href="dash-edit-profile.jsp">Ludus Privacy Policy</a>
                            </div>
                            <div class="gl-modal-btn-group">

                                <button class="btn btn--e-brand-b-2" type="submit">SUBSCRIBE</button>

                                <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--====== Unsubscribe or Subscribe Newsletter ======-->
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

    <script src="js/editProfile.js"></script>
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