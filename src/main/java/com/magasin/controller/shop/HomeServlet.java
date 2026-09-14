package com.magasin.controller.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String contextPath = req.getContextPath();
        String uri = req.getRequestURI();
        String path = uri.substring(contextPath.length());

        if (path.isEmpty() || "/".equals(path)) {
            resp.sendRedirect(contextPath + "/shop");
            return;
        }

        RequestDispatcher defaultDispatcher = req.getServletContext().getNamedDispatcher("default");
        if (defaultDispatcher != null) {
            try {
                defaultDispatcher.forward(req, resp);
                return;
            } catch (ServletException e) {
                throw new IOException("Erreur pendant le chargement de la ressource statique.", e);
            }
        }
        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
}

