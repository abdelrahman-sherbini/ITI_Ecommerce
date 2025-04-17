
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
