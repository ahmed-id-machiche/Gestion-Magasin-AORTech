package com.magasin.filter;

import com.magasin.model.entity.User;
import com.magasin.model.enums.Role;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/users/*", "/offers/*"})
public class RoleFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {
        // no-op
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("currentUser");

        if (user == null || user.getRole() != Role.ADMIN) {
            resp.sendRedirect(req.getContextPath() + "/dashboard?error=access_denied");
            return;
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // no-op
    }
}

