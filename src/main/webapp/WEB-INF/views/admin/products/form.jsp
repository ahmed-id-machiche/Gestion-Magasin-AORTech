<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${product != null ? 'Modifier Produit' : 'Nouveau Produit'}</h4>
<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}${product != null ? '/products/edit' : '/products/create'}" class="card card-body">
    <c:if test="${product != null}"><input type="hidden" name="id" value="${product.id}"></c:if>
    <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Nom</label><input class="form-control" name="name" value="${product.name}" required></div>
        <div class="col-md-6"><label class="form-label">Reference</label><input class="form-control" name="reference" value="${product.reference}" required></div>
        <div class="col-md-6"><label class="form-label">Prix achat</label><input type="number" step="0.01" class="form-control" name="purchasePrice" value="${product.purchasePrice}" required></div>
        <div class="col-md-6"><label class="form-label">Prix vente</label><input type="number" step="0.01" class="form-control" name="salePrice" value="${product.salePrice}" required></div>
        <div class="col-md-6">
            <label class="form-label">Image depuis PC</label>
            <input type="file" class="form-control" name="imageFile" accept=".jpg,.jpeg,.png,.webp,.gif">
        </div>
        <div class="col-md-6">
            <label class="form-label">Ou Path local (serveur)</label>
            <input class="form-control" name="localImagePath" placeholder="C:\\Users\\...\\image.jpg">
        </div>
        <div class="col-12">
            <label class="form-label">Ou URL Image</label>
            <input class="form-control" name="imageUrl" value="${product.imageUrl}" placeholder="https://...">
        </div>
        <c:if test="${not empty product.imageUrl}">
            <div class="col-12">
                <label class="form-label d-block">Apercu actuel</label>
                <img src="${product.imageUrl}" alt="image produit" style="max-height:120px;border-radius:10px;">
            </div>
        </c:if>
        <div class="col-md-6"><label class="form-label">Quantite</label><input type="number" class="form-control" name="quantity" value="${product.quantity}" required></div>
        <div class="col-md-6"><label class="form-label">Stock min</label><input type="number" class="form-control" name="minStock" value="${product.minStock}" required></div>
        <div class="col-md-6"><label class="form-label">Categorie</label><select class="form-select" name="categoryId" required><c:forEach items="${categories}" var="c"><option value="${c.id}" ${product.category.id == c.id ? 'selected' : ''}>${c.name}</option></c:forEach></select></div>
        <div class="col-md-6"><label class="form-label">Fournisseur</label><select class="form-select" name="supplierId" required><c:forEach items="${suppliers}" var="s"><option value="${s.id}" ${product.supplier.id == s.id ? 'selected' : ''}>${s.name}</option></c:forEach></select></div>
        <div class="col-12"><label class="form-label">Description</label><textarea class="form-control" name="description">${product.description}</textarea></div>
    </div>
    <div class="mt-3"><button class="btn btn-success">Enregistrer</button> <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Annuler</a></div>
</form>
<%@ include file="../includes/footer.jsp" %>
