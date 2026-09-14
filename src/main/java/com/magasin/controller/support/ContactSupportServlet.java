package com.magasin.controller.support;

import com.magasin.model.entity.SupportMessage;
import com.magasin.service.SupportMessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/contact")
public class ContactSupportServlet extends HttpServlet {
    private final SupportMessageService supportMessageService = new SupportMessageService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/user/contact.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        if (fullName == null || fullName.isBlank() || email == null || email.isBlank() || message == null || message.isBlank()) {
            req.setAttribute("error", "Tous les champs sont obligatoires.");
            doGet(req, resp);
            return;
        }

        SupportMessage supportMessage = new SupportMessage();
        supportMessage.setFullName(fullName);
        supportMessage.setEmail(email);
        supportMessage.setMessage(message);
        supportMessageService.save(supportMessage);

        resp.sendRedirect(req.getContextPath() + "/shop/contact?success=1");
    }
}

