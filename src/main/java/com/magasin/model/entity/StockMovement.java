package com.magasin.model.entity;

import com.magasin.model.enums.MovementType;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "stock_movements")
public class StockMovement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private MovementType type;

    @Column(nullable = false)
    private Integer quantity;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date movementDate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(length = 255)
    private String note;

    @PrePersist
    public void onCreate() {
        if (movementDate == null) {
            movementDate = new Date();
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public MovementType getType() { return type; }
    public void setType(MovementType type) { this.type = type; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public Date getMovementDate() { return movementDate; }
    public void setMovementDate(Date movementDate) { this.movementDate = movementDate; }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
}

