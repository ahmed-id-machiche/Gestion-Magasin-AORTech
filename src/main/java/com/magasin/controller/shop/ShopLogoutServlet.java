package com.magasin.controller.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/logout")
public class ShopLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (req.getSession(false) != null) {
            req.getSession().removeAttribute("shopCustomer");
            req.getSession().removeAttribute("shopCart");
        }
        resp.sendRedirect(req.getContextPath() + "/shop");
    }
}

