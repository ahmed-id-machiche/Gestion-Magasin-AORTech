package com.magasin.repository;

import com.magasin.model.entity.StockMovement;
import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class StockMovementRepository extends AbstractRepository<StockMovement> {
    public StockMovementRepository() {
        super(StockMovement.class);
    }

    @Override
    public List<StockMovement> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("select m from StockMovement m left join fetch m.product order by m.movementDate desc", StockMovement.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}

