package gov.iti.Services;

import gov.iti.Entities.Cart;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CartService {
    private EntityManager entityManager;
    private  CRUDService<Cart> crudService;
    // Constructor to inject EntityManager
    public CartService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Cart.class);
    }

    public boolean addCart(Cart cart) {
        System.out.println("addCart");
        TypedQuery<Cart> q = entityManager.createQuery("SELECT c FROM Cart c WHERE c.user = :user and c.product = :product", Cart.class);
        q.setParameter("user", cart.getUser());
        q.setParameter("product", cart.getProduct());
        try {

        Cart foundCart = q.getSingleResult();
            updateCartQuantity(foundCart.getId(), cart.getQuantity() + foundCart.getQuantity() );
            return false;
        } catch (Exception e) {

        return crudService.create(cart);
        }



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
