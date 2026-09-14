package com.magasin.controller.category;

import com.magasin.service.CategoryService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/categories/delete")
public class CategoryDeleteServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            categoryService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/categories?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/categories?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

