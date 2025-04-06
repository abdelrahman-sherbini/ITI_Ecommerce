package gov.iti.Services;

import gov.iti.Entities.User;
import jakarta.persistence.EntityManager;

import java.util.List;

public class UserDBService {
    private EntityManager entityManager;
    private CRUDService<User> crudService;
    // Constructor to inject EntityManager
    public UserDBService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, User.class);
    }

    public List<User> getUsers() {
        return crudService.getAll();
    }

}
