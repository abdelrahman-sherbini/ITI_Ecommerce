package gov.iti.Services;

import gov.iti.Entities.User;
import gov.iti.Entities.UserAddress;
import gov.iti.Entities.Wishlist;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;

public class UserDBService {
    private EntityManager entityManager;
    private CRUDService<User> crudService;

    // Constructor to inject EntityManager
    public UserDBService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, User.class);
    }

    public User findById(Long id) {
        return crudService.find(id);
    }

    public List<User> getUsers() {
        return crudService.getAll();
    }

    public boolean removeAllCarts(Long userId) {
        String jpql = "DELETE FROM Cart a WHERE a.user = :user";
        return removeAll(userId, jpql);
    }

    public User refreshUser(User user) {

        try {
            entityManager.getTransaction().begin();

            // Re-fetch by ID
            User managedUser = entityManager.find(User.class, user.getId());
            entityManager.refresh(managedUser); // Force refresh from DB (optional)

            entityManager.getTransaction().commit();
            return managedUser;

        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
            return user;
        }
    }

    public List<Wishlist> getWishlists(Long userId) {
        String jpql = "SELECT a FROM Wishlist a WHERE a.user = :user";

        User user = crudService.find(userId);

        // Create the query using the EntityManager
        List<Wishlist> entities = null;
        try {
            TypedQuery<Wishlist> query = entityManager.createQuery(jpql, Wishlist.class);
            query.setParameter("user", user);
            // Execute the query and get the result list
            entities = query.getResultList();
        } catch (Exception e) {
            entities = new ArrayList<Wishlist>();
        }

        return entities;
    }

    public boolean removeAllWishes(Long userId) {
        String jpql = "DELETE FROM Wishlist a WHERE a.user = :user";
        return removeAll(userId, jpql);
    }

    public List<UserAddress> getAddresses(Long userId) {
        String jpql = "SELECT a FROM UserAddress a WHERE a.user = :user";

        User user = crudService.find(userId);

        // Create the query using the EntityManager
        List<UserAddress> entities = null;
        try {
            TypedQuery<UserAddress> query = entityManager.createQuery(jpql, UserAddress.class);
            query.setParameter("user", user);
            // Execute the query and get the result list
            entities = query.getResultList();
        } catch (Exception e) {
            entities = new ArrayList<UserAddress>();
        }

        return entities;
    }

    private boolean removeAll(Long userId, String jpql) {
        User user = crudService.find(userId);

        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery(jpql);
            query.setParameter("user", user);

            int deletedCount = query.executeUpdate();
            entityManager.getTransaction().commit();
            return deletedCount > 0;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive())
                entityManager.getTransaction().rollback();
            e.printStackTrace();
            return false;

        }
    }

    public boolean updateUser(User user) {
        return crudService.update(user);
    }

    public boolean addUser(User user) {
        return crudService.create(user);

    }

    public User getUserByEmail(String email) {

        String jpql = "SELECT u FROM User u WHERE u.email = :email";
        TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
        query.setParameter("email", email);
        return query.getResultStream().findFirst().orElse(null);

    }

    public List<String> getAllEmails() {
       
        String jpql = "SELECT u.email FROM User u";
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        return query.getResultList();
    }

    public List<String> getAllPhoneNumbers(){

        String jpql = "SELECT u.phone FROM User u";
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        return query.getResultList();

    }

    public List<String> getAllPhoneNumbersExcept(Long uid) {
     
        String jpql = "SELECT u.phone FROM User u WHERE u.id != :uid";
    
        
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        query.setParameter("uid", uid);
    
        
        return query.getResultList();
    }

}
