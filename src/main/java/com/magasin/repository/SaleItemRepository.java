package com.magasin.repository;

import com.magasin.model.entity.SaleItem;

public class SaleItemRepository extends AbstractRepository<SaleItem> {
    public SaleItemRepository() {
        super(SaleItem.class);
    }
}

