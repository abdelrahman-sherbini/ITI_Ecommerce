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
                                    <h1 class="section__heading u-c-secondary">CREATE AN ACCOUNT</h1>
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
                                        <h1 class="gl-h1">PERSONAL INFORMATION</h1>
                                        <form class="l-f-o__form" method="post"  id="reg-form" action="signup">
                                            
                                            <div class="u-s-m-b-30">
                                                

                                                <label class="gl-label" for="reg-fname">FIRST NAME *</label>
                                                <div class="gl-error" id="reg-fname-error"></div>

                                                <input class="input-text input-text--primary-style" type="text" id="reg-fname" name="firstName" placeholder="First Name" required></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="reg-lname">LAST NAME *</label>
                                                <div class="gl-error" id="reg-lname-error"></div>

                                                <input class="input-text input-text--primary-style" type="text" id="reg-lname" name="lastName" placeholder="Last Name" required></div>
                                            <div class="gl-inline">
                                                <div class="u-s-m-b-30">

                                                    <!--====== Date of Birth Select-Box ======-->

                                                    <span class="gl-label">BIRTHDAY</span>
                                                    <div class="gl-error" id="reg-dob-error"></div>
                                                    <div class="gl-dob">
                                                        <!--<select class="select-box select-box--primary-style">
                                                            <option selected>Month</option>
                                                            <option value="male">January</option>
                                                            <option value="male">February</option>
                                                            <option value="male">March</option>
                                                            <option value="male">April</option>
                                                        </select><select class="select-box select-box--primary-style">
                                                            <option selected>Day</option>
                                                            <option value="01">01</option>
                                                            <option value="02">02</option>
                                                            <option value="03">03</option>
                                                            <option value="04">04</option>
                                                        </select><select class="select-box select-box--primary-style">
                                                            <option selected>Year</option>
                                                            <option value="1991">1991</option>
                                                            <option value="1992">1992</option>
                                                            <option value="1993">1993</option>
                                                            <option value="1994">1994</option>
                                                        </select> -->
                                                        <input  class="select-box select-box--primary-style" type="date" id="reg-dob" name="dob">
                                                    </div>
                                                    <!--====== End - Date of Birth Select-Box ======-->
                                                </div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg-gender">GENDER</label>
                                                    <div class="gl-error" id="reg-gender-error"></div>
                                                    <select class="select-box select-box--primary-style u-w-100" id="reg-gender" name="gender">
                                                        <option value="" selected>Select</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                      </select></div>
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="reg-phone">PHONE *</label>
                                                <div class="gl-error" id="reg-phone-error"></div>
                                                <input class="input-text input-text--primary-style" type="tel" id="reg-phone" name="phone" placeholder="phone number" required>
                                            </div>
                                            
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg-credit">CREDIT *</label>
                                                    <div class="gl-error" id="reg-credit-error"></div>
                                                    <input class="input-text input-text--primary-style" type="number" min="500" id="reg-credit" name="credit" placeholder="credit limit" required></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="reg-job">JOB</label>
                                                <div class="gl-error" id="reg-job-error"></div>
                                                <input class="input-text input-text--primary-style" type="text" id="reg-job" name="job" placeholder="job" ></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="reg-email">E-MAIL *</label>
                                                <div class="gl-error" id="reg-email-error"></div>
                                                <input class="input-text input-text--primary-style" type="email" id="reg-email" name="email" placeholder="Enter E-mail" required></div>

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

                                                  

                                                  <div class="u-s-m-b-30" style="position: relative;">
                                                    <h3 class="dash__h1 u-s-m-b-14">ADDRESS</h3>
                                                    <div class="u-s-m-b-30">

                                                        <label class="gl-label" for="address-street">STREET ADDRESS *</label>
                                                        <div class="gl-error" id="address-street-error"></div>
                                                        <input class="input-text input-text--primary-style" type="text" id="address-street" name="addressDescription" placeholder="House Name and Street" required></div>
                                                        <div class="u-s-m-b-30">

                                                            
                                                            <div class="gl-inline">
                                                                
                                                                
                                                                <div class="u-s-m-b-30">
                                                                    <label class="gl-label" for="address-state">GOVERNORATE *</label>
                                                                    <div class="gl-error" id="address-state-error"></div>
                                                                    <select class="select-box select-box--primary-style" id="address-state" name="governorate">
                                                                      <option selected value="">Choose Governorate</option>
                                                                    </select>
                                                                  </div>
                                                                  
                                                                  <div class="u-s-m-b-30">
                                                                    <label class="gl-label" for="address-city">TOWN/CITY *</label>
                                                                    <div class="gl-error" id="address-city-error"></div>
                                                                    <select class="select-box select-box--primary-style" id="address-city" name="city">
                                                                      <option selected value="">Choose City</option>
                                                                    </select>
                                                                  </div>
                                                                
                                                                
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                  
                                                        <div class="gl-inline">
                                                            
                                                            <div class="u-s-m-b-30">
        
                                                                <label class="gl-label" for="address-postal">ZIP/POSTAL CODE </label>
        
                                                                <input class="input-text input-text--primary-style" type="text" id="address-postal" name="address-postal" placeholder="Zip/Postal Code"></div>
                                                        </div>
                                                        <label class="gl-label" style="display: block; margin-bottom: 5px;">TYPE *</label>
                                                        <div class="gl-error" id="address-type-error"></div>
                                                        <div class="gl-inline">
                                                            
                                                            <div class="u-s-m-b-30">
                                                                <label class="gl-label">
                                                                <input type="radio" name="type" value="home">
                                                                Home
                                                                </label>
                                                            </div>
                                                            
                                                            <div class="u-s-m-b-30">
                                                                <label class="gl-label">
                                                                <input type="radio" name="type" value="office">
                                                                Office
                                                                </label>
                                                            </div>
                                                        </div>
                                                          
                                                  </div>

                                                  
                                            <div class="u-s-m-b-15">

                                                <button class="btn btn--e-transparent-brand-b-2" type="submit" id="reg-bttn">CREATE</button></div>

                                            <a class="gl-link" href="#">Return to Store</a>
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
    <script src="js/signup.js"></script>

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