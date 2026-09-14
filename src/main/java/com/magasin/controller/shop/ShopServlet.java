package com.magasin.controller.shop;

import com.magasin.service.CartService;
import com.magasin.service.CategoryService;
import com.magasin.service.FavoriteService;
import com.magasin.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();
    private final CartService cartService = new CartService();
    private final FavoriteService favoriteService = new FavoriteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String brand = req.getParameter("brand");
        String categoryId = req.getParameter("categoryId");

        if (brand != null && !brand.isBlank()) {
            req.setAttribute("products", productService.searchByName(brand));
            req.setAttribute("selectedBrand", brand);
        } else if (categoryId != null && !categoryId.isBlank()) {
            req.setAttribute("products", productService.findByCategory(Long.parseLong(categoryId)));
            req.setAttribute("selectedCategoryId", categoryId);
        } else if (keyword != null && !keyword.isBlank()) {
            req.setAttribute("products", productService.searchByName(keyword));
            req.setAttribute("selectedKeyword", keyword);
        } else {
            req.setAttribute("products", productService.findAll());
        }

        req.setAttribute("categories", categoryService.findAll());
        req.setAttribute("cartCount", cartService.countItems(req.getSession()));
        req.setAttribute("favoriteIds", favoriteService.ids(req.getSession()));
        req.getRequestDispatcher("/WEB-INF/views/user/index.jsp").forward(req, resp);
    }
}
