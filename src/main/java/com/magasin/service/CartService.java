package com.magasin.service;

import com.magasin.model.dto.CartItem;
import com.magasin.model.entity.Product;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

public class CartService {
    public static final String CART_SESSION_KEY = "shopCart";
    private final ProductService productService = new ProductService();

    @SuppressWarnings("unchecked")
    public Map<Long, CartItem> getCart(HttpSession session) {
        Object value = session.getAttribute(CART_SESSION_KEY);
        if (value == null) {
            Map<Long, CartItem> cart = new LinkedHashMap<>();
            session.setAttribute(CART_SESSION_KEY, cart);
            return cart;
        }
        return (Map<Long, CartItem>) value;
    }

    public void addToCart(HttpSession session, Long productId, int quantity) {
        Product product = productService.findById(productId);
        if (product == null) throw new IllegalArgumentException("Produit introuvable");
        if (quantity <= 0) throw new IllegalArgumentException("Quantite invalide");

        Map<Long, CartItem> cart = getCart(session);
        CartItem item = cart.get(productId);
        int newQty = (item == null ? 0 : item.getQuantity()) + quantity;
        if (newQty > product.getQuantity()) throw new IllegalStateException("Stock insuffisant pour " + product.getName());

        if (item == null) {
            cart.put(productId, new CartItem(product.getId(), product.getName(), product.getSalePrice(), quantity));
        } else {
            item.setQuantity(newQty);
        }
    }

    public void updateQuantity(HttpSession session, Long productId, int quantity) {
        Map<Long, CartItem> cart = getCart(session);
        if (quantity <= 0) {
            cart.remove(productId);
            return;
        }
        Product product = productService.findById(productId);
        if (product == null) throw new IllegalArgumentException("Produit introuvable");
        if (quantity > product.getQuantity()) throw new IllegalStateException("Stock insuffisant pour " + product.getName());
        CartItem item = cart.get(productId);
        if (item != null) item.setQuantity(quantity);
    }

    public void removeItem(HttpSession session, Long productId) {
        getCart(session).remove(productId);
    }

    public List<CartItem> items(HttpSession session) {
        return new ArrayList<>(getCart(session).values());
    }

    public BigDecimal total(HttpSession session) {
        return items(session).stream().map(CartItem::getSubtotal).reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public int countItems(HttpSession session) {
        return items(session).stream().mapToInt(CartItem::getQuantity).sum();
    }

    public void clear(HttpSession session) {
        session.removeAttribute(CART_SESSION_KEY);
    }
}

