package com.magasin.controller.customer;

import com.magasin.model.entity.Customer;
import com.magasin.service.CustomerService;
import com.magasin.util.ErrorUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/customers/form")
public class CustomerFormServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) req.setAttribute("customer", customerService.findById(Long.parseLong(id)));
        req.getRequestDispatcher("/WEB-INF/views/admin/customers/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String id = req.getParameter("id");
            Customer c = (id == null || id.isBlank()) ? new Customer() : customerService.findById(Long.parseLong(id));
            c.setFirstName(req.getParameter("firstName"));
            c.setLastName(req.getParameter("lastName"));
            c.setPhone(req.getParameter("phone"));
            c.setEmail(req.getParameter("email"));
            c.setAddress(req.getParameter("address"));

            if (c.getId() == null) customerService.save(c); else customerService.update(c);
            resp.sendRedirect(req.getContextPath() + "/customers?success=saved");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/customers?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

