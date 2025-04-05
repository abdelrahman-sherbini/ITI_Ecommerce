package gov.iti.Services;

import gov.iti.Entities.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class CategoryService {
    private EntityManager entityManager;

    // Constructor to inject EntityManager
    public CategoryService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Category getCategory(Long category_id) {
        return entityManager.find(Category.class, category_id);
    }

    public void deleteCategory(Long category_id) {

        Category category = getCategory(category_id);
        entityManager.remove(category);

    }
    public boolean updateCategory(Category category) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.merge(category);

            // Commit the transaction
            transaction.commit();

            return true;  // Indicating success
        } catch (Exception e) {
            // Rollback transaction if there's an error
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;  // Indicating failure
        }
    }
    public boolean createCategory(Category category) {

        // Begin a transaction
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.persist(category);

            // Commit the transaction
            transaction.commit();

            return true;  // Indicating success
        } catch (Exception e) {
            // Rollback transaction if there's an error
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;  // Indicating failure
        }
    }
    public List<Category> getAllCategories() {
        // Create a JPQL query to fetch all orders
        String jpql = "SELECT c from Category c";

        // Create the query using the EntityManager
        TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);

        // Execute the query and get the result list
        List<Category> categories = query.getResultList();

        return categories;
    }
}
