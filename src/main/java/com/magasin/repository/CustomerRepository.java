package com.magasin.repository;

import com.magasin.model.entity.Customer;
import com.magasin.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class CustomerRepository extends AbstractRepository<Customer> {
    public CustomerRepository() {
        super(Customer.class);
    }

    public List<Customer> findCustomerByKeyword(String keyword) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String query = "%" + keyword.toLowerCase() + "%";
            return em.createQuery("select c from Customer c where lower(c.firstName) like :q or lower(c.lastName) like :q or lower(c.email) like :q", Customer.class)
                    .setParameter("q", query)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public Customer findByEmail(String email) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            List<Customer> customers = em.createQuery("select c from Customer c where lower(c.email) = :email", Customer.class)
                    .setParameter("email", email.toLowerCase())
                    .setMaxResults(1)
                    .getResultList();
            return customers.isEmpty() ? null : customers.get(0);
        } finally {
            em.close();
        }
    }
}

