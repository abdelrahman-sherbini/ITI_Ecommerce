package gov.iti.Services;

import gov.iti.Entities.Product;
import jakarta.persistence.EntityManager;

import java.util.List;

public class ProductService {
    private EntityManager entityManager;
    private CRUDService<Product> crudService;
    public ProductService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Product.class);
    }

    public List<Product> getAllProducts() {

        return crudService.getAll();
    }

    public Product getProductById(Long id) {
        return crudService.find(id);


    }

    public boolean updateProduct(Product product) {
        return crudService.update(product);

    }

    public boolean deleteProduct(Product product) {
        return crudService.delete(product);
    }

    public boolean addProduct(Product product) {

        return  crudService.create(product);
    }

}
