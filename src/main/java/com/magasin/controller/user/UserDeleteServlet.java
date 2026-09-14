package com.magasin.controller.user;

import com.magasin.service.UserService;
import com.magasin.util.ErrorUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/users/delete")
public class UserDeleteServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            userService.delete(Long.parseLong(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/users?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/users?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

