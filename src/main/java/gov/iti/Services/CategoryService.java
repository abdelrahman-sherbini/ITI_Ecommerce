package gov.iti.Services;

import gov.iti.Entities.Category;
import jakarta.persistence.EntityManager;

import java.util.List;

public class CategoryService {
    private EntityManager entityManager;
    private CRUDService<Category> crudService;
    // Constructor to inject EntityManager
    public CategoryService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, Category.class);
    }

    public Category getCategory(Long category_id) {
        return crudService.find(category_id);
    }

    public void deleteCategory(Long category_id) {

        Category category = getCategory(category_id);

        crudService.delete(category);

    }
    public boolean updateCategory(Category category) {
        return crudService.update(category);

    }
    public boolean createCategory(Category category) {
        return crudService.create(category);

    }
    public List<Category> getAllCategories() {

        return crudService.getAll();
    }
}
