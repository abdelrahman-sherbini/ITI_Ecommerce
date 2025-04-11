$(document).ready(function() {
    let currentPage = 1;
    const productsPerPage = 12;
    let allProducts = [];
    let currentCategoryId = 0;

    loadCategories();

    function loadCategories() {
        $.ajax({
            url: '/customer/CategoriesServlet',
            type: 'GET',
            dataType: 'json',
            success: function(categories) {
                renderCategories(categories);
                initFilterButtons();
                loadProducts(0); // Initial load of all products
            },
            error: function(xhr, status, error) {
                console.error("Error loading categories: " + error);
                renderCategories(getDefaultCategories());
                initFilterButtons();
                loadProducts(0); // Initial load with default categories
            }
        });
    }

    function loadProducts(categoryId = 0, page = 1) {
        currentCategoryId = categoryId;
        currentPage = page;

        $.ajax({
            url: '/customer/ProductsServlet',
            type: 'GET',
            data: { categoryId: categoryId },
            dataType: 'json',
            success: function(products) {
                allProducts = products;
                renderProducts(getPaginatedProducts(products, page));
                updateLoadMoreButton(products.length);
            },
            error: function(xhr, status, error) {
                console.error("Error loading products: " + error);
                allProducts = getDefaultProducts();
                renderProducts(getPaginatedProducts(allProducts, page));
                updateLoadMoreButton(allProducts.length);
            }
        });
    }

    function getPaginatedProducts(products, page) {
        const start = (page - 1) * productsPerPage;
        const end = start + productsPerPage;
        return products.slice(0, end);
    }

    function updateLoadMoreButton(totalProducts) {
        const $loadMoreBtn = $('.load-more button');
        const displayedProducts = currentPage * productsPerPage;

        if (displayedProducts >= totalProducts) {
            $loadMoreBtn.hide();
        } else {
            $loadMoreBtn.show();
        }
    }

    function renderCategories(categories) {
        var container = $('#categoryFilterContainer');
        container.empty();

        categories.forEach(function(category) {
            var filterClass = category.categoryName.toLowerCase().replace(/\s+/g, '');
            var buttonClass = category.categoryName === "ALL"
                ? "btn filter__btn filter__btn--style-1 js-checked"
                : "btn filter__btn filter__btn--style-1";

            container.append(
                '<div class="filter__category-wrapper">' +
                '<button class="' + buttonClass + '" type="button" ' +
                'data-filter=".' + filterClass + '" ' +
                'data-category-id="' + category.categoryId + '">' +
                category.categoryName.toUpperCase() +
                '</button></div>'
            );
        });
    }

    function renderProducts(products) {
        var container = $('#productRow');
        container.empty();

        products.forEach(function(product) {
            var filterClass = getCategoryClass(product.categoryId);
            var discountedPrice = product.productPriceAfterDiscount ||
                (product.productPrice * (1 - product.productDiscount / 100)).toFixed(2);

            container.append(
                '<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item ' + filterClass + '">' +
                '<div class="product-o product-o--hover-on product-o--radius">' +
                '<div class="product-o__wrap">' +
                '<a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.jsp?productId=' + product.productId + '">' +
                '<img class="aspect__img" src="' + product.productImages + '" alt="' + product.productName + '">' +
                '</a>' +
                '<div class="product-o__action-wrap">' +
                '<ul class="product-o__action-list">' +
                '<li>' +
                '<a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a>' +
                '</li>' +
                '<li>' +
                '<a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a>' +
                '</li>' +
                '<li>' +
                '<a href="signin.jsp" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a>' +
                '</li>' +
                '<li>' +
                '<a href="signin.jsp" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a>' +
                '</li>' +
                '</ul>' +
                '</div>' +
                '</div>' +
                '<span class="product-o__category">' +
                '<a href="shop-side-version-2.jsp">Electronics</a>' +
                '</span>' +
                '<span class="product-o__name">' +
                '<a href="product-detail.jsp?productId=' + product.productId + '">' + product.productName + '</a>' +
                '</span>' +
                '<div class="product-o__rating gl-rating-style">' +
                '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>' +
                '<span class="product-o__review">(23)</span>' +
                '</div>' +
                '<span class="product-o__price">$' + discountedPrice +
                (product.productDiscount > 0 ? '<span class="product-o__discount">$' + product.productPrice + '</span>' : '') +
                '</span>' +
                '</div>' +
                '</div>'
            );
        });
    }

    function getCategoryClass(categoryId) {
        const categoryMap = {
            1: 'headphone',
            2: 'smartphone',
            3: 'sportgadget',
            4: 'dslr'
        };
        return categoryMap[categoryId] || 'other';
    }

    function getRatingStars(rating) {
        let stars = '';
        for (let i = 1; i <= 5; i++) {
            if (i <= rating) {
                stars += '<i class="fas fa-star"></i>';
            } else if (i - 0.5 <= rating) {
                stars += '<i class="fas fa-star-half-alt"></i>';
            } else {
                stars += '<i class="far fa-star"></i>';
            }
        }
        return stars;
    }

    function getDefaultCategories() {
        return [
            {categoryId: 0, categoryName: "ALL", categoryImage: ""},
            {categoryId: 1, categoryName: "Headphones", categoryImage: ""},
            {categoryId: 2, categoryName: "Smartphones", categoryImage: ""},
            {categoryId: 3, categoryName: "Sport Gadgets", categoryImage: ""},
            {categoryId: 4, categoryName: "DSLR", categoryImage: ""}
        ];
    }

    function getDefaultProducts() {
        return [
            {
                productId: 1,
                productName: "Red Wireless Headphone",
                productPrice: 160.00,
                productDiscount: 21.875,
                productImages: "images/product/electronic/product2.jpg",
                categoryId: 1
            },
            {
                productId: 2,
                productName: "Smartphone RAM 8GB",
                productPrice: 160.00,
                productDiscount: 21.875,
                productImages: "images/product/electronic/product9.jpg",
                categoryId: 2
            }
        ];
    }

    function initFilterButtons() {
        $('.filter__btn').on('click', function() {
            $('.filter__btn').removeClass('js-checked');
            $(this).addClass('js-checked');

            var categoryId = $(this).data('category-id');
            currentPage = 1; // Reset to first page when category changes
            loadProducts(categoryId, currentPage);
        });

        // Add click handler for Load More button
        $('.load-more button').on('click', function() {
            currentPage++;
            loadProducts(currentCategoryId, currentPage);
        });
    }
});