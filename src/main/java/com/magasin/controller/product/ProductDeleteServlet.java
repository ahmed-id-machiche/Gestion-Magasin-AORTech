package com.magasin.controller.product;

import com.magasin.service.ProductService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/products/delete")
public class ProductDeleteServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            productService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/products?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/products?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

