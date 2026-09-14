<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>Mouvements de Stock</h4>
<form method="post" class="card card-body mb-3">
<div class="row g-2">
<div class="col-md-4"><select name="productId" class="form-select" required><option value="">Produit</option><c:forEach items="${products}" var="p"><option value="${p.id}">${p.name}</option></c:forEach></select></div>
<div class="col-md-2"><input type="number" min="1" name="quantity" class="form-control" placeholder="Qté" required></div>
<div class="col-md-2"><select name="type" class="form-select"><option value="ENTREE">Entrée</option><option value="SORTIE">Sortie</option></select></div>
<div class="col-md-3"><input name="note" class="form-control" placeholder="Note"></div>
<div class="col-md-1"><button class="btn btn-success w-100">OK</button></div>
</div>
</form>
<table class="table table-bordered bg-white"><thead><tr><th>Date</th><th>Produit</th><th>Type</th><th>Qté</th><th>Note</th></tr></thead><tbody>
<c:forEach items="${movements}" var="m"><tr><td>${m.movementDate}</td><td>${m.product.name}</td><td>${m.type}</td><td>${m.quantity}</td><td>${m.note}</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
