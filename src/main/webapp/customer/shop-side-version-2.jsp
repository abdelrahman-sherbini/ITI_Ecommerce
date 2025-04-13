<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <div class="shop-w-master">
                            <h1 class="shop-w-master__heading u-s-m-b-30">
                                <i class="fas fa-filter u-s-m-r-8"></i>
                                <span>FILTERS</span>
                            </h1>
                            <div class="shop-w-master__sidebar">
                                <div class="u-s-m-b-30">
                                    <div class="shop-w shop-w--style">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">CATEGORY</h1>
                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-category" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-category">
                                            <ul class="shop-w__category-list gl-scroll">
                                                <li class="has-list">
                                                    <a href="/customer/shop">
                                                        ALL PRODUCTS
                                                    </a>
                                                    <span class="category-list__text u-s-m-l-6">
                                                            (${totalProductCount})
                                                        </span>
                                                </li>
                                                <c:forEach items="${categories}" var="category">
                                                    <li class="has-list">
                                                        <a href="/customer/shop?category=${category.categoryId}">
                                                                ${category.categoryName}
                                                        </a>
                                                        <span class="category-list__text u-s-m-l-6">
                                                                (${productCounts[category.categoryId]})
                                                            </span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="u-s-m-b-30">
                                    <div class="shop-w shop-w--style">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">PRICE</h1>
                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-price" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-price">
                                            <form id="priceFilterForm" method="get">
                                                <input type="hidden" name="category" value="${param.category}">
                                                <input type="hidden" name="page" value="1">
                                                <input type="hidden" name="limit" value="${limit}">
                                                <input type="hidden" name="sort" value="${param.sort}">
                                                <div class="shop-w__form-p-wrap">
                                                    <div>
                                                        <label for="price-min"></label>
                                                        <input class="input-text input-text--primary-style"
                                                               type="number"
                                                               id="price-min"
                                                               name="minPrice"
                                                               placeholder="Min"
                                                               value="${param.minPrice}">
                                                    </div>
                                                    <div>
                                                        <label for="price-max"></label>
                                                        <input class="input-text input-text--primary-style"
                                                               type="number"
                                                               id="price-max"
                                                               name="maxPrice"
                                                               placeholder="Max"
                                                               value="${param.maxPrice}">
                                                    </div>

                                                    <div>
                                                        <button class="btn btn--e-brand" type="submit"> > </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12">
                        <div class="shop-p">
                            <div class="shop-p__toolbar u-s-m-b-30">
                                <div class="shop-p__tool-style">
                                    <div class="tool-style__group u-s-m-b-8">
                                        <span class="js-shop-grid-target is-active">Grid</span>
                                        <span class="js-shop-list-target">List</span>
                                    </div>
                                    <form id="limitForm" method="get">
                                        <input type="hidden" name="category" value="${param.category}">
                                        <input type="hidden" name="page" value="1">
                                        <input type="hidden" name="minPrice" value="${param.minPrice}">
                                        <input type="hidden" name="maxPrice" value="${param.maxPrice}">
                                        <div class="tool-style__form-wrap">
                                            <div class="u-s-m-b-8">
                                                <select class="select-box select-box--transparent-b-2" name="limit" onchange="document.getElementById('limitForm').submit()">
                                                    <option value="8" ${limit == 8 ? 'selected' : ''}>Show: 8</option>
                                                    <option value="12" ${limit == 12 ? 'selected' : ''}>Show: 12</option>
                                                    <option value="16" ${limit == 16 ? 'selected' : ''}>Show: 16</option>
                                                    <option value="28" ${limit == 28 ? 'selected' : ''}>Show: 28</option>
                                                </select>
                                            </div>
                                            <div class="u-s-m-b-8">
                                                <select class="select-box select-box--transparent-b-2" name="sort" onchange="document.getElementById('limitForm').submit()">
                                                    <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Sort By: Newest Items</option>
                                                    <option value="name_asc" ${param.sort == 'name_asc' ? 'selected' : ''}>Sort By: Name (A-Z)</option>
                                                    <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>Sort By: Lowest Price</option>
                                                    <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>Sort By: Highest Price</option>
                                                    <option value="discount_desc" ${param.sort == 'discount_desc' ? 'selected' : ''}>Sort By: Highest Discount</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="shop-p__collection">
                                <div class="row is-grid-active">
                                    <c:forEach items="${products}" var="product">
                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product-m">
                                                <div class="product-m__thumb">
                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="/customer/product-detail?id=${product.productId}>
                                                        <img class="aspect__img" src="${fn:split(product.productImages, ',')[0]}" alt="${product.productName}">
                                                    </a>
                                                    <div class="product-m__quick-look">
                                                        <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick Look"></a>
                                                    </div>
                                                    <div class="product-m__add-cart">
                                                        <a class="btn--e-brand" data-modal="modal" data-modal-id="#add-to-cart">Add to Cart</a>
                                                    </div>
                                                </div>
                                                <div class="product-m__content">
                                                    <div class="product-m__category">
                                                        <a href="/customer/shop?category=${product.categoryId}">
                                                                ${categoryNames[product.categoryId]}
                                                        </a>
                                                    </div>
                                                    <div class="product-m__name">
                                                        <a href="/customer/product-detail?id=${product.productId}">${product.productName}</a>
                                                    </div>
                                                    <div class="product-m__rating gl-rating-style"></div>
                                                    <div class="product-m__price">
                                                        <fmt:formatNumber value="${product.getProductPriceAfterDiscount()}" type="currency" currencySymbol="$"/>
                                                        <c:if test="${product.productDiscount > 0}">
                                                                <span class="product-m__discount">
                                                                    <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="$"/>
                                                                </span>
                                                        </c:if>
                                                    </div>
                                                    <div class="product-m__hover">
                                                        <div class="product-m__preview-description">
                                                            <span>${product.productDescription}</span>
                                                        </div>
                                                        <div class="product-m__wishlist">
                                                            <a class="far fa-heart" href="#" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="u-s-p-y-60">
                                <!--====== Pagination ======-->
                                <ul class="shop-p__pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li>
                                            <a href="/customer/shop?page=${currentPage - 1}&limit=${limit}&category=${param.category}&sort=${param.sort}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">
                                                <i class="fas fa-angle-left"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="${i == currentPage ? 'is-active' : ''}">
                                            <a href="/customer/shop?page=${i}&limit=${limit}&category=${param.category}&sort=${param.sort}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${currentPage < totalPages}">
                                        <li>
                                            <a href="/customer/shop?page=${currentPage + 1}&limit=${limit}&category=${param.category}&sort=${param.sort}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">
                                                <i class="fas fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                                <!--====== End - Pagination ======-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->
    </div>
    <!--====== End - App Content ======-->

    <!--====== Main Footer ======-->
    <jsp:include page="footer.jsp"/>

    <!--====== Modal Section ======-->
    <!-- ... (keep existing modal code) ... -->
</div>
<!--====== End - Main App ======-->

<!--====== Vendor Js ======-->
<script src="js/vendor.js"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="js/jquery.shopnav.js"></script>

<!--====== App ======-->
<script src="js/app.js"></script>
</body>
</html>