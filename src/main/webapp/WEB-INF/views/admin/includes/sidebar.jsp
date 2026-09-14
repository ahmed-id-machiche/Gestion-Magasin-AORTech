<div class="col-md-2 sidebar p-0">
    <a href="${pageContext.request.contextPath}/dashboard" class="${pageContext.request.requestURI.endsWith('dashboard.jsp') ? 'active' : ''}">
      <i class="bi bi-speedometer2 me-2 text-primary fs-5"></i> Dashboard
    </a>
    <a href="${pageContext.request.contextPath}/products" class="${pageContext.request.requestURI.contains('products') ? 'active' : ''}">
      <i class="bi bi-box-seam me-2 text-info fs-5"></i> Produits
    </a>
    <a href="${pageContext.request.contextPath}/categories" class="${pageContext.request.requestURI.contains('categories') ? 'active' : ''}">
      <i class="bi bi-tags me-2 text-warning fs-5"></i> Catégories
    </a>
    <a href="${pageContext.request.contextPath}/offers" class="${pageContext.request.requestURI.contains('offers') ? 'active' : ''}">
      <i class="bi bi-percent me-2 text-danger fs-5"></i> Offres
    </a>
    <a href="${pageContext.request.contextPath}/customers" class="${pageContext.request.requestURI.contains('customers') ? 'active' : ''}">
      <i class="bi bi-people me-2 text-success fs-5"></i> Clients
    </a>
    <a href="${pageContext.request.contextPath}/suppliers" class="${pageContext.request.contextPath}/suppliers" class="${pageContext.request.requestURI.contains('suppliers') ? 'active' : ''}">
      <i class="bi bi-truck me-2 text-secondary fs-5"></i> Fournisseurs
    </a>
    <a href="${pageContext.request.contextPath}/sales" class="${pageContext.request.requestURI.contains('sales') ? 'active' : ''}">
      <i class="bi bi-cart-check me-2 text-primary fs-5"></i> Ventes
    </a>
    <a href="${pageContext.request.contextPath}/stock" class="${pageContext.request.requestURI.contains('stock') ? 'active' : ''}">
      <i class="bi bi-boxes me-2 text-warning fs-5"></i> Stock
    </a>
    <c:if test="${sessionScope.currentUser.role.name() == 'ADMIN'}">
        <a href="${pageContext.request.contextPath}/users" class="${pageContext.request.requestURI.contains('users') ? 'active' : ''}">
          <i class="bi bi-person-gear me-2 text-info fs-5"></i> Utilisateurs
        </a>
    </c:if>
</div>
<div class="col-md-10 content">
    <c:if test="${not empty param.success}">
        <div class="alert alert-success alert-dismissible fade show rounded-4 border-0 shadow-sm" role="alert">
            <i class="bi bi-check-circle me-2"></i> Opération réussie avec succès.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger alert-dismissible fade show rounded-4 border-0 shadow-sm" role="alert">
            <i class="bi bi-exclamation-octagon me-2"></i> ${param.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
