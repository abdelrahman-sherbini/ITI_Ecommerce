package gov.iti.Services;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class CRUDService<T> {

    private final EntityManager entityManager;
    private final Class<T> entityClass;

    public CRUDService(EntityManager entityManager, Class<T> entityClass) {
        this.entityManager = entityManager;
        this.entityClass = entityClass;
    }

    public boolean update(T entity) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public T find(Object id) {
        return entityManager.find(entityClass, id);
    }

    public boolean create(T entity) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive())
                entityManager.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(T entity) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(entityManager.contains(entity) ? entity : entityManager.merge(entity));
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive())
                entityManager.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    public List<T> getAll() {
        String jpql = "SELECT a FROM " + entityClass.getSimpleName() + " a";

        // Create the query using the EntityManager
        List<T> entities = null;
        try {
            TypedQuery<T> query = entityManager.createQuery(jpql, entityClass);

            // Execute the query and get the result list
            entities = query.getResultList();
        } catch (Exception e) {
            entities = new ArrayList<T>();
        }

        return entities;
    }

    public boolean deleteAll() {
        String jpql = "DELETE FROM " + entityClass.getSimpleName() + " a";

        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery(jpql);
            int deletedCount = query.executeUpdate();
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive())
                entityManager.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }
}
