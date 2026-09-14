package com.magasin.controller.category;

import com.magasin.model.entity.Category;
import com.magasin.service.CategoryService;
import com.magasin.util.ErrorUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/categories/form")
public class CategoryCreateServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            req.setAttribute("category", categoryService.findById(Long.parseLong(id)));
        }
        req.getRequestDispatcher("/WEB-INF/views/admin/categories/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String id = req.getParameter("id");
            Category category = (id == null || id.isBlank()) ? new Category() : categoryService.findById(Long.parseLong(id));
            category.setName(req.getParameter("name"));
            category.setDescription(req.getParameter("description"));

            if (category.getId() == null) categoryService.save(category); else categoryService.update(category);
            resp.sendRedirect(req.getContextPath() + "/categories?success=saved");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/categories?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

