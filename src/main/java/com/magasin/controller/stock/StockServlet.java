package com.magasin.controller.stock;

import com.magasin.service.ProductService;
import com.magasin.service.StockService;
import com.magasin.util.ErrorUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/stock")
public class StockServlet extends HttpServlet {
    private final StockService stockService = new StockService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("movements", stockService.findAllMovements());
        req.setAttribute("products", productService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/stock/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Long productId = Long.parseLong(req.getParameter("productId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String type = req.getParameter("type");
            String note = req.getParameter("note");

            if ("ENTREE".equals(type)) {
                stockService.stockIn(productId, quantity, note);
            } else {
                stockService.stockOut(productId, quantity, note);
            }
            resp.sendRedirect(req.getContextPath() + "/stock?success=saved");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/stock?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

