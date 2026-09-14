package com.magasin.service;

import com.magasin.model.entity.Product;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class FavoriteService {
    public static final String FAVORITES_SESSION_KEY = "shopFavorites";
    private final ProductService productService = new ProductService();

    @SuppressWarnings("unchecked")
    private Set<Long> getIds(HttpSession session) {
        Object value = session.getAttribute(FAVORITES_SESSION_KEY);
        if (value == null) {
            Set<Long> ids = new LinkedHashSet<>();
            session.setAttribute(FAVORITES_SESSION_KEY, ids);
            return ids;
        }
        return (Set<Long>) value;
    }

    public void add(HttpSession session, Long productId) {
        getIds(session).add(productId);
    }

    public void remove(HttpSession session, Long productId) {
        getIds(session).remove(productId);
    }

    public boolean contains(HttpSession session, Long productId) {
        return getIds(session).contains(productId);
    }

    public int count(HttpSession session) {
        return getIds(session).size();
    }

    public List<Product> list(HttpSession session) {
        List<Product> products = new ArrayList<>();
        for (Long id : getIds(session)) {
            Product p = productService.findById(id);
            if (p != null) {
                products.add(p);
            }
        }
        return products;
    }

    public Set<Long> ids(HttpSession session) {
        return new HashSet<>(getIds(session));
    }
}

