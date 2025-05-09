<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

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

                                        <a href="dashboard"><i class="fas fa-user-circle u-s-m-r-6"></i>

                                            <span>Account</span></a></li>
                                            <% 
                                            Object loggedUser = session.getAttribute("LoggedUser");
                                            boolean hide = (loggedUser != null);
                                        %>
                                    <li style='<%= hide ? "display: none;" : "" %>'>

                                        <a href="signup.jsp"><i class="fas fa-user-plus u-s-m-r-6"></i>

                                            <span>Signup</span></a></li>
                                    <li style='<%= hide ? "display: none;" : "" %>'>

                                        <a href="signin.jsp"><i class="fas fa-lock u-s-m-r-6"></i>

                                            <span>Signin</span></a></li>
                                    <li style='<%= hide ? "" : "display: none;"%>'>

                                        <a href="logout"><i class="fas fa-lock-open u-s-m-r-6"></i>

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

                    <button class="btn btn--icon toggle-mega-text toggle-button" type="button">Menu</button>

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
                                                <!-- Add All Products -->
                                                <li>
                                                    <a href="shop">
                                                        <i class="fas fa-boxes u-s-m-r-6"></i>
                                                        All Products
                                                    </a>
                                                </li>
                                                <c:forEach var="category" items="${applicationScope.headercategories}">
                                                    <li>
                                                        <a href="shop?category=${category.categoryId}">
                                                            <i class="${category.categoryImage} u-s-m-r-6"></i>
                                                            <c:out value="${category.categoryName}"/>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
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
                                <a href="shop">
                                    <i class="fas fa-boxes u-s-m-r-6"></i>
                                    All Products
                                </a>
                            </li>
                            <c:forEach var="category" items="${applicationScope.headercategories}">
                                <li>
                                    <a href="shop?category=${category.categoryId}">
                                        <c:out value="${category.categoryName}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation3">

                    <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-shopping-bag toggle-button-shop" type="button"></button>
                    <%--@elvariable id="user" type="gov.iti.Entities.User"--%>
                    <span class="total-item-round cart-count">${LoggedUser.carts.size()}</span>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">✕ Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                            <li>

                                <a href="index.jsp"><i class="fas fa-home u-c-brand"></i></a></li>
                            <li>

                                <a href="wishlist"><i class="far fa-heart"></i></a></li>
                            <li class="has-dropdown">

                                <a class="mini-cart-shop-link"><i class="fas fa-shopping-bag"></i>

                                    <span class="total-item-round cart-count">${LoggedUser.carts.size()}</span></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <div class="mini-cart">
<%--                                    <jsp:include page="mini-cart.jsp"/>--%>

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
