package com.magasin.controller.offer;

import com.magasin.model.entity.Offer;
import com.magasin.service.OfferService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

@WebServlet("/offers/form")
public class OfferFormServlet extends HttpServlet {
    private final OfferService offerService = new OfferService();
    private final SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null && !id.isBlank()) {
            req.setAttribute("offer", offerService.findById(Long.parseLong(id)));
        }
        req.getRequestDispatcher("/WEB-INF/views/admin/offers/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String id = req.getParameter("id");
            Offer offer = (id == null || id.isBlank()) ? new Offer() : offerService.findById(Long.parseLong(id));
            offer.setTitle(req.getParameter("title"));
            offer.setDescription(req.getParameter("description"));
            String discount = req.getParameter("discountPercent");
            offer.setDiscountPercent((discount == null || discount.isBlank()) ? null : new BigDecimal(discount));
            offer.setImageUrl(req.getParameter("imageUrl"));
            String start = req.getParameter("startDate");
            String end = req.getParameter("endDate");
            offer.setStartDate((start == null || start.isBlank()) ? null : fmt.parse(start));
            offer.setEndDate((end == null || end.isBlank()) ? null : fmt.parse(end));
            offer.setActive(req.getParameter("active") != null);

            if (offer.getId() == null) offerService.save(offer); else offerService.update(offer);
            resp.sendRedirect(req.getContextPath() + "/offers?success=saved");
        } catch (Exception ex) {
            req.setAttribute("error", "Donnees invalides pour l'offre.");
            doGet(req, resp);
        }
    }
}

