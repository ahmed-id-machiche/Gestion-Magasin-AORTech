package com.magasin.service;

import com.magasin.model.entity.Customer;
import com.magasin.repository.CustomerRepository;
import com.magasin.util.PasswordUtil;

import java.util.List;

public class CustomerService {
    private final CustomerRepository customerRepository = new CustomerRepository();

    public List<Customer> findAll() { return customerRepository.findAll(); }
    public Customer findById(Long id) { return customerRepository.findById(id); }
    public Customer save(Customer customer) { return customerRepository.save(customer); }
    public Customer update(Customer customer) { return customerRepository.update(customer); }
    public void delete(Long id) { customerRepository.delete(id); }
    public List<Customer> search(String keyword) {
        return (keyword == null || keyword.isBlank()) ? findAll() : customerRepository.findCustomerByKeyword(keyword);
    }

    public Customer findByEmail(String email) {
        if (email == null || email.isBlank()) return null;
        return customerRepository.findByEmail(email);
    }

    public Customer register(Customer customer, String rawPassword) {
        if (findByEmail(customer.getEmail()) != null) {
            throw new IllegalArgumentException("Email deja utilise.");
        }
        customer.setPassword(PasswordUtil.hash(rawPassword));
        return customerRepository.save(customer);
    }

    public Customer authenticate(String email, String rawPassword) {
        Customer customer = findByEmail(email);
        if (customer != null && customer.getPassword() != null && PasswordUtil.matches(rawPassword, customer.getPassword())) {
            return customer;
        }
        return null;
    }
}

