package com.magasin.repository;

import com.magasin.model.entity.Sale;
import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class SaleRepository extends AbstractRepository<Sale> {
    public SaleRepository() {
        super(Sale.class);
    }

    @Override
    public List<Sale> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select s from Sale s left join fetch s.customer left join fetch s.user order by s.saleDate desc", Sale.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public Sale findWithItems(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            List<Sale> sales = em.createQuery("select distinct s from Sale s left join fetch s.items i left join fetch i.product where s.id = :id", Sale.class)
                    .setParameter("id", id)
                    .getResultList();
            return sales.isEmpty() ? null : sales.get(0);
        } finally {
            em.close();
        }
    }

    public List<Sale> findSalesBetweenDates(Date startDate, Date endDate) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select s from Sale s where s.saleDate between :startDate and :endDate order by s.saleDate desc", Sale.class)
                    .setParameter("startDate", startDate)
                    .setParameter("endDate", endDate)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public BigDecimal calculateTotalRevenue() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            BigDecimal value = em.createQuery("select coalesce(sum(s.totalAmount), 0) from Sale s", BigDecimal.class)
                    .getSingleResult();
            return value == null ? BigDecimal.ZERO : value;
        } finally {
            em.close();
        }
    }

    public Long countSales() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select count(s) from Sale s", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public List<Sale> findByCustomerId(Long customerId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                            "select s from Sale s left join fetch s.items i left join fetch i.product where s.customer.id = :customerId order by s.saleDate desc",
                            Sale.class)
                    .setParameter("customerId", customerId)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}

