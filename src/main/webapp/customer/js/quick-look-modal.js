document.addEventListener('DOMContentLoaded', function() {
    // Initialize tooltips
    $('[data-tooltip="tooltip"]').tooltip();

    // Quick Look Modal Handler
    $('#quick-look').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var modal = $(this);

        // Extract product data from data attributes
        var productData = button.data();

        // Update modal content
        modal.find('#modal-product-name').text(productData.productName);
        modal.find('#modal-product-price').text(productData.productPrice);
        modal.find('#modal-product-description').text(productData.productDescription);
        modal.find('#modal-product-id').val(productData.productId);

        // Handle discount display
        if (productData.productDiscount > 0) {
            modal.find('#modal-product-discount').text('(' + productData.productDiscount + '% OFF)').show();
            modal.find('#modal-product-original-price').text(productData.productOriginalPrice).show();
        } else {
            modal.find('#modal-product-discount').hide();
            modal.find('#modal-product-original-price').hide();
        }

        // Update stock information
        modal.find('#modal-product-stock').text(productData.productStock + ' in stock');
        modal.find('#modal-product-left').toggle(productData.productStock <= 5)
            .text('Only ' + productData.productStock + ' left');

        // Update category breadcrumb
        modal.find('#modal-category-link')
            .attr('href', '/customer/shop?category=' + productData.categoryId)
            .text(productData.categoryName);

        modal.find('#modal-product-name-breadcrumb').text(productData.productName);

        // Update product image
        console.log(productData.productImage);
        modal.find('#modal-product-image')
            .attr('src', productData.productImage)
            .attr('alt', productData.productName);
    });
});