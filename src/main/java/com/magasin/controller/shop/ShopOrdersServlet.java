package com.magasin.controller.shop;

import com.magasin.model.entity.Customer;
import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/orders")
public class ShopOrdersServlet extends HttpServlet {
    private final SaleService saleService = new SaleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = (Customer) req.getSession().getAttribute("shopCustomer");
        req.setAttribute("orders", saleService.findByCustomer(customer.getId()));
        req.getRequestDispatcher("/WEB-INF/views/user/orders.jsp").forward(req, resp);
    }
}

