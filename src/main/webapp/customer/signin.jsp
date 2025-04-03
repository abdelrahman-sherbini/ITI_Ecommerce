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

           


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary">ALREADY REGISTERED?</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Intro ======-->


                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row row--center">
                            <div class="col-lg-6 col-md-8 u-s-m-b-30">
                                <div class="l-f-o">
                                    <div class="l-f-o__pad-box">
                                        <h1 class="gl-h1">I'M NEW CUSTOMER</h1>

                                        <span class="gl-text u-s-m-b-30">By creating an account with our store, you will be able to move through the checkout process faster, store shipping addresses, view and track your orders in your account and more.</span>
                                        <div class="u-s-m-b-15">

                                            <a class="l-f-o__create-link btn--e-transparent-brand-b-2" href="signup.jsp">CREATE AN ACCOUNT</a></div>
                                        <h1 class="gl-h1">SIGNIN</h1>

                                        <span class="gl-text u-s-m-b-30">If you have an account with us, please log in.</span>
                                        <c:if test="${not empty errorMessage}">
                                            
                                            <div class="gl-error" style="font-size: 15px;" id="cred-error">
                                                ${errorMessage}
                                            </div>
                                        </c:if>
                                        
                                        <form class="l-f-o__form" id="login-form" method="post" action="login">
                                            
                                            
                                            
                                            
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="login-email">E-MAIL *</label>

                                                <input class="input-text input-text--primary-style" type="email" id="login-email" name="email" placeholder="Enter E-mail" value=
                                                "${userSignIn.email}" required></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="login-password">PASSWORD *</label>
                                                <div class="u-s-m-b-30" style="position: relative;">
                                                    <input class="input-text input-text--primary-style" type="password" id="login-password" name="password" placeholder="Enter Password" value="${userSignIn.password}" required>
                                                    <img
                                                                src="images/eyeicon.png"
                                                                alt="Show/Hide"
                                                                class="toggle-password"
                                                                toggle="#login-password"
                                                                style="position: absolute; top: 50%; right: 12px; transform: translateY(-50%); width: 20px; height: 20px; cursor: pointer;"
                                                            />
                                                </div>
                                                
                                            </div>
                                            <div class="gl-inline">
                                                <div class="u-s-m-b-30">

                                                    <button class="btn btn--e-transparent-brand-b-2" type="submit">LOGIN</button></div>
                                                <div class="u-s-m-b-30">

                                                    <a class="gl-link" href="lost-password.jsp">Lost Your Password?</a></div>
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <!--====== Check Box ======-->
                                                <div class="check-box">

                                                    <input type="checkbox" id="remember-me" name="rememberMe"  ${userSignIn.rememberMe == true ? 'checked' : ''}>
                                                    <div class="check-box__state check-box__state--primary">

                                                        <label class="check-box__label" for="remember-me">Remember Me</label></div>
                                                </div>
                                                <!--====== End - Check Box ======-->
                                            </div>
                                        </form>
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
    <script src="js/signin.js"></script>

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