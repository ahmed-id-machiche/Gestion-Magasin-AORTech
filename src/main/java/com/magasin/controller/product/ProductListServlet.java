package com.magasin.controller.product;

import com.magasin.service.CategoryService;
import com.magasin.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/products")
public class ProductListServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String categoryId = req.getParameter("categoryId");

        if (categoryId != null && !categoryId.isBlank()) {
            req.setAttribute("products", productService.findByCategory(Long.parseLong(categoryId)));
        } else if (keyword != null && !keyword.isBlank()) {
            req.setAttribute("products", productService.searchByName(keyword));
        } else {
            req.setAttribute("products", productService.findAll());
        }

        req.setAttribute("categories", categoryService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/products/list.jsp").forward(req, resp);
    }
}

