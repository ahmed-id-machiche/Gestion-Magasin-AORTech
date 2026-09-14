package com.magasin.controller.supplier;

import com.magasin.service.SupplierService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/suppliers")
public class SupplierListServlet extends HttpServlet {
    private final SupplierService supplierService = new SupplierService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("suppliers", supplierService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/suppliers/list.jsp").forward(req, resp);
    }
}

