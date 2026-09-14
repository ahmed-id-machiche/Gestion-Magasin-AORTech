package com.magasin.controller.sale;

import com.magasin.model.entity.Customer;
import com.magasin.model.entity.User;
import com.magasin.service.CustomerService;
import com.magasin.service.ProductService;
import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sales/create")
public class SaleCreateServlet extends HttpServlet {
    private final SaleService saleService = new SaleService();
    private final ProductService productService = new ProductService();
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("products", productService.findAll());
        req.setAttribute("customers", customerService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/sales/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("currentUser");
        String customerId = req.getParameter("customerId");
        Customer customer = (customerId == null || customerId.isBlank()) ? null : customerService.findById(Long.parseLong(customerId));

        String[] productIds = req.getParameterValues("productId");
        String[] quantities = req.getParameterValues("quantity");

        List<SaleService.SaleLineRequest> lines = new ArrayList<>();
        if (productIds != null && quantities != null) {
            for (int i = 0; i < productIds.length; i++) {
                if (!productIds[i].isBlank() && !quantities[i].isBlank()) {
                    int qty = Integer.parseInt(quantities[i]);
                    if (qty > 0) {
                        lines.add(new SaleService.SaleLineRequest(Long.parseLong(productIds[i]), qty));
                    }
                }
            }
        }

        try {
            saleService.createSale(user, customer, lines);
            resp.sendRedirect(req.getContextPath() + "/sales?success=created");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            doGet(req, resp);
        }
    }
}

