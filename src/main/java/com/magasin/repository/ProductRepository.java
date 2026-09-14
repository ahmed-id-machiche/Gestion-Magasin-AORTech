package com.magasin.repository;

import com.magasin.model.entity.Product;
import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class ProductRepository extends AbstractRepository<Product> {
    public ProductRepository() {
        super(Product.class);
    }

    public List<Product> findProductByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select p from Product p where lower(p.name) like :name order by p.name", Product.class)
                    .setParameter("name", "%" + name.toLowerCase() + "%")
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Product> findProductsByCategory(Long categoryId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select p from Product p where p.category.id = :categoryId order by p.name", Product.class)
                    .setParameter("categoryId", categoryId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Product> findLowStockProducts() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select p from Product p where p.quantity <= p.minStock order by p.quantity asc", Product.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}

