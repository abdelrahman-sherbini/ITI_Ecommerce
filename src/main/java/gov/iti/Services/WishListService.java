package gov.iti.Services;


import gov.iti.Entities.Wishlist;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

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

    public boolean addWishList(Wishlist wishlist) {
        TypedQuery<Wishlist> q = entityManager.createQuery("SELECT c FROM Wishlist c WHERE c.user = :user and c.product = :product", Wishlist.class);
        q.setParameter("user", wishlist.getUser());
        q.setParameter("product", wishlist.getProduct());
        try {

            Wishlist foundWish = q.getSingleResult();
            return false;
        } catch (Exception e) {

        return crudService.create(wishlist);
        }


    }

}
