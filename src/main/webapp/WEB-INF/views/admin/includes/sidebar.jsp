<div class="col-md-2 sidebar p-0">
    <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
    <a href="${pageContext.request.contextPath}/products">Produits</a>
    <a href="${pageContext.request.contextPath}/categories">Categories</a>
    <a href="${pageContext.request.contextPath}/offers">Offres</a>
    <a href="${pageContext.request.contextPath}/customers">Clients</a>
    <a href="${pageContext.request.contextPath}/suppliers">Fournisseurs</a>
    <a href="${pageContext.request.contextPath}/sales">Ventes</a>
    <a href="${pageContext.request.contextPath}/stock">Stock</a>
    <c:if test="${sessionScope.currentUser.role.name() == 'ADMIN'}">
        <a href="${pageContext.request.contextPath}/users">Utilisateurs</a>
    </c:if>
</div>
<div class="col-md-10 content">
    <c:if test="${not empty param.success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            Operation reussie.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${param.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
