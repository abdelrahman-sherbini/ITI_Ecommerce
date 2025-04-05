package gov.iti.Services;

import gov.iti.Entities.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class AdminService {
    private EntityManager entityManager;

    // Constructor to inject EntityManager
    public AdminService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Admin getAdmin(int id) {
        return entityManager.find(Admin.class, id);
    }
    public boolean deleteAdmin(int id) {
        Admin admin1 = getAdmin(id);

        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.remove(admin1);

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
    public boolean createAdmin(Admin admin) {

        // Begin a transaction
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            // Start transaction
            transaction.begin();

            // Persist the category
            entityManager.persist(admin);

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
        String jpql = "SELECT a from Admin a";

        // Create the query using the EntityManager
        List<Admin> admins = null;
        try {
            TypedQuery<Admin> query = entityManager.createQuery(jpql, Admin.class);

            // Execute the query and get the result list
            admins = query.getResultList();
        } catch (Exception e) {
            admins = new ArrayList<Admin>();
        }

        return admins;
    }
}
