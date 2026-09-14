<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="includes/header.jsp" %>

<style>
  /* Offer Cards Uniform Sizing & Layout */
  .offer-card {
    display: flex;
    flex-direction: column;
    height: 100%;
    transition: transform 0.35s ease, box-shadow 0.35s ease;
    border-radius: 1.25rem !important;
    background: #ffffff;
  }

  .offer-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 20px 40px rgba(15, 23, 42, 0.15) !important;
  }

  .offer-image-wrap {
    position: relative;
    width: 100%;
    height: 220px;
    overflow: hidden;
    background-color: #f8fafc;
  }

  .offer-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
    transition: transform 0.4s ease;
  }

  .offer-card:hover .offer-image {
    transform: scale(1.08);
  }

  .offer-title {
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

  .offer-description {
    font-size: 0.875rem;
    color: #64748b;
    min-height: 2.6rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  .offer-badge {
    position: absolute;
    top: 14px;
    right: 14px;
    z-index: 10;
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: #ffffff;
    font-size: 0.95rem;
    font-weight: 800;
    padding: 0.35rem 0.85rem;
    border-radius: 999px;
    box-shadow: 0 8px 18px rgba(239, 68, 68, 0.45);
    letter-spacing: 0.5px;
    border: 1.5px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(4px);
    transform: rotate(2deg);
    transition: transform 0.3s ease;
  }

  .offer-card:hover .offer-badge {
    transform: scale(1.12) rotate(0deg);
    box-shadow: 0 10px 22px rgba(239, 68, 68, 0.6);
  }
</style>
  <div class="offers-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="offers-kicker mb-2">Promotions exclusives</p>
        <h2 class="offers-title mb-2">Offres Spéciales</h2>
        <p class="offers-subtitle mb-0">
          Profite des meilleures réductions sur nos produits sélectionnés.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="offers-badge-box d-inline-block">
          <span class="offers-badge-label">Réductions</span>
          <span class="offers-badge-value">HOT</span>
        </div>
      </div>
    </div>
  </div>

  <!-- Special Offer Products Grid -->
  <div class="mt-4">
    <div class="row g-4">
      <c:forEach items="${products}" var="p">
        <div class="col-md-6 col-xl-4">
          <div class="card h-100 border border-danger border-2 shadow-sm rounded-4 p-3 bg-white d-flex flex-column">
            
            <!-- Offre Spéciale Header -->
            <div class="mb-2">
              <h5 class="fw-bold text-dark fs-5 mb-0">Offre Spéciale</h5>
            </div>

            <!-- Product Image -->
            <div class="text-center my-3 cursor-pointer" data-bs-toggle="modal" data-bs-target="#productModal${p.id}" style="cursor: pointer;">
              <img src="${empty p.imageUrl ? 'https://placehold.co/600x400?text=Produit' : p.imageUrl}" class="img-fluid rounded-3" style="max-height: 200px; object-fit: contain;" alt="${p.name}">
            </div>

            <!-- Card Body -->
            <div class="d-flex flex-column flex-grow-1">
              <h6 class="product-title text-center fw-bold text-primary fs-5 mb-3 cursor-pointer" data-bs-toggle="modal" data-bs-target="#productModal${p.id}" style="cursor: pointer;">${p.name}</h6>

              <!-- Price Section (Red Discount Price + Crossed Out Original Price) -->
              <div class="text-center mt-auto mb-3">
                <span class="fs-2 fw-extrabold text-danger me-2"><fmt:formatNumber value="${p.salePrice}" pattern="#,##0.0"/> MAD</span>
                <del class="text-muted fs-5 text-decoration-line-through"><fmt:formatNumber value="${p.originalPrice}" pattern="#,##0.0"/> MAD</del>
              </div>

              <!-- Stock Availability Bar -->
              <div class="stock-block mb-3">
                <div class="d-flex justify-content-between text-secondary small fw-bold mb-1">
                  <span>Already Sold: <span class="text-dark">0</span></span>
                  <span>Available: <span class="text-dark">${p.quantity}</span></span>
                </div>
                <div class="progress rounded-pill" style="height: 10px; background-color: #e9ecef;">
                  <div class="progress-bar bg-secondary rounded-pill" role="progressbar" style="width: 15%;" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <!-- Actions -->
              <div class="pt-2">
                <form method="post" action="${pageContext.request.contextPath}/cart">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="${p.id}">
                  <input type="hidden" name="quantity" value="1">
                  <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/shop/offers">
                  <button class="btn btn-primary rounded-pill w-100 fw-bold py-2 shadow-sm">
                    <i class="bi bi-bag-plus me-1"></i> Ajouter au panier
                  </button>
                </form>
              </div>
            </div>

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
                    <div class="position-relative rounded-4 overflow-hidden shadow-sm bg-light p-3">
                      <img src="${empty p.imageUrl ? 'https://placehold.co/600x400?text=Produit' : p.imageUrl}" class="img-fluid rounded-3" style="max-height: 260px; object-fit: contain;" alt="${p.name}">
                      <div class="offer-badge">-20%</div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <span class="badge bg-danger rounded-pill px-3 py-2 fw-bold mb-2">Offre Spéciale -20%</span>
                    <h4 class="fw-bold text-dark mb-2">${p.name}</h4>
                    <p class="text-muted mb-3">${p.description}</p>
                    
                    <div class="d-flex align-items-baseline gap-3 mb-3">
                      <span class="fs-2 fw-extrabold text-danger"><fmt:formatNumber value="${p.salePrice}" pattern="#,##0.0"/> MAD</span>
                      <del class="text-muted fs-5 text-decoration-line-through"><fmt:formatNumber value="${p.originalPrice}" pattern="#,##0.0"/> MAD</del>
                    </div>

                    <div class="p-3 bg-light rounded-4 mb-4">
                      <div class="d-flex justify-content-between text-muted small fw-semibold mb-1">
                        <span>Already Sold: 0</span>
                        <span>Available: ${p.quantity}</span>
                      </div>
                      <div class="progress rounded-pill" style="height: 8px; background-color: #e2e8f0;">
                        <div class="progress-bar bg-danger rounded-pill" style="width: 25%;"></div>
                      </div>
                    </div>

                    <form method="post" action="${pageContext.request.contextPath}/cart" class="d-flex gap-2">
                      <input type="hidden" name="action" value="add">
                      <input type="hidden" name="productId" value="${p.id}">
                      <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/shop/offers">
                      <input type="number" class="form-control quantity-input" min="1" max="${p.quantity}" name="quantity" value="1" required style="width: 80px;">
                      <button class="btn btn-primary rounded-pill flex-grow-1 fw-bold py-2 shadow-sm">Ajouter au panier</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>







