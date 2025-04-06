package gov.iti.Services;

import gov.iti.Entities.Admin;
import jakarta.persistence.EntityManager;

import java.util.List;

public class AdminService {
    private EntityManager entityManager;
    private  CRUDService<Admin> crudService;
    // Constructor to inject EntityManager
    public AdminService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager,Admin.class);
    }

    public Admin getAdmin(int id) {
        return crudService.find( id);
//        return entityManager.find(Admin.class, id);
    }
    public boolean deleteAdmin(int id) {
        Admin admin1 = getAdmin(id);
        return crudService.delete(admin1);

    }
    public boolean createAdmin(Admin admin) {

        return crudService.create(admin);

    }

    public Admin getAdminByEmailAndPassword(String email, String password) {
        // First, find the admin by email
        String jpql = "SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password";
        try {
            return entityManager.createQuery(jpql, Admin.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public List<Admin> getAllAdmins() {
        return crudService.getAll();
    }
}
