package com.magasin.controller.shop;

import com.magasin.model.entity.Customer;
import com.magasin.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/login")
public class ShopLoginServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    private String resolveNext(HttpServletRequest req) {
        String next = req.getParameter("next");
        if (next == null || next.isBlank() || !next.startsWith("/")) {
            return req.getContextPath() + "/shop";
        }
        return req.getContextPath() + next;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("next", req.getParameter("next"));
        req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Customer customer = customerService.authenticate(req.getParameter("email"), req.getParameter("password"));
        if (customer == null) {
            req.setAttribute("error", "Email ou mot de passe invalide.");
            req.setAttribute("next", req.getParameter("next"));
            doGet(req, resp);
            return;
        }
        req.getSession().setAttribute("shopCustomer", customer);
        resp.sendRedirect(resolveNext(req));
    }
}

