// add-to-cart.js
document.addEventListener('DOMContentLoaded', function() {
    // Handle Add to Cart button clicks
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('add-to-cart-btn')) {
            e.preventDefault();
            const btn = e.target;
            const productId = btn.dataset.productId;
            const productName = btn.dataset.productName;
            const productImage = btn.dataset.productImage;
            const productPrice = btn.dataset.productPrice;

            // Prepare the form data - use 'productID' to match servlet expectation
            const formData = new URLSearchParams();
            formData.append('operation', 'AddOrder');
            formData.append('productID', productId); // Changed from productId to productID

            // Submit via AJAX
            fetch('/customer/UpdateCartServlet', {
                method: 'POST',
                body: formData,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
                .then(response => {
                    if (response.ok) {
                        // Update modal content
                        document.getElementById('add-to-cart-image').src = productImage;
                        document.getElementById('add-to-cart-name').textContent = productName;
                        document.getElementById('add-to-cart-price').textContent = productPrice;

                        // Show modal
                        $('#add-to-cart').modal('show');
                    } else {
                        return response.text().then(text => { throw new Error(text) });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred: ' + error.message);
                });
        }
    });
});