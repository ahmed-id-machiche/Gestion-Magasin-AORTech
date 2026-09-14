package com.magasin.controller.supplier;

import com.magasin.service.SupplierService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/suppliers/delete")
public class SupplierDeleteServlet extends HttpServlet {
    private final SupplierService supplierService = new SupplierService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            supplierService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/suppliers?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/suppliers?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

