package gov.iti.Services;

import gov.iti.Entities.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ProductService {
    private EntityManager entityManager;

    public ProductService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> getAllProducts() {
        // Create a JPQL query to fetch all orders
        String jpql = "SELECT p from Product p";

        // Create the query using the EntityManager
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);

        // Execute the query and get the result list
        List<Product> products = query.getResultList();

        return products;
    }

    public Product getProductById(int id) {
        Product product = entityManager.find(Product.class, id);
        return product;

    }

    public boolean updateProduct(Product product) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.merge(product);

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

    public void deleteProduct(Product product) {
        entityManager.getTransaction().begin();
        entityManager.remove(product);
        entityManager.getTransaction().commit();
    }

    public boolean addProduct(Product product) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.persist(product);

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

}
