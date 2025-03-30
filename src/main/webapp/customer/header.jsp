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

    OrderDao orderDao = new OrderDao(connection);

    List<Cart> cartList = cartDao.getCartListByUserId(activeUser.getUserId());
    if(cartList.isEmpty()){
        request.getRequestDispatcher("empty-cart.jsp").forward(request,response);
    }
    List<Order> orderList = orderDao.getAllOrder();

    OrderedProductDao ordProdDao = new OrderedProductDao(connection);

    UserDao userDao = new UserDao(connection);
%>
<!--====== Main Header ======-->
   <header class="header--style-1">

    <!--====== Nav 1 ======-->
    <nav class="primary-nav primary-nav-wrapper--border">
        <div class="container">

            <!--====== Primary Nav ======-->
            <div class="primary-nav">

                <!--====== Main Logo ======-->

                <a class="main-logo" href="index.jsp">

                    <img src="images/logo/logo-1.png" alt=""></a>
                <!--====== End - Main Logo ======-->


                <!--====== Search Form ======-->
                <form class="main-form">

                    <label for="main-search"></label>

                    <input class="input-text input-text--border-radius input-text--style-1" type="text" id="main-search" placeholder="Search">

                    <button class="btn btn--icon fas fa-search main-search-button" type="submit"></button></form>
                <!--====== End - Search Form ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation">

                    <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-cogs" type="button"></button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">✕ Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                            <li class="has-dropdown" data-tooltip="tooltip" data-placement="left" title="Account">

                                <a><i class="far fa-user-circle"></i></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <ul style="width:120px">
                                    <li>

                                        <a href="dashboard.jsp"><i class="fas fa-user-circle u-s-m-r-6"></i>

                                            <span>Account</span></a></li>
                                    <li>

                                        <a href="signup.jsp"><i class="fas fa-user-plus u-s-m-r-6"></i>

                                            <span>Signup</span></a></li>
                                    <li>

                                        <a href="signin.jsp"><i class="fas fa-lock u-s-m-r-6"></i>

                                            <span>Signin</span></a></li>
                                    <li>

                                        <a href="signup.jsp"><i class="fas fa-lock-open u-s-m-r-6"></i>

                                            <span>Signout</span></a></li>
                                </ul>
                                <!--====== End - Dropdown ======-->
                            </li>
                            <li class="has-dropdown" data-tooltip="tooltip" data-placement="left" title="Settings">

                                <a><i class="fas fa-user-cog"></i></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <ul style="width:120px">
                                    <li class="has-dropdown has-dropdown--ul-right-100">

                                        <a>Language<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:120px">
                                            <li>

                                                <a class="u-c-brand">ENGLISH</a></li>
                                            <li>

                                                <a>ARABIC</a></li>
                                            <li>

                                                <a>FRANCAIS</a></li>
                                            <li>

                                                <a>ESPANOL</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-right-100">

                                        <a>Currency<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:225px">
                                            <li>

                                                <a class="u-c-brand">$ - US DOLLAR</a></li>
                                            <li>

                                                <a>£ - BRITISH POUND STERLING</a></li>
                                            <li>

                                                <a>€ - EURO</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                </ul>
                                <!--====== End - Dropdown ======-->
                            </li>
                            <li data-tooltip="tooltip" data-placement="left" title="Contact">

                                <a href="tel:+0900901904"><i class="fas fa-phone-volume"></i></a></li>
                            <li data-tooltip="tooltip" data-placement="left" title="Mail">

                                <a href="mailto:contact@domain.com"><i class="far fa-envelope"></i></a></li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->
            </div>
            <!--====== End - Primary Nav ======-->
        </div>
    </nav>
    <!--====== End - Nav 1 ======-->


    <!--====== Nav 2 ======-->
    <nav class="secondary-nav-wrapper">
        <div class="container">

            <!--====== Secondary Nav ======-->
            <div class="secondary-nav">

                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation1">

                    <button class="btn btn--icon toggle-mega-text toggle-button" type="button">M</button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">✕ Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list">
                            <li class="has-dropdown">

                                <span class="mega-text">M</span>

                                <!--====== Mega Menu ======-->

                                <span class="js-menu-toggle"></span>
                                <div class="mega-menu">
                                    <div class="mega-menu-wrap">
                                        <div class="mega-menu-list">
                                            <ul>
                                                <li class="js-active">

                                                    <a href="shop-side-version-2.jsp"><i class="fas fa-tv u-s-m-r-6"></i>

                                                        <span>Electronics</span></a>

                                                    <span class="js-menu-toggle js-toggle-mark"></span></li>
                                                <li>

                                                    <a href="shop-side-version-2.jsp"><i class="fas fa-female u-s-m-r-6"></i>

                                                        <span>Women's Clothing</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                                <li>

                                                    <a href="shop-side-version-2.jsp"><i class="fas fa-male u-s-m-r-6"></i>

                                                        <span>Men's Clothing</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                                <li>

                                                    <a href="index.jsp"><i class="fas fa-utensils u-s-m-r-6"></i>

                                                        <span>Food & Supplies</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                                <li>

                                                    <a href="index.jsp"><i class="fas fa-couch u-s-m-r-6"></i>

                                                        <span>Furniture & Decor</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                                <li>

                                                    <a href="index.jsp"><i class="fas fa-football-ball u-s-m-r-6"></i>

                                                        <span>Sports & Game</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                                <li>

                                                    <a href="index.jsp"><i class="fas fa-heartbeat u-s-m-r-6"></i>

                                                        <span>Beauty & Health</span></a>

                                                    <span class="js-menu-toggle"></span></li>
                                            </ul>
                                        </div>

                                        <!--====== Electronics ======-->
                                        <div class="mega-menu-content js-active">

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">3D PRINTER & SUPPLIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">3d Printer</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">3d Printing Pen</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">3d Printing Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">3d Printer Module Board</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">HOME AUDIO & VIDEO</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">TV Boxes</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">TC Receiver & Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Display Dongle</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Home Theater System</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">MEDIA PLAYERS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Earphones</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Mp3 Players</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Speakers & Radios</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Microphones</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">VIDEO GAME ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Nintendo Video Games Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Sony Video Games Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Xbox Video Games Accessories</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">SECURITY & PROTECTION</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Security Cameras</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Alarm System</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Security Gadgets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">CCTV Security & Accessories</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">PHOTOGRAPHY & CAMERA</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Digital Cameras</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Sport Camera & Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Camera Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Lenses & Accessories</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">ARDUINO COMPATIBLE</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Raspberry Pi & Orange Pi</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Module Board</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Smart Robot</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Board Kits</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">DSLR Camera</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Nikon Cameras</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Canon Camera</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Sony Camera</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">DSLR Lenses</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">NECESSARY ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Flash Cards</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Memory Cards</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Flash Pins</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Compact Discs</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-9 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-0.jpg" alt=""></a></div>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                        </div>
                                        <!--====== End - Electronics ======-->


                                        <!--====== Women ======-->
                                        <div class="mega-menu-content">

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-1.jpg" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-2.jpg" alt=""></a></div>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">HOT CATEGORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Dresses</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Blouses & Shirts</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">T-shirts</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Rompers</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">INTIMATES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Bras</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Brief Sets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Bustiers & Corsets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Panties</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">WEDDING & EVENTS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Wedding Dresses</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Evening Dresses</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Prom Dresses</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Flower Dresses</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">BOTTOMS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Skirts</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Shorts</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Leggings</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Jeans</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">OUTWEAR</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Blazers</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Basics Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Trench</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Leather & Suede</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">JACKETS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Denim Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Trucker Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Windbreaker Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Leather Jackets</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Tech Accessories</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Headwear</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Baseball Caps</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Belts</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">OTHER ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Bags</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Wallets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Watches</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Sunglasses</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-9 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-3.jpg" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-3 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-4.jpg" alt=""></a></div>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                        </div>
                                        <!--====== End - Women ======-->


                                        <!--====== Men ======-->
                                        <div class="mega-menu-content">

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-5.jpg" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-6.jpg" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-7.jpg" alt=""></a></div>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">HOT SALE</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">T-Shirts</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Tank Tops</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Polo</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Shirts</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">OUTWEAR</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Hoodies</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Trench</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Parkas</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Sweaters</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">BOTTOMS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Casual Pants</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Cargo Pants</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Jeans</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Shorts</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">UNDERWEAR</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Boxers</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Briefs</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Robes</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Socks</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">JACKETS</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Denim Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Trucker Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Windbreaker Jackets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Leather Jackets</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">SUNGLASSES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Pilot</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Wayfarer</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Square</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Round</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Eyewear Frames</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Scarves</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Hats</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Belts</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul>
                                                        <li class="mega-list-title">

                                                            <a href="shop-side-version-2.jsp">OTHER ACCESSORIES</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Bags</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Wallets</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Watches</a></li>
                                                        <li>

                                                            <a href="shop-side-version-2.jsp">Tech Accessories</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                            <br>

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-8.jpg" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.jsp">

                                                            <img class="u-img-fluid u-d-block" src="images/banners/banner-mega-9.jpg" alt=""></a></div>
                                                </div>
                                            </div>
                                            <!--====== End - Mega Menu Row ======-->
                                        </div>
                                        <!--====== End - Men ======-->


                                        <!--====== No Sub Categories ======-->
                                        <div class="mega-menu-content">
                                            <h5>No Categories</h5>
                                        </div>
                                        <!--====== End - No Sub Categories ======-->


                                        <!--====== No Sub Categories ======-->
                                        <div class="mega-menu-content">
                                            <h5>No Categories</h5>
                                        </div>
                                        <!--====== End - No Sub Categories ======-->


                                        <!--====== No Sub Categories ======-->
                                        <div class="mega-menu-content">
                                            <h5>No Categories</h5>
                                        </div>
                                        <!--====== End - No Sub Categories ======-->


                                        <!--====== No Sub Categories ======-->
                                        <div class="mega-menu-content">
                                            <h5>No Categories</h5>
                                        </div>
                                        <!--====== End - No Sub Categories ======-->
                                    </div>
                                </div>
                                <!--====== End - Mega Menu ======-->
                            </li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation2">

                    <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-cog" type="button"></button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">✕ Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design2 ah-list--link-color-secondary">
                            <li>

                                <a href="shop-side-version-2.jsp">NEW ARRIVALS</a></li>
                            <li class="has-dropdown">

                                <a>PAGES<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <ul style="width:170px">
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Home<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:118px">
                                            <li>

                                                <a href="index.jsp">Home 1</a></li>
                                            <li>

                                                <a href="index-2.jsp">Home 2</a></li>
                                            <li>

                                                <a href="index-3.jsp">Home 3</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Account<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>

                                                <a href="signin.jsp">Signin / Already Registered</a></li>
                                            <li>

                                                <a href="signup.jsp">Signup / Register</a></li>
                                            <li>

                                                <a href="lost-password.jsp">Lost Password</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a href="dashboard.jsp">Dashboard<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a href="dashboard.jsp">Manage My Account<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="js-menu-toggle"></span>
                                                <ul style="width:180px">
                                                    <li>

                                                        <a href="dash-edit-profile.jsp">Edit Profile</a></li>
                                                    <li>

                                                        <a href="dash-address-book.jsp">Edit Address Book</a></li>
                                                    <li>

                                                        <a href="dash-manage-order.jsp">Manage Order</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li>

                                                <a href="dash-my-profile.jsp">My Profile</a></li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a href="dash-address-book.jsp">Address Book<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="js-menu-toggle"></span>
                                                <ul style="width:180px">
                                                    <li>

                                                        <a href="dash-address-make-default.jsp">Address Make Default</a></li>
                                                    <li>

                                                        <a href="dash-address-add.jsp">Add New Address</a></li>
                                                    <li>

                                                        <a href="dash-address-edit.jsp">Edit Address Book</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li>

                                                <a href="dash-track-order.jsp">Track Order</a></li>
                                            <li>

                                                <a href="dash-my-order.jsp">My Orders</a></li>
                                            <li>

                                                <a href="dash-payment-option.jsp">My Payment Options</a></li>
                                            <li>

                                                <a href="dash-cancellation.jsp">My Returns & Cancellations</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Empty<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>

                                                <a href="empty-search.jsp">Empty Search</a></li>
                                            <li>

                                                <a href="empty-cart.jsp">Empty Cart</a></li>
                                            <li>

                                                <a href="empty-wishlist.jsp">Empty Wishlist</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Product Details<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>

                                                <a href="product-detail.jsp">Product Details</a></li>
                                            <li>

                                                <a href="product-detail-variable.jsp">Product Details Variable</a></li>
                                            <li>

                                                <a href="product-detail-affiliate.jsp">Product Details Affiliate</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Shop Grid Layout<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>

                                                <a href="shop-grid-left.jsp">Shop Grid Left Sidebar</a></li>
                                            <li>

                                                <a href="shop-grid-right.jsp">Shop Grid Right Sidebar</a></li>
                                            <li>

                                                <a href="shop-grid-full.jsp">Shop Grid Full Width</a></li>
                                            <li>

                                                <a href="shop-side-version-2.jsp">Shop Side Version 2</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                        <a>Shop List Layout<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>

                                                <a href="shop-list-left.jsp">Shop List Left Sidebar</a></li>
                                            <li>

                                                <a href="shop-list-right.jsp">Shop List Right Sidebar</a></li>
                                            <li>

                                                <a href="shop-list-full.jsp">Shop List Full Width</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li>

                                        <a href="cart.jsp">Cart</a></li>
                                    <li>

                                        <a href="wishlist.jsp">Wishlist</a></li>
                                    <li>

                                        <a href="checkout.jsp">Checkout</a></li>
                                    <li>

                                        <a href="faq.jsp">FAQ</a></li>
                                    <li>

                                        <a href="about.jsp">About us</a></li>
                                    <li>

                                        <a href="contact.jsp">Contact</a></li>
                                    <li>

                                        <a href="404.jsp">404</a></li>
                                </ul>
                                <!--====== End - Dropdown ======-->
                            </li>
                            <li class="has-dropdown">

                                <a>BLOG<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <ul style="width:200px">
                                    <li>

                                        <a href="blog-left-sidebar.jsp">Blog Left Sidebar</a></li>
                                    <li>

                                        <a href="blog-right-sidebar.jsp">Blog Right Sidebar</a></li>
                                    <li>

                                        <a href="blog-sidebar-none.jsp">Blog Sidebar None</a></li>
                                    <li>

                                        <a href="blog-masonry.jsp">Blog Masonry</a></li>
                                    <li>

                                        <a href="blog-detail.jsp">Blog Details</a></li>
                                </ul>
                                <!--====== End - Dropdown ======-->
                            </li>
                            <li>

                                <a href="shop-side-version-2.jsp">VALUE OF THE DAY</a></li>
                            <li>

                                <a href="shop-side-version-2.jsp">GIFT CARDS</a></li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation3">

                    <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-shopping-bag toggle-button-shop" type="button"></button>

                    <span class="total-item-round">2</span>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">✕ Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                            <li>

                                <a href="index.jsp"><i class="fas fa-home u-c-brand"></i></a></li>
                            <li>

                                <a href="wishlist.jsp"><i class="far fa-heart"></i></a></li>
                            <li class="has-dropdown">

                                <a class="mini-cart-shop-link"><i class="fas fa-shopping-bag"></i>

                                    <span class="total-item-round">2</span></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <div class="mini-cart">

                                    <!--====== Mini Product Container ======-->
                                    <div class="mini-product-container gl-scroll u-s-m-b-15">

                                        <!--====== Card for mini cart ======-->
                                        <div class="card-mini-product">
                                            <div class="mini-product">
                                                <div class="mini-product__image-wrapper">

                                                    <a class="mini-product__link" href="product-detail.jsp">

                                                        <img class="u-img-fluid" src="images/product/electronic/product3.jpg" alt=""></a></div>
                                                <div class="mini-product__info-wrapper">

                                                    <span class="mini-product__category">

                                                        <a href="shop-side-version-2.jsp">Electronics</a></span>

                                                    <span class="mini-product__name">

                                                        <a href="product-detail.jsp">Yellow Wireless Headphone</a></span>

                                                    <span class="mini-product__quantity">1 x</span>

                                                    <span class="mini-product__price">$8</span></div>
                                            </div>

                                            <a class="mini-product__delete-link far fa-trash-alt"></a>
                                        </div>
                                        <!--====== End - Card for mini cart ======-->

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
                                </div>
                                <!--====== End - Dropdown ======-->
                            </li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->
            </div>
            <!--====== End - Secondary Nav ======-->
        </div>
    </nav>
    <!--====== End - Nav 2 ======-->
</header>
<!--====== End - Main Header ======-->
