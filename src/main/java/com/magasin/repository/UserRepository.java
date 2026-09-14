package com.magasin.repository;

import com.magasin.model.entity.User;

import com.magasin.util.JPAUtil;
import javax.persistence.EntityManager;
import java.util.List;

public class UserRepository extends AbstractRepository<User> {
    public UserRepository() {
        super(User.class);
    }

    public User findByUsername(String username) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            List<User> users = em.createQuery("select u from User u where u.username = :username", User.class)
                    .setParameter("username", username)
                    .setMaxResults(1)
                    .getResultList();
            return users.isEmpty() ? null : users.get(0);
        } finally {
            em.close();
        }
    }
}

