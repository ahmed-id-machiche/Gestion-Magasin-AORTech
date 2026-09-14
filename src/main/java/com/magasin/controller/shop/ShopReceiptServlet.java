package com.magasin.controller.shop;

import com.magasin.model.entity.Customer;
import com.magasin.model.entity.Sale;
import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/receipt")
public class ShopReceiptServlet extends HttpServlet {
    private final SaleService saleService = new SaleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Sale sale = saleService.findDetails(id);
        Customer customer = (Customer) req.getSession().getAttribute("shopCustomer");
        if (sale == null || sale.getCustomer() == null || !sale.getCustomer().getId().equals(customer.getId())) {
            resp.sendRedirect(req.getContextPath() + "/shop/orders");
            return;
        }
        req.setAttribute("sale", sale);
        req.getRequestDispatcher("/WEB-INF/views/user/receipt.jsp").forward(req, resp);
    }
}

