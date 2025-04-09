package gov.iti.Services;

import gov.iti.Entities.Cart;
import jakarta.persistence.EntityManager;

public class CartService {
    private EntityManager entityManager;
    private  CRUDService<Cart> crudService;
    // Constructor to inject EntityManager
    public CartService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Cart.class);
    }

    public boolean addCart(Cart cart) {
        return crudService.create(cart);
    }

    public Cart getCart(Long cartItem) {
        return crudService.find(cartItem);
    }

    public boolean removeCart(Long cartItem) {
        Cart cart = crudService.find(cartItem);
        return crudService.delete(cart);
    }

    public boolean updateCartQuantity(Long cartItem, Long quantity ) {
        Cart cart = crudService.find(cartItem);
        cart.setQuantity(quantity);
        return crudService.update(cart);
    }


}
