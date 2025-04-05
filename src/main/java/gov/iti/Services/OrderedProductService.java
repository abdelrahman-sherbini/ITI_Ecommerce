package gov.iti.Services;

import gov.iti.Entities.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class OrderedProductService {
    private EntityManager entityManager;

    // Constructor to inject EntityManager
    public OrderedProductService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public boolean isOrdered(Product product) {
        try {
            // Create a JPQL query to check if there are any orders containing the given product
            String jpql = "SELECT COUNT(o) FROM OrderedProduct o WHERE o.product = :product";

            // Create the query using the EntityManager
            TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
            query.setParameter("product", product);

            // Execute the query and get the result
            long count = query.getSingleResult();

            // If count > 0, it means the product is ordered
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }


}
