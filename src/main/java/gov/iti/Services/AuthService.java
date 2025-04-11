package gov.iti.Services;


import gov.iti.Entities.User;
import gov.iti.Entities.UserAuth;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class AuthService {
    private EntityManager entityManager;
    private CRUDService<UserAuth> crudService;

    // Constructor to inject EntityManager
    public AuthService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, UserAuth.class);
    }

     public boolean addAuth(UserAuth userAuth) {
        return crudService.create(userAuth);

    }


    public UserAuth findBySelector(String selector){
        String jpql = "SELECT a FROM UserAuth a WHERE a.selector = :selector";
        TypedQuery<UserAuth> query = entityManager.createQuery(jpql, UserAuth.class);
        query.setParameter("selector", selector);
        return query.getResultStream().findFirst().orElse(null);

    }

    public boolean update(UserAuth userAuth){
        return crudService.update(userAuth);
    }
    
}
