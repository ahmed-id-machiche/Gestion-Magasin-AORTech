package com.magasin.controller.shop;

import com.magasin.service.FavoriteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/favorites")
public class FavoriteListServlet extends HttpServlet {
    private final FavoriteService favoriteService = new FavoriteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("favoriteProducts", favoriteService.list(req.getSession()));
        req.getRequestDispatcher("/WEB-INF/views/user/favorites.jsp").forward(req, resp);
    }
}

