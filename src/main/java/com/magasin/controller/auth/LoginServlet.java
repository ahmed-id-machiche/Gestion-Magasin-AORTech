package com.magasin.controller.auth;

import com.magasin.model.entity.User;
import com.magasin.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.authenticate(username, password);

        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("currentUser", user);
            resp.sendRedirect(req.getContextPath() + "/dashboard");
            return;
        }

        req.setAttribute("error", "Identifiants invalides.");
        req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
    }
}

