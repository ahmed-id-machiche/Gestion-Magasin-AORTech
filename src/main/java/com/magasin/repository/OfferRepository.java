package com.magasin.repository;

import com.magasin.model.entity.Offer;
import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.Date;
import java.util.List;

public class OfferRepository extends AbstractRepository<Offer> {
    public OfferRepository() {
        super(Offer.class);
    }

    public List<Offer> findActiveOffers() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Date now = new Date();
            return em.createQuery(
                            "select o from Offer o where o.active = true and (o.startDate is null or o.startDate <= :now) and (o.endDate is null or o.endDate >= :now) order by o.id desc",
                            Offer.class)
                    .setParameter("now", now, javax.persistence.TemporalType.DATE)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}

