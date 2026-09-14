package com.magasin.service;

import com.magasin.model.entity.Product;
import com.magasin.repository.ProductRepository;

import java.util.Date;
import java.util.List;

public class ProductService {
    private final ProductRepository productRepository = new ProductRepository();

    public List<Product> findAll() { return productRepository.findAll(); }
    public Product findById(Long id) { return productRepository.findById(id); }
    public void delete(Long id) { productRepository.delete(id); }
    public List<Product> findLowStockProducts() { return productRepository.findLowStockProducts(); }

    public Product save(Product product) {
        if (product.getCreatedAt() == null) {
            product.setCreatedAt(new Date());
        }
        return productRepository.save(product);
    }

    public Product update(Product product) {
        return productRepository.update(product);
    }

    public List<Product> searchByName(String keyword) {
        return (keyword == null || keyword.isBlank()) ? findAll() : productRepository.findProductByName(keyword);
    }

    public List<Product> findByCategory(Long categoryId) {
        return categoryId == null ? findAll() : productRepository.findProductsByCategory(categoryId);
    }
}

