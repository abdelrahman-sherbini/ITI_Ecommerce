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

                                        <a href="lost-password.jsp">Reset</a></li>
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
                                    <h1 class="section__heading u-c-secondary">FORGOT PASSWORD?</h1>
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
                                        <h1 class="gl-h1">PASSWORD RESET</h1>

                                        
                                        
                                            <%
                                            String token = request.getParameter("token");
                                        %>
                                        
                                        <form class="l-f-o__form" id="reset-password-form" method="post" action="resetPassword">
                                            <div class="u-s-m-b-30" style="position: relative;">
                                                <label class="gl-label" for="reg-password">PASSWORD *</label>
                                                <div class="gl-error" id="reg-password-error"></div>
                                                <div class="u-s-m-b-30" style="position: relative;">
                                                    <input
                                                        class="input-text input-text--primary-style"
                                                        type="password"
                                                        id="reg-password"
                                                        name="password"
                                                        placeholder="Enter Password"
                                                        required
                                                        style="padding-right: 40px; width: 100%;"
                                                    />
                                                    <img
                                                        src="images/eyeicon.png"
                                                        alt="Show/Hide"
                                                        class="toggle-password"
                                                        toggle="#reg-password"
                                                        style="position: absolute; top: 50%; right: 12px; transform: translateY(-50%); width: 20px; height: 20px; cursor: pointer;"
                                                    />
                                                </div>
                                                
                                                
                                              </div>
                                              <div class="u-s-m-b-30" style="position: relative;">
                                                    <label class="gl-label" for="reg-conf-password">CONFIRM PASSWORD *</label>
                                                    <div class="gl-error" id="reg-conf-password-error"></div>
                                                    
                                                    <div class="u-s-m-b-30" style="position: relative;">
                                                        <input
                                                            class="input-text input-text--primary-style"
                                                            type="password"
                                                            id="reg-conf-password"
                                                            name="reg-conf-password"
                                                            placeholder="Enter Password"
                                                            required
                                                            style="padding-right: 40px; width: 100%;"
                                                        />
                                                        <img
                                                            src="images/eyeicon.png"
                                                            alt="Show/Hide"
                                                            class="toggle-password"
                                                            toggle="#reg-conf-password"
                                                            style="position: absolute; top: 50%; right: 12px; transform: translateY(-50%); width: 20px; height: 20px; cursor: pointer;"
                                                        />
                                                    </div>
                                                    
                                                  </div>

                                                <button class="btn btn--e-transparent-brand-b-2" type="submit" id="reset-bttn">SUBMIT</button></div>
                                            <div class="u-s-m-b-30">

                                                
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
    <script src="js/reset-password.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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