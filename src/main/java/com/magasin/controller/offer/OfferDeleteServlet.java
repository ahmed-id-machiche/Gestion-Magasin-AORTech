package com.magasin.controller.offer;

import com.magasin.service.OfferService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/offers/delete")
public class OfferDeleteServlet extends HttpServlet {
    private final OfferService offerService = new OfferService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            offerService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/offers?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/offers?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

