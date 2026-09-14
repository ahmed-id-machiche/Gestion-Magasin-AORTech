package com.magasin.controller.user;

import com.magasin.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/users")
public class UserListServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("users", userService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/users/list.jsp").forward(req, resp);
    }
}

