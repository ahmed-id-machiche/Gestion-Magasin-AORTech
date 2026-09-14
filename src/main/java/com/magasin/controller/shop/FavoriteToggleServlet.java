package com.magasin.controller.shop;

import com.magasin.service.FavoriteService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/favorites/toggle")
public class FavoriteToggleServlet extends HttpServlet {
    private final FavoriteService favoriteService = new FavoriteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productIdParam = req.getParameter("productId");
        String redirect = req.getParameter("redirect");
        if (redirect == null || redirect.isBlank()) {
            redirect = req.getContextPath() + "/shop";
        }

        if (productIdParam != null && !productIdParam.isBlank()) {
            try {
                Long productId = Long.parseLong(productIdParam);
                if (favoriteService.contains(req.getSession(), productId)) {
                    favoriteService.remove(req.getSession(), productId);
                } else {
                    favoriteService.add(req.getSession(), productId);
                }
            } catch (NumberFormatException ignored) {}
        }

        resp.sendRedirect(redirect);
    }
}

