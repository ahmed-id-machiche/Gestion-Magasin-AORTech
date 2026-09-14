package com.magasin.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "sale_items")
public class SaleItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal unitPrice;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal subtotal;

    @ManyToOne(optional = false)
    @JoinColumn(name = "sale_id")
    private Sale sale;

    @ManyToOne(optional = false)
    @JoinColumn(name = "product_id")
    private Product product;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public BigDecimal getUnitPrice() { return unitPrice; }
    public void setUnitPrice(BigDecimal unitPrice) { this.unitPrice = unitPrice; }
    public BigDecimal getSubtotal() { return subtotal; }
    public void setSubtotal(BigDecimal subtotal) { this.subtotal = subtotal; }
    public Sale getSale() { return sale; }
    public void setSale(Sale sale) { this.sale = sale; }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
}

