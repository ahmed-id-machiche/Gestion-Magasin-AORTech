package com.magasin.service;

import com.magasin.model.entity.Supplier;
import com.magasin.repository.SupplierRepository;

import java.util.List;

public class SupplierService {
    private final SupplierRepository supplierRepository = new SupplierRepository();

    public List<Supplier> findAll() { return supplierRepository.findAll(); }
    public Supplier findById(Long id) { return supplierRepository.findById(id); }
    public Supplier save(Supplier supplier) { return supplierRepository.save(supplier); }
    public Supplier update(Supplier supplier) { return supplierRepository.update(supplier); }
    public void delete(Long id) { supplierRepository.delete(id); }
}

