package com.magasin.controller.customer;

import com.magasin.service.CustomerService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/customers/delete")
public class CustomerDeleteServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            customerService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/customers?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/customers?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

