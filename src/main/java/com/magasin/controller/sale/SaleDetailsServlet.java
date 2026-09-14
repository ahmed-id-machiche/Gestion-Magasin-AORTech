package com.magasin.controller.sale;

import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/sales/details")
public class SaleDetailsServlet extends HttpServlet {
    private final SaleService saleService = new SaleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        req.setAttribute("sale", saleService.findDetails(id));
        req.getRequestDispatcher("/WEB-INF/views/admin/sales/details.jsp").forward(req, resp);
    }
}

