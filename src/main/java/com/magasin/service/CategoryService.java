package com.magasin.service;

import com.magasin.model.entity.Category;
import com.magasin.repository.CategoryRepository;

import java.util.List;

public class CategoryService {
    private final CategoryRepository categoryRepository = new CategoryRepository();

    public List<Category> findAll() { return categoryRepository.findAll(); }
    public Category findById(Long id) { return categoryRepository.findById(id); }
    public Category save(Category category) { return categoryRepository.save(category); }
    public Category update(Category category) { return categoryRepository.update(category); }
    public void delete(Long id) { categoryRepository.delete(id); }
}

