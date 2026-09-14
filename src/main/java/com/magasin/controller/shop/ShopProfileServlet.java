package com.magasin.controller.shop;

import com.magasin.model.entity.Customer;
import com.magasin.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/profile")
public class ShopProfileServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Customer current = (Customer) req.getSession().getAttribute("shopCustomer");
        Customer db = customerService.findById(current.getId());
        db.setFirstName(req.getParameter("firstName"));
        db.setLastName(req.getParameter("lastName"));
        db.setPhone(req.getParameter("phone"));
        db.setAddress(req.getParameter("address"));
        customerService.update(db);
        req.getSession().setAttribute("shopCustomer", db);
        resp.sendRedirect(req.getContextPath() + "/shop/profile?success=1");
    }
}

