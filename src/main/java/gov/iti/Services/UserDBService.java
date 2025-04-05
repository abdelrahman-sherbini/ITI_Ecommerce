package gov.iti.Services;

import gov.iti.Entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class UserDBService {
    private EntityManager entityManager;

    // Constructor to inject EntityManager
    public UserDBService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<User> getUsers() {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User u", User.class);
        return query.getResultList();
    }

}
