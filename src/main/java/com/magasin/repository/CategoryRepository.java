package com.magasin.repository;

import com.magasin.model.entity.Category;

public class CategoryRepository extends AbstractRepository<Category> {
    public CategoryRepository() {
        super(Category.class);
    }
}

