package com.magasin.controller.sale;

import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/sales")
public class SaleListServlet extends HttpServlet {
    private final SaleService saleService = new SaleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sales", saleService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/sales/list.jsp").forward(req, resp);
    }
}

