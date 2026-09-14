package com.magasin.repository;

import com.magasin.model.entity.Supplier;

public class SupplierRepository extends AbstractRepository<Supplier> {
    public SupplierRepository() {
        super(Supplier.class);
    }
}

