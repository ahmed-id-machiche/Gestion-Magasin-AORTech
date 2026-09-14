package com.magasin.repository;

import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import java.util.List;

public abstract class AbstractRepository<T> {
    private final Class<T> entityClass;

    protected AbstractRepository(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    public T save(T entity) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
            return entity;
        } catch (PersistenceException e) {
            throw new RuntimeException("Erreur lors de l'enregistrement en base.", e);
        } finally {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();
        }
    }

    public T update(T entity) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            T merged = em.merge(entity);
            em.getTransaction().commit();
            return merged;
        } catch (PersistenceException e) {
            throw new RuntimeException("Erreur lors de la mise a jour en base.", e);
        } finally {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            throw new RuntimeException("Erreur lors de la suppression en base.", e);
        } finally {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();
        }
    }

    public T findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(entityClass, id);
        } finally {
            em.close();
        }
    }

    public List<T> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select e from " + entityClass.getSimpleName() + " e", entityClass).getResultList();
        } finally {
            em.close();
        }
    }
}

