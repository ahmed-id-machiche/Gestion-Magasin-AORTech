package com.magasin.controller.category;

import com.magasin.model.entity.Category;
import com.magasin.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/categories")
public class CategoryListServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories", categoryService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/categories/list.jsp").forward(req, resp);
    }
}

