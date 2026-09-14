<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<style>
  /* Product Cards Uniform Sizing & Layout */
  .product-card {
    display: flex;
    flex-direction: column;
    height: 100%;
    transition: transform 0.35s ease, box-shadow 0.35s ease;
    border-radius: 1.25rem !important;
    background: #ffffff;
  }

  .product-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 20px 40px rgba(15, 23, 42, 0.15) !important;
  }

  .product-image-wrap {
    position: relative;
    width: 100%;
    height: 220px;
    overflow: hidden;
    background-color: #f8fafc;
  }

  .product-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
    transition: transform 0.4s ease;
  }

  .product-card:hover .product-image {
    transform: scale(1.08);
  }

  .product-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(to top, rgba(15, 23, 42, 0.25), transparent 60%);
    opacity: 0;
    transition: opacity 0.35s ease;
  }

  .product-card:hover .product-overlay {
    opacity: 1;
  }

  .product-title {
    font-size: 1.15rem;
    font-weight: 700;
    color: #0f172a;
    min-height: 2.6rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    margin-bottom: 0.4rem;
  }

  .product-description {
    font-size: 0.875rem;
    color: #64748b;
    min-height: 2.6rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  .price-tag {
    font-size: 1.25rem;
    font-weight: 800;
    color: #0d6efd;
  }

  .stock-text {
    font-size: 0.8rem;
    font-weight: 600;
    color: #64748b;
  }
</style>
  <div class="favorites-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="favorites-kicker mb-2">Liste personnalisée</p>
        <h2 class="favorites-title mb-2">Mes Favoris</h2>
        <p class="favorites-subtitle mb-0">
          Retrouve ici les produits que tu as sauvegardés pour les acheter plus tard.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="favorites-badge-box d-inline-block">
          <span class="favorites-badge-label">Produits sauvegardés</span>
          <span class="favorites-badge-value">${favoriteProducts.size()}</span>
        </div>
      </div>
    </div>
  </div>

  <div class="row g-4">
    <c:forEach items="${favoriteProducts}" var="p">
      <div class="col-md-6 col-xl-4">
        <div class="card favorite-card h-100 border-0 shadow-lg rounded-4 overflow-hidden">
          <div class="favorite-image-wrap">
            <img
              src="${empty p.imageUrl ? 'https://placehold.co/600x400?text=Produit' : p.imageUrl}"
              class="card-img-top favorite-image"
              alt="${p.name}"
            >
            <div class="favorite-overlay"></div>
          </div>

          <div class="card-body d-flex flex-column p-4">
            <div class="mb-3">
              <h5 class="favorite-product-title mb-2">${p.name}</h5>
              <p class="favorite-product-description mb-0">${p.description}</p>
            </div>

            <div class="mt-auto mb-3">
              <span class="favorite-price-tag fw-bold fs-4 text-primary">${p.salePrice} MAD</span>
            </div>

            <div class="d-flex gap-2 flex-column flex-sm-row">
              <form method="post" action="${pageContext.request.contextPath}/favorites/toggle" class="flex-fill">
                <input type="hidden" name="productId" value="${p.id}">
                <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/favorites">
                <button class="btn remove-favorite-btn w-100" type="submit">Retirer</button>
              </form>

              <form method="post" action="${pageContext.request.contextPath}/cart" class="flex-fill">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="productId" value="${p.id}">
                <input type="hidden" name="quantity" value="1">
                <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/favorites">
                <button class="btn add-cart-btn w-100" type="submit">Au panier</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>

    <c:if test="${empty favoriteProducts}">
      <div class="col-12">
        <div class="alert alert-info empty-favorites-state border-0 shadow-sm rounded-4">
          Aucun produit en favoris pour le moment.
        </div>
      </div>
    </c:if>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







