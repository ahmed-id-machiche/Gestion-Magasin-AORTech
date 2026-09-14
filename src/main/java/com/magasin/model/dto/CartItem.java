package com.magasin.model.dto;

import java.math.BigDecimal;

public class CartItem {
    private Long productId;
    private String productName;
    private BigDecimal unitPrice;
    private int quantity;

    public CartItem(Long productId, String productName, BigDecimal unitPrice, int quantity) {
        this.productId = productId;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
    }

    public Long getProductId() { return productId; }
    public String getProductName() { return productName; }
    public BigDecimal getUnitPrice() { return unitPrice; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public BigDecimal getSubtotal() { return unitPrice.multiply(BigDecimal.valueOf(quantity)); }
}

