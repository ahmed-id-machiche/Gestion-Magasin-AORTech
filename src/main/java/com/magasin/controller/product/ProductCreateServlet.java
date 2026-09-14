package com.magasin.controller.product;

import com.magasin.model.entity.Product;
import com.magasin.service.CategoryService;
import com.magasin.service.ProductService;
import com.magasin.service.SupplierService;
import com.magasin.util.ErrorUtil;
import com.magasin.util.ImageUploadUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/products/create")
@MultipartConfig
public class ProductCreateServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();
    private final SupplierService supplierService = new SupplierService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories", categoryService.findAll());
        req.setAttribute("suppliers", supplierService.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/products/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            Product product = new Product();
            product.setName(req.getParameter("name"));
            product.setReference(req.getParameter("reference"));
            product.setDescription(req.getParameter("description"));

            String imageUrl = req.getParameter("imageUrl");
            String localImagePath = req.getParameter("localImagePath");
            String uploadedImageUrl = ImageUploadUtil.saveProductImage(
                    req.getPart("imageFile"),
                    getServletContext().getRealPath("/"),
                    req.getContextPath()
            );
            String localPathImageUrl = ImageUploadUtil.saveProductImageFromLocalPath(
                    localImagePath,
                    getServletContext().getRealPath("/"),
                    req.getContextPath()
            );
            if (uploadedImageUrl != null && !uploadedImageUrl.isBlank()) {
                product.setImageUrl(uploadedImageUrl);
            } else if (localPathImageUrl != null && !localPathImageUrl.isBlank()) {
                product.setImageUrl(localPathImageUrl);
            } else {
                product.setImageUrl(ImageUploadUtil.normalizeImageInput(
                        imageUrl,
                        getServletContext().getRealPath("/"),
                        req.getContextPath()
                ));
            }

            product.setPurchasePrice(new BigDecimal(req.getParameter("purchasePrice")));
            product.setSalePrice(new BigDecimal(req.getParameter("salePrice")));
            product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            product.setMinStock(Integer.parseInt(req.getParameter("minStock")));
            product.setCategory(categoryService.findById(Long.parseLong(req.getParameter("categoryId"))));
            product.setSupplier(supplierService.findById(Long.parseLong(req.getParameter("supplierId"))));

            productService.save(product);
            resp.sendRedirect(req.getContextPath() + "/products?success=created");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/products?error=" + ErrorUtil.encode(ErrorUtil.toUserMessage(e)));
        }
    }
}

