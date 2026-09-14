package com.magasin.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(nullable = false, unique = true, length = 80)
    private String reference;

    @Column(length = 500)
    private String description;

    @Column(length = 500)
    private String imageUrl;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal purchasePrice;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal salePrice;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false)
    private Integer minStock;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date createdAt;

    @ManyToOne(optional = false)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(optional = false)
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    @OneToMany(mappedBy = "product")
    private List<SaleItem> saleItems = new ArrayList<>();

    @OneToMany(mappedBy = "product")
    private List<StockMovement> stockMovements = new ArrayList<>();

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = new Date();
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getReference() { return reference; }
    public void setReference(String reference) { this.reference = reference; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public BigDecimal getPurchasePrice() { return purchasePrice; }
    public void setPurchasePrice(BigDecimal purchasePrice) { this.purchasePrice = purchasePrice; }
    public BigDecimal getSalePrice() { return salePrice; }
    public void setSalePrice(BigDecimal salePrice) { this.salePrice = salePrice; }
    public BigDecimal getOriginalPrice() {
        if (salePrice == null) return null;
        return salePrice.multiply(new BigDecimal("1.25")).setScale(2, java.math.RoundingMode.HALF_UP);
    }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public Integer getMinStock() { return minStock; }
    public void setMinStock(Integer minStock) { this.minStock = minStock; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
    public Supplier getSupplier() { return supplier; }
    public void setSupplier(Supplier supplier) { this.supplier = supplier; }
    public List<SaleItem> getSaleItems() { return saleItems; }
    public void setSaleItems(List<SaleItem> saleItems) { this.saleItems = saleItems; }
    public List<StockMovement> getStockMovements() { return stockMovements; }
    public void setStockMovements(List<StockMovement> stockMovements) { this.stockMovements = stockMovements; }
}
