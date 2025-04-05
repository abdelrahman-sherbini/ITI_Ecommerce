package gov.iti.Services;

import gov.iti.Entities.Order;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class OrderService {
    private EntityManager entityManager;

    // Constructor to inject EntityManager
    public OrderService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public boolean updateOrder(Order order) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.merge(order);

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


    public Order getOrder(int id) {
        return entityManager.find(Order.class, id);
    }
    public List<Order> getAllOrders() {
        // Create a JPQL query to fetch all orders
        String jpql = "SELECT o FROM Order o";

        // Create the query using the EntityManager
        TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);

        // Execute the query and get the result list
        List<Order> orders = query.getResultList();

        return orders;
    }
}
