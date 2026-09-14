package com.magasin.controller.shop;

import com.magasin.model.entity.Customer;
import com.magasin.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/register")
public class ShopRegisterServlet extends HttpServlet {
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
        req.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Customer customer = new Customer();
        customer.setFirstName(req.getParameter("firstName"));
        customer.setLastName(req.getParameter("lastName"));
        customer.setEmail(req.getParameter("email"));
        customer.setPhone(req.getParameter("phone"));
        customer.setAddress(req.getParameter("address"));
        String password = req.getParameter("password");

        try {
            Customer created = customerService.register(customer, password);
            req.getSession().setAttribute("shopCustomer", created);
            resp.sendRedirect(resolveNext(req));
        } catch (Exception ex) {
            req.setAttribute("error", ex.getMessage());
            req.setAttribute("next", req.getParameter("next"));
            doGet(req, resp);
        }
    }
}

