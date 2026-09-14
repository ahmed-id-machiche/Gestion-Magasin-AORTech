package com.magasin.controller.shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/shop/marques", "/shop/services"})
public class ShopMarquesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("pageTitle", "Nos Marques");
        req.getRequestDispatcher("/WEB-INF/views/user/marques.jsp").forward(req, resp);
    }
}
