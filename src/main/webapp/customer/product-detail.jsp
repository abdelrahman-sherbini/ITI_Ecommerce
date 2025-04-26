<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="images/favicon.png" rel="shortcut icon">
    <title>${product.productName} - RAWNAQ</title>

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
        <img class="preloader__img" src="images/preloader.png" alt="">
    </div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!--====== Main Header ======-->
    <jsp:include page="header.jsp"/>
    <!--====== End - Main Header ======-->

    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-t-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">

                        <!--====== Product Breadcrumb ======-->
                        <div class="pd-breadcrumb u-s-m-b-30">
                            <ul class="pd-breadcrumb__list">
                                <li class="has-separator">
                                    <a href="index.jsp">Home</a>
                                </li>
                                <li class="has-separator">
                                    <a href="/customer/shop">Shop</a>
                                </li>
                                <li class="has-separator">
                                    <a href="/customer/shop?category=${product.categoryId}">${category.categoryName}</a>
                                </li>
                                <li class="is-marked">
                                    <a href="javascript:void(0)">${product.productName}</a>
                                </li>
                            </ul>
                        </div>
                        <!--====== End - Product Breadcrumb ======-->

                        <!--====== Product Detail Zoom ======-->
                        <div class="pd u-s-m-b-30">
                            <div class="slider-fouc pd-wrap">
                                <div id="pd-o-initiate">
                                    <c:set var="images" value="${fn:split(product.productImages, ',')}"/>
                                    <c:forEach items="${images}" var="image">
                                        <div class="pd-o-img-wrap" data-src="images/product/${image}">
                                            <img class="u-img-fluid" src="/customer/images/product/${category.categoryName}/${image}" data-zoom-image="/customer/images/product/${category.categoryName}/${image}" alt="${product.productName}">
                                        </div>
                                    </c:forEach>
                                </div>
                                <span class="pd-text">Click for larger zoom</span>
                            </div>
                            <div class="u-s-m-t-15">
                                <div class="slider-fouc">
                                    <div id="pd-o-thumbnail">
                                        <c:forEach items="${images}" var="image">
                                            <div>
                                                <img class="u-img-fluid" src="/customer/images/product/${category.categoryName}/${image}" alt="${product.productName}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--====== End - Product Detail Zoom ======-->
                    </div>
                    <div class="col-lg-7">

                        <!--====== Product Right Side Details ======-->
                        <div class="pd-detail">
                            <div>
                                <span class="pd-detail__name">${product.productName}</span>
                            </div>
                            <div>
                                <div class="pd-detail__inline">
                                        <span class="pd-detail__price">
                                            <fmt:formatNumber value="${product.productPriceAfterDiscount}" type="currency" currencySymbol="$"/>
                                        </span>
                                    <c:if test="${product.productDiscount > 0}">
                                        <span class="pd-detail__discount">(${product.productDiscount}% OFF)</span>
                                        <del class="pd-detail__del">
                                            <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="$"/>
                                        </del>
                                    </c:if>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <div class="pd-detail__rating gl-rating-style">
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <div class="pd-detail__inline">
                                    <span class="pd-detail__stock">${product.productQunatity} in stock</span>
                                    <c:if test="${product.productQunatity <= 5}">
                                        <span class="pd-detail__left">Only ${product.productQunatity} left</span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <span class="pd-detail__preview-desc">${product.productDescription}</span>
                            </div>

                            <div class="u-s-m-b-15">
                                <div class="pd-detail__inline">
                                    <span class="pd-detail__click-wrap">
                                        <i class="far fa-heart u-s-m-r-6"></i>
                                        <c:choose>
                                            <c:when test="${empty LoggedUser}">
                                                <a href="signin.jsp">Add to Wishlist</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" id="addToWishlist" data-product-id="${product.productId}">Add to Wishlist</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="pd-detail__click-count" id="wishlistCount">(${wishlistCount})</span>
                                    </span>
                                </div>
                            </div>

                            <div class="u-s-m-b-15">
                                <div class="pd-detail__inline">
                                        <span class="pd-detail__click-wrap">
                                            <i class="far fa-envelope u-s-m-r-6"></i>
                                            <a href="signin.jsp">Email me When the price drops</a>
                                            <span class="pd-detail__click-count">(20)</span>
                                        </span>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <ul class="pd-social-list">
                                    <li><a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a class="s-tw--color-hover" href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a class="s-insta--color-hover" href="#"><i class="fab fa-instagram"></i></a></li>
                                    <li><a class="s-wa--color-hover" href="#"><i class="fab fa-whatsapp"></i></a></li>
                                    <li><a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g"></i></a></li>
                                </ul>
                            </div>
                            <div class="u-s-m-b-15">
                                <form class="pd-detail__form" id="addToCartForm">
                                    <input type="hidden" name="operation" value="AddOrder">
                                    <input type="hidden" name="productID" value="${product.productId}">
                                    <div class="pd-detail-inline-2">
                                        <div class="u-s-m-b-15">
                                            <div class="input-counter">
                                                <span class="input-counter__minus fas fa-minus"></span>
                                                <input class="input-counter__text input-counter--text-primary-style" type="text"
                                                       name="quantity" value="1" data-min="1" data-max="1000">
                                                <span class="input-counter__plus fas fa-plus"></span>
                                            </div>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <button class="btn btn--e-brand-b-2" type="submit">Add to Cart</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="u-s-m-b-15">
                                <span class="pd-detail__label u-s-m-b-8">Product Policy:</span>
                                <ul class="pd-detail__policy-list">
                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>
                                        <span>Buyer Protection.</span>
                                    </li>
                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>
                                        <span>Full Refund if you don't receive your order.</span>
                                    </li>
                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>
                                        <span>Returns accepted if product not as described.</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--====== End - Product Right Side Details ======-->
                    </div>
                </div>
            </div>
        </div>

        <!--====== Product Detail Tab ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pd-tab">
                            <div class="u-s-m-b-30">
                                <ul class="nav pd-tab__list">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#pd-desc">DESCRIPTION</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <!--====== Tab 1 ======-->
                                <div class="tab-pane fade show active" id="pd-desc">
                                    <div class="pd-tab__desc">
                                        <div class="u-s-m-b-15">
                                            <p>${product.productDescription}</p>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <ul>
                                                <li><i class="fas fa-check u-s-m-r-8"></i>
                                                    <span>Buyer Protection.</span>
                                                </li>
                                                <li><i class="fas fa-check u-s-m-r-8"></i>
                                                    <span>Full Refund if you don't receive your order.</span>
                                                </li>
                                                <li><i class="fas fa-check u-s-m-r-8"></i>
                                                    <span>Returns accepted if product not as described.</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--====== End - Tab 1 ======-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Product Detail Tab ======-->

        <!--====== Similar Products Section ======-->
        <div class="u-s-p-b-90">
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">Similar Products</h1>
                                <span class="section__span u-c-grey">PRODUCTS FROM THE SAME CATEGORY</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section__content">
                <div class="container">
                    <div class="slider-fouc">
                        <div class="owl-carousel product-slider" data-item="4">
                            <c:forEach items="${similarProducts}" var="similarProduct">
                                <div class="u-s-m-b-30">
                                    <div class="product-o product-o--hover-on">
                                        <div class="product-o__wrap">
                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="/customer/product-detail?id=${similarProduct.productId}">
                                                <img class="aspect__img" src="/customer/images/product/${category.categoryName}/${fn:split(similarProduct.productImages, ',')[0]}" alt="${similarProduct.productName}">
                                            </a>
                                            <div class="product-o__action-wrap">
                                                <ul class="product-o__action-list">
                                                    <li>
                                                        <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a>
                                                    </li>
                                                    <li>
                                                        <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="signin.jsp" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <span class="product-o__category">
                                                <a href="/customer/shop?category=${similarProduct.categoryId}">${category.categoryName}</a>
                                            </span>
                                        <span class="product-o__name">
                                                <a href="/customer/product-detail?id=${similarProduct.productId}">${similarProduct.productName}</a>
                                            </span>
                                        <div class="product-o__rating gl-rating-style">
                                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                            <span class="product-o__review">(20)</span>
                                        </div>
                                        <span class="product-o__price">
                                                <fmt:formatNumber value="${similarProduct.productPriceAfterDiscount}" type="currency" currencySymbol="$"/>
                                                <c:if test="${similarProduct.productDiscount > 0}">
                                                    <span class="product-o__discount">
                                                        <fmt:formatNumber value="${similarProduct.productPrice}" type="currency" currencySymbol="$"/>
                                                    </span>
                                                </c:if>
                                            </span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Similar Products Section ======-->
    </div>
    <!--====== End - App Content ======-->

    <!--====== Main Footer ======-->
    <jsp:include page="footer.jsp"/>

    <!--====== Modal Section ======-->
    <!-- Keep existing modal code -->
