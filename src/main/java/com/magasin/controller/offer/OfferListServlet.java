package com.magasin.controller.offer;

import com.magasin.service.OfferService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/offers")
public class OfferListServlet extends HttpServlet {
    private final OfferService offerService = new OfferService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("offers", offerService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/offers/list.jsp").forward(req, resp);
    }
}

