package gov.iti.Services;

import gov.iti.Entities.PasswordResetToken;
import gov.iti.Entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class PasswordResetService {
    private EntityManager em;
    private CRUDService<PasswordResetToken> crudService;

    public PasswordResetService(EntityManager em) {
        this.em = em;
        crudService = new CRUDService<>(em, PasswordResetToken.class);
    }

    public PasswordResetToken findByUser(User user) {
        try {
            return em
                    .createQuery("SELECT t FROM PasswordResetToken t WHERE t.user = :user", PasswordResetToken.class)
                    .setParameter("user", user)
                    .getSingleResult();

        } catch (NoResultException e) {
            return null;
        }
    }

    public boolean add(PasswordResetToken token) {
        return crudService.create(token);
    }

    public boolean update(PasswordResetToken token) {
        return crudService.update(token);
    }

    public PasswordResetToken findByToken(String token){
        
            try {
                return em.createQuery("SELECT p FROM PasswordResetToken p WHERE p.token = :token", PasswordResetToken.class)
                         .setParameter("token", token)
                         .getSingleResult();
            } catch (NoResultException e) {
                return null; 
            } 
        
    }

}
