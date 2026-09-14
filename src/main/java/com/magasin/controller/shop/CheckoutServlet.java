package com.magasin.controller.shop;

import com.magasin.model.dto.CartItem;
import com.magasin.model.entity.Customer;
import com.magasin.model.entity.Sale;
import com.magasin.service.CartService;
import com.magasin.service.CustomerService;
import com.magasin.service.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private final CartService cartService = new CartService();
    private final SaleService saleService = new SaleService();
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = (Customer) req.getSession().getAttribute("shopCustomer");
        Customer db = customerService.findById(customer.getId());
        req.getSession().setAttribute("shopCustomer", db);

        req.setAttribute("cartItems", cartService.items(req.getSession()));
        req.setAttribute("cartTotal", cartService.total(req.getSession()));
        req.setAttribute("cartCount", cartService.countItems(req.getSession()));
        req.getRequestDispatcher("/WEB-INF/views/user/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<CartItem> items = cartService.items(req.getSession());
        if (items.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/shop");
            return;
        }

        Customer customer = (Customer) req.getSession().getAttribute("shopCustomer");
        customer = customerService.findById(customer.getId());
        customer.setPhone(req.getParameter("phone"));
        customer.setAddress(req.getParameter("address"));
        customerService.update(customer);
        req.getSession().setAttribute("shopCustomer", customer);

        try {
            List<SaleService.SaleLineRequest> lines = items.stream()
                    .map(i -> new SaleService.SaleLineRequest(i.getProductId(), i.getQuantity()))
                    .collect(Collectors.toList());

            Sale sale = saleService.createSaleForCustomer(customer, lines);
            cartService.clear(req.getSession());
            resp.sendRedirect(req.getContextPath() + "/shop/receipt?id=" + sale.getId());
        } catch (Exception ex) {
            req.setAttribute("error", ex.getMessage());
            doGet(req, resp);
        }
    }
}

