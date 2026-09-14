<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Produits</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/products/create">Ajouter</a></div>
<form class="row g-2 mb-3" method="get">
    <div class="col-md-4"><input class="form-control" name="keyword" placeholder="Rechercher par nom"></div>
    <div class="col-md-4">
        <select class="form-select" name="categoryId"><option value="">Toutes categories</option>
            <c:forEach items="${categories}" var="c"><option value="${c.id}">${c.name}</option></c:forEach>
        </select>
    </div>
    <div class="col-md-2"><button class="btn btn-outline-secondary w-100">Filtrer</button></div>
</form>
<table class="table table-striped table-bordered bg-white">
    <thead><tr><th>Image</th><th>Nom</th><th>Ref</th><th>Categorie</th><th>Stock</th><th>Achat</th><th>Vente</th><th>Date</th><th>Actions</th></tr></thead>
    <tbody>
    <c:forEach items="${products}" var="p">
        <tr>
            <td><img src="${empty p.imageUrl ? 'https://placehold.co/80x60?text=Img' : p.imageUrl}" style="width:80px;height:60px;object-fit:cover"></td>
            <td>${p.name}</td><td>${p.reference}</td><td>${p.category.name}</td><td>${p.quantity}</td><td>${p.purchasePrice}</td><td>${p.salePrice}</td><td>${p.createdAt}</td>
            <td>
                <a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/products/edit?id=${p.id}">Modifier</a>
                <form method="post" action="${pageContext.request.contextPath}/products/delete" style="display:inline" onsubmit="return confirm('Confirmer la suppression ?')">
                    <input type="hidden" name="id" value="${p.id}"><button class="btn btn-sm btn-danger">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../includes/footer.jsp" %>
