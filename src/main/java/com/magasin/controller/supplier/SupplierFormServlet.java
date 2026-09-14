package com.magasin.controller.supplier;

import com.magasin.model.entity.Supplier;
import com.magasin.service.SupplierService;
import com.magasin.util.ErrorUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/suppliers/form")
public class SupplierFormServlet extends HttpServlet {
    private final SupplierService supplierService = new SupplierService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) req.setAttribute("supplier", supplierService.findById(Long.parseLong(id)));
        req.getRequestDispatcher("/WEB-INF/views/admin/suppliers/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String id = req.getParameter("id");
            Supplier s = (id == null || id.isBlank()) ? new Supplier() : supplierService.findById(Long.parseLong(id));
            s.setName(req.getParameter("name"));
            s.setPhone(req.getParameter("phone"));
            s.setEmail(req.getParameter("email"));
            s.setAddress(req.getParameter("address"));

            if (s.getId() == null) supplierService.save(s); else supplierService.update(s);
            resp.sendRedirect(req.getContextPath() + "/suppliers?success=saved");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/suppliers?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

