package com.magasin.controller.shop;

import com.magasin.service.OfferService;
import com.magasin.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/offers")
public class ShopOffersServlet extends HttpServlet {
    private final OfferService offerService = new OfferService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("offers", offerService.findActiveOffers());
        req.setAttribute("products", productService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/user/offers.jsp").forward(req, resp);
    }
}

