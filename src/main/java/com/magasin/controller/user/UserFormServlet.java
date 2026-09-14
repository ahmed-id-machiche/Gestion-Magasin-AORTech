package com.magasin.controller.user;

import com.magasin.model.entity.User;
import com.magasin.model.enums.Role;
import com.magasin.service.UserService;
import com.magasin.util.ErrorUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/users/form")
public class UserFormServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) req.setAttribute("user", userService.findById(Long.parseLong(id)));
        req.setAttribute("roles", Role.values());
        req.getRequestDispatcher("/WEB-INF/views/admin/users/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String id = req.getParameter("id");
            String password = req.getParameter("password");

            if (id == null || id.isBlank()) {
                User user = new User();
                user.setUsername(req.getParameter("username"));
                user.setFullname(req.getParameter("fullname"));
                user.setRole(Role.valueOf(req.getParameter("role")));
                userService.create(user, password);
            } else {
                User user = userService.findById(Long.parseLong(id));
                user.setUsername(req.getParameter("username"));
                user.setFullname(req.getParameter("fullname"));
                user.setRole(Role.valueOf(req.getParameter("role")));
                userService.update(user, password);
            }
            resp.sendRedirect(req.getContextPath() + "/users?success=saved");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/users?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

