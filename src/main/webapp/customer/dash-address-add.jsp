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

                                        <a href="dash-address-add.jsp">My Account</a></li>
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

                                                    <a href="dashboard">Manage My Account</a></li>
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
                                    <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                        <div class="dash__pad-2">
                                            <h1 class="dash__h1 u-s-m-b-14">Add new Address</h1>

                                            <span class="dash__text u-s-m-b-30">We need an address where we could deliver products.</span>
                                            <form class="dash-address-manipulation" action="AddressServlet" method="post">
                                                <input type="hidden" name="operation" value="addAddress">
                                                <input type="hidden" name="dash" value="dash">
                                                <div class="gl-inline">
                                                    <div class="u-s-m-b-30">

                                                        <label class="gl-label" for="address-address">ADDRESS DESCRIPTION *</label>

                                                        <input class="input-text input-text--primary-style" type="text" name="address" id="address-address" placeholder="ADDRESS DESCRIPTION" required>
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
                                                <button class="btn btn--e-brand-b-2" type="submit">SAVE</button>
                                            </form>
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
        <!--====== End - App Content ======-->


        <!--====== Main Footer ======-->
        <jsp:include page="footer.jsp"/>
    </div>
    <!--====== End - Main App ======-->


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