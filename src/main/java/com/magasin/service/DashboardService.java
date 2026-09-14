package com.magasin.service;

import com.magasin.repository.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class DashboardService {
    private final ProductRepository productRepository = new ProductRepository();
    private final CategoryRepository categoryRepository = new CategoryRepository();
    private final CustomerRepository customerRepository = new CustomerRepository();
    private final SupplierRepository supplierRepository = new SupplierRepository();
    private final SaleRepository saleRepository = new SaleRepository();

    public Map<String, Object> loadStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalProducts", productRepository.findAll().size());
        stats.put("totalCategories", categoryRepository.findAll().size());
        stats.put("totalCustomers", customerRepository.findAll().size());
        stats.put("totalSuppliers", supplierRepository.findAll().size());
        stats.put("lowStockCount", productRepository.findLowStockProducts().size());
        stats.put("salesCount", saleRepository.countSales());
        stats.put("totalRevenue", saleRepository.calculateTotalRevenue() == null ? BigDecimal.ZERO : saleRepository.calculateTotalRevenue());
        return stats;
    }
}

