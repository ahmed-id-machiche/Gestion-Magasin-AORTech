package com.magasin.service;

import com.magasin.model.entity.*;
import com.magasin.model.enums.MovementType;
import com.magasin.repository.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SaleService {
    private final SaleRepository saleRepository = new SaleRepository();
    private final ProductRepository productRepository = new ProductRepository();
    private final StockMovementRepository stockMovementRepository = new StockMovementRepository();
    private final CustomerRepository customerRepository = new CustomerRepository();
    private final UserRepository userRepository = new UserRepository();

    public List<Sale> findAll() {
        return saleRepository.findAll();
    }

    public Sale findDetails(Long id) {
        return saleRepository.findWithItems(id);
    }

    public Sale createSale(User user, Customer customer, List<SaleLineRequest> lines) {
        if (lines == null || lines.isEmpty()) {
            throw new IllegalArgumentException("La vente doit contenir au moins un article.");
        }

        Sale sale = new Sale();
        sale.setUser(resolveSaleUser(user));
        sale.setCustomer(customer);
        sale.setSaleDate(new Date());

        List<SaleItem> items = new ArrayList<>();
        BigDecimal total = BigDecimal.ZERO;

        for (SaleLineRequest line : lines) {
            Product product = productRepository.findById(line.getProductId());
            if (product == null) {
                throw new IllegalArgumentException("Produit introuvable: " + line.getProductId());
            }
            if (product.getQuantity() < line.getQuantity()) {
                throw new IllegalStateException("Stock insuffisant pour " + product.getName());
            }

            SaleItem item = new SaleItem();
            item.setSale(sale);
            item.setProduct(product);
            item.setQuantity(line.getQuantity());
            item.setUnitPrice(product.getSalePrice());
            item.setSubtotal(product.getSalePrice().multiply(BigDecimal.valueOf(line.getQuantity())));
            items.add(item);
            total = total.add(item.getSubtotal());

            product.setQuantity(product.getQuantity() - line.getQuantity());
            productRepository.update(product);

            StockMovement movement = new StockMovement();
            movement.setType(MovementType.SORTIE);
            movement.setQuantity(line.getQuantity());
            movement.setProduct(product);
            movement.setMovementDate(new Date());
            movement.setNote("Sortie auto (vente)");
            stockMovementRepository.save(movement);
        }

        sale.setItems(items);
        sale.setTotalAmount(total);
        return saleRepository.save(sale);
    }

    public Sale createPublicSale(String firstName, String lastName, String phone, String email, String address, List<SaleLineRequest> lines) {
        Customer customer = customerRepository.findByEmail(email);
        if (customer == null) {
            customer = new Customer();
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setPhone(phone);
            customer.setEmail(email);
            customer.setAddress(address);
            customerRepository.save(customer);
        } else {
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setPhone(phone);
            customer.setAddress(address);
            customerRepository.update(customer);
        }
        return createSale(null, customer, lines);
    }

    private User resolveSaleUser(User user) {
        if (user != null) {
            return user;
        }
        List<User> users = userRepository.findAll();
        return users.isEmpty() ? null : users.get(0);
    }

    public Sale createSaleForCustomer(Customer customer, List<SaleLineRequest> lines) {
        return createSale(null, customer, lines);
    }

    public List<Sale> findByCustomer(Long customerId) {
        return saleRepository.findByCustomerId(customerId);
    }

    public BigDecimal calculateTotalRevenue() {
        return saleRepository.calculateTotalRevenue();
    }

    public List<Sale> findBetweenDates(Date startDate, Date endDate) {
        return saleRepository.findSalesBetweenDates(startDate, endDate);
    }

    public static class SaleLineRequest {
        private Long productId;
        private int quantity;

        public SaleLineRequest(Long productId, int quantity) {
            this.productId = productId;
            this.quantity = quantity;
        }

        public Long getProductId() { return productId; }
        public int getQuantity() { return quantity; }
    }
}

