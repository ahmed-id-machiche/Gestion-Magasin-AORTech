package com.magasin.controller.customer;

import com.magasin.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/customers")
public class CustomerListServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customers", customerService.search(req.getParameter("keyword")));
        req.getRequestDispatcher("/WEB-INF/views/admin/customers/list.jsp").forward(req, resp);
    }
}

