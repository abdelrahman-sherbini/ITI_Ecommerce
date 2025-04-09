package gov.iti.Services;


import gov.iti.Entities.Wishlist;
import jakarta.persistence.EntityManager;

public class WishListService {
    private EntityManager entityManager;
    private CRUDService<Wishlist> crudService;

    // Constructor to inject EntityManager
    public WishListService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Wishlist.class);
    }

    public boolean deleteWishList(Long wishlistId) {
        Wishlist wishList = crudService.find(wishlistId);
        return crudService.delete(wishList);
    }

}
