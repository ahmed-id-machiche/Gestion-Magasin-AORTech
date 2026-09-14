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
  <c:if test="${param.success == 'added'}">
    <div class="alert alert-success border-0 shadow-sm rounded-4">
      Produit ajouté au panier avec succès.
    </div>
  </c:if>

  <c:if test="${not empty param.error}">
    <div class="alert alert-danger border-0 shadow-sm rounded-4">
      ${param.error}
    </div>
  </c:if>

  <c:if test="${param.success == 'order_confirmed'}">
    <div class="alert alert-success border-0 shadow-sm rounded-4">
      Commande confirmée avec succès.
    </div>
  </c:if>

  <div class="row g-4 mb-4">
    <div class="col-lg-3">
      <div class="card category-card shadow-lg border-0 rounded-4 overflow-hidden">
        <div class="card-header category-header text-white border-0 py-3 px-4">
          <h5 class="mb-0 fw-bold">Catégories</h5>
        </div>

        <div class="list-group list-group-flush category-list">
          <a
            class="list-group-item list-group-item-action category-item ${empty selectedCategoryId ? 'active' : ''}"
            href="${pageContext.request.contextPath}/shop"
          >
            Toutes les catégories
          </a>

          <c:forEach items="${categories}" var="cat">
            <a
              class="list-group-item list-group-item-action category-item ${selectedCategoryId == cat.id.toString() ? 'active' : ''}"
              href="${pageContext.request.contextPath}/shop?categoryId=${cat.id}"
            >
              ${cat.name}
            </a>
          </c:forEach>
        </div>
      </div>
    </div>

    <div class="col-lg-9">
      <c:if test="${not empty selectedBrand}">
        <div class="d-flex align-items-center justify-content-between bg-white p-3 rounded-4 shadow-sm mb-4 border border-primary border-opacity-25">
          <div>
            <span class="text-muted fw-medium">Filtre par marque :</span>
            <span class="fw-bold text-primary fs-5 ms-2">${selectedBrand}</span>
          </div>
          <a href="${pageContext.request.contextPath}/shop" class="btn btn-outline-primary btn-sm rounded-pill px-3 fw-bold">
            <i class="bi bi-x-circle me-1"></i> Réinitialiser le filtre
          </a>
        </div>
      </c:if>

      <div class="search-panel card border-0 shadow-lg rounded-4 mb-4">
        <div class="card-body p-4">
          <form class="row g-3 align-items-center" method="get" action="${pageContext.request.contextPath}/shop">
            <div class="col-md-9">
              <input
                class="form-control search-input"
                name="keyword"
                value="${selectedKeyword}"
                placeholder="Rechercher un produit..."
              >
            </div>
            <div class="col-md-3">
              <button class="btn search-btn w-100">Rechercher</button>
            </div>
          </form>
        </div>
      </div>

      <div class="row g-4">
        <c:forEach items="${products}" var="p">
          <div class="col-md-6 col-xl-4">
            <div class="card product-card h-100 border-0 shadow-lg rounded-4 overflow-hidden">
              <div class="product-image-wrap cursor-pointer" data-bs-toggle="modal" data-bs-target="#productModal${p.id}" style="cursor: pointer;">
                <img
                  src="${empty p.imageUrl ? 'https://placehold.co/600x400?text=Produit' : p.imageUrl}"
                  class="card-img-top product-image"
                  alt="${p.name}"
                >
                <div class="product-overlay d-flex align-items-center justify-content-center">
                  <span class="btn btn-sm btn-light rounded-pill px-3 fw-bold shadow">
                    Voir détails
                  </span>
                </div>
              </div>

              <div class="card-body d-flex flex-column p-4">
                <div class="mb-3">
                  <h5 class="product-title mb-2 cursor-pointer" data-bs-toggle="modal" data-bs-target="#productModal${p.id}" style="cursor: pointer;">${p.name}</h5>
                  <p class="product-description mb-0">${p.description}</p>
                </div>

                <div class="product-meta mt-auto mb-3">
                  <div class="price-tag fw-bold fs-4 text-primary">${p.salePrice} MAD</div>
                  <div class="stock-text mt-1">Stock disponible : ${p.quantity}</div>
                </div>



                <form method="post" action="${pageContext.request.contextPath}/cart" class="d-flex gap-2 align-items-center">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="${p.id}">
                  <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/shop${not empty selectedCategoryId ? '?categoryId='.concat(selectedCategoryId) : ''}">

                  <input
                    type="number"
                    class="form-control quantity-input"
                    min="1"
                    max="${p.quantity}"
                    name="quantity"
                    value="1"
                    required
                  >

                  <button class="btn cart-btn">
                    <i class="bi bi-bag-plus me-1"></i> Ajouter
                  </button>
                </form>
              </div>
            </div>

            <!-- Product Detail Modal -->
            <div class="modal fade" id="productModal${p.id}" tabindex="-1" aria-labelledby="productModalLabel${p.id}" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content rounded-4 border-0 shadow-lg overflow-hidden">
                  <div class="modal-header border-0 bg-dark text-white p-4">
                    <h5 class="modal-title fw-bold text-white mb-0" id="productModalLabel${p.id}">${p.name}</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body p-4">
                    <div class="row g-4 align-items-center">
                      <div class="col-md-6 text-center">
                        <div class="rounded-4 overflow-hidden shadow-sm bg-light" style="max-height: 320px;">
                          <img src="${empty p.imageUrl ? 'https://placehold.co/600x400?text=Produit' : p.imageUrl}" class="img-fluid w-100 h-100" style="max-height: 320px; object-fit: cover;" alt="${p.name}">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="d-flex align-items-center gap-2 mb-3">
                          <c:if test="${p.category != null}">
                            <span class="badge bg-primary rounded-pill px-3 py-2 fw-semibold">${p.category.name}</span>
                          </c:if>
                          <span class="badge bg-secondary rounded-pill px-3 py-2 fw-semibold">Ref: ${p.reference}</span>
                        </div>
                        <h4 class="fw-bold text-dark mb-2">${p.name}</h4>
                        <p class="text-muted mb-3">${p.description}</p>
                        
                        <div class="p-3 bg-light rounded-4 mb-4">
                          <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="text-muted fs-6">Prix:</span>
                            <span class="fs-4 fw-extrabold text-primary">${p.salePrice} MAD</span>
                          </div>
                          <div class="d-flex align-items-center justify-content-between">
                            <span class="text-muted fs-6">Disponibilité:</span>
                            <c:choose>
                              <c:when test="${p.quantity > 0}">
                                <span class="badge bg-success rounded-pill px-3 py-1">En Stock (${p.quantity} unités)</span>
                              </c:when>
                              <c:otherwise>
                                <span class="badge bg-danger rounded-pill px-3 py-1">Rupture de Stock</span>
                              </c:otherwise>
                            </c:choose>
                          </div>
                        </div>

                        <div class="d-flex flex-column gap-2">
                          <form method="post" action="${pageContext.request.contextPath}/cart" class="d-flex gap-2">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="${p.id}">
                            <input type="number" class="form-control quantity-input" min="1" max="${p.quantity}" name="quantity" value="1" required style="width: 80px;">
                            <button class="btn btn-primary rounded-pill flex-grow-1 fw-bold px-4 py-2">
                              Ajouter au Panier
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>

        <c:if test="${empty products}">
          <div class="col-12">
            <div class="alert alert-info empty-state border-0 shadow-sm rounded-4">
              Aucun produit disponible dans cette catégorie.
            </div>
          </div>
        </c:if>
      </div>
    </div>
  </div>

  







