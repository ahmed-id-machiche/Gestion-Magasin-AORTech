package com.magasin.filter;

import com.magasin.model.entity.Customer;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/checkout", "/shop/profile", "/shop/orders", "/shop/receipt", "/shop/contact", "/favorites", "/favorites/*"})
public class ShopAuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {
        // no-op
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        Customer customer = session == null ? null : (Customer) session.getAttribute("shopCustomer");
        if (customer == null) {
            String next = req.getRequestURI().substring(req.getContextPath().length());
            String qs = req.getQueryString();
            if (qs != null && !qs.isBlank()) {
                next += "?" + qs;
            }
            resp.sendRedirect(req.getContextPath() + "/shop/login?next=" + java.net.URLEncoder.encode(next, "UTF-8"));
            return;
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // no-op
    }
}

