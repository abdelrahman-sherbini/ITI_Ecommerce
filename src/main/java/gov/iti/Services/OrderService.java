package gov.iti.Services;

import gov.iti.Entities.Order;
import jakarta.persistence.EntityManager;

import java.util.List;

public class OrderService {
    private EntityManager entityManager;
    private CRUDService<Order> crudService;
    // Constructor to inject EntityManager
    public OrderService(EntityManager entityManager) {


        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Order.class);
    }

    public boolean updateOrder(Order order) {

        return crudService.update(order);
    }


    public Order getOrder(int id) {

        return crudService.find(id);
    }
    public List<Order> getAllOrders() {
        return crudService.getAll();
    }
}