</div>
<!--====== End - Main App ======-->

<!--====== Vendor Js ======-->
<script src="js/vendor.js"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="js/jquery.shopnav.js"></script>

<!--====== App ======-->
<script src="js/app.js"></script>

<script>
    document.getElementById('addToCartForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        // Check if user is logged in
        <c:if test="${empty LoggedUser}">
        window.location.href = "signin.jsp";
        return;
        </c:if>

        const formData = new FormData(this);

        try {
            const response = await fetch('/customer/UpdateCartServlet', {
                method: 'POST',
                body: new URLSearchParams(formData),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            });

            if (response.ok) {
                // Success - update cart count in UI if you have one
                const cartCount = document.querySelector('.cart-count');
                if (cartCount) {
                    const current = parseInt(cartCount.textContent) || 0;
                    cartCount.textContent = current + 1;
                }

                // Show success message
                alert('Product added to cart!');
            } else {
                alert('Failed to add to cart. Please try again.');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('An error occurred. Please try again.');
        }
    });
</script>

<script>
    document.getElementById('addToWishlist')?.addEventListener('click', async function(e) {
        e.preventDefault();

        const productId = this.getAttribute('data-product-id');

        try {
            const response = await fetch('/customer/UpdateWishServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    operation: 'addWish',
                    productID: productId
                })
            });

            if (response.ok) {
                // Update wishlist count
                const countElement = document.getElementById('wishlistCount');
                const currentCount = parseInt(countElement.textContent.match(/\d+/)[0]) || 0;
                countElement.textContent = `(${currentCount + 1})`;

                // Optional: Change heart icon to solid
                this.querySelector('i').classList.replace('far', 'fas');

                alert('Added to wishlist successfully!');
            } else {
                alert('Failed to add to wishlist');
            }
        } catch (error) {
            console.error('Error:', error);
            // alert('An error occurred');
        }
    });
</script>


</body>
</html>