package com.magasin.service;

import com.magasin.model.entity.Product;
import com.magasin.model.entity.StockMovement;
import com.magasin.model.enums.MovementType;
import com.magasin.repository.ProductRepository;
import com.magasin.repository.StockMovementRepository;

import java.util.Date;
import java.util.List;

public class StockService {
    private final ProductRepository productRepository = new ProductRepository();
    private final StockMovementRepository stockMovementRepository = new StockMovementRepository();

    public void stockIn(Long productId, int quantity, String note) {
        updateStock(productId, quantity, MovementType.ENTREE, note);
    }

    public void stockOut(Long productId, int quantity, String note) {
        updateStock(productId, quantity, MovementType.SORTIE, note);
    }

    public List<StockMovement> findAllMovements() {
        return stockMovementRepository.findAll();
    }

    private void updateStock(Long productId, int quantity, MovementType type, String note) {
        Product product = productRepository.findById(productId);
        if (product == null) {
            throw new IllegalArgumentException("Produit introuvable.");
        }
        int current = product.getQuantity();
        int newQty = type == MovementType.ENTREE ? current + quantity : current - quantity;
        if (newQty < 0) {
            throw new IllegalStateException("Stock insuffisant.");
        }
        product.setQuantity(newQty);
        productRepository.update(product);

        StockMovement movement = new StockMovement();
        movement.setProduct(product);
        movement.setType(type);
        movement.setQuantity(quantity);
        movement.setMovementDate(new Date());
        movement.setNote(note);
        stockMovementRepository.save(movement);
    }
}

