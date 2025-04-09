package gov.iti.Controllers.admin;

import gov.iti.Entities.Admin;
import gov.iti.Helper.EntityManagerProvider;
import gov.iti.Services.AdminService;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class UpdateOrderServletTest {
    private EntityManager em;
    @org.junit.jupiter.api.BeforeEach
    void setUp() {
        em = EntityManagerProvider.getEntityManager();
    }

    @org.junit.jupiter.api.AfterEach
    void tearDown() {
        if(em!=null && em.isOpen()){
            em.close();
        }
    }

    @Test
    @Disabled
    void addAdmin() {
        Admin admin = new Admin();
        admin.setEmail("admi223n@gmail.com");
        admin.setPassword("admin");
        admin.setName("admin");
        admin.setPhone(null);
        em.getTransaction().begin();
        em.persist(admin);
        em.getTransaction().commit();
        AdminService adminService = new AdminService(em);
        Assertions.assertTrue(
                adminService.getAllAdmins().stream()
                        .anyMatch(a -> "admi223n@gmail.com".equals(a.getEmail()))
        );
//        Admin admin2 = em.find(Admin.class, admin.getId());
//        Assertions.assertEquals(admin.getEmail(), admin2.getEmail());
    }
}