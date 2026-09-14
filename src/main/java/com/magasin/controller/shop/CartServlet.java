package com.magasin.controller.shop;

import com.magasin.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cartItems", cartService.items(req.getSession()));
        req.setAttribute("cartTotal", cartService.total(req.getSession()));
        req.setAttribute("cartCount", cartService.countItems(req.getSession()));
        req.getRequestDispatcher("/WEB-INF/views/user/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        Long productId = Long.parseLong(req.getParameter("productId"));
        String redirect = req.getParameter("redirect");
        if (redirect == null || redirect.isBlank()) {
            redirect = req.getContextPath() + "/cart";
        }

        try {
            int quantity = 1;
            String qStr = req.getParameter("quantity");
            if (qStr != null && !qStr.isBlank()) {
                try {
                    quantity = Math.max(1, Integer.parseInt(qStr));
                } catch (NumberFormatException ignored) {}
            }

            if ("add".equals(action)) {
                cartService.addToCart(req.getSession(), productId, quantity);
                resp.sendRedirect(redirect + (redirect.contains("?") ? "&" : "?") + "success=added");
                return;
            } else if ("update".equals(action)) {
                cartService.updateQuantity(req.getSession(), productId, quantity);
            } else if ("remove".equals(action)) {
                cartService.removeItem(req.getSession(), productId);
            }
            resp.sendRedirect(redirect);
        } catch (Exception ex) {
            resp.sendRedirect(redirect + (redirect.contains("?") ? "&" : "?") + "error=" + java.net.URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
    }
}

