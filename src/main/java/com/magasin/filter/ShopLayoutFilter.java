package com.magasin.filter;

import com.magasin.service.CartService;
import com.magasin.service.FavoriteService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = {"/shop", "/shop/*", "/cart", "/checkout", "/favorites", "/favorites/*"})
public class ShopLayoutFilter implements Filter {
    private final CartService cartService = new CartService();
    private final FavoriteService favoriteService = new FavoriteService();

    @Override
    public void init(FilterConfig filterConfig) {
        // no-op
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (request instanceof HttpServletRequest) {
            HttpServletRequest req = (HttpServletRequest) request;
            request.setAttribute("cartCount", cartService.countItems(req.getSession()));
            request.setAttribute("favoritesCount", favoriteService.count(req.getSession()));
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // no-op
    }
}

