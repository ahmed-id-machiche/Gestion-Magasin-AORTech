<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>Créer une vente</h4>
<c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
<form method="post" class="card card-body" id="saleForm">
<div class="row g-3">
    <div class="col-md-6"><label class="form-label">Client</label><select name="customerId" class="form-select"><option value="">Vente sans client</option><c:forEach items="${customers}" var="c"><option value="${c.id}">${c.fullName}</option></c:forEach></select></div>
</div>
<hr>
<div id="lines">
    <div class="row g-2 line mb-2">
        <div class="col-md-8"><select name="productId" class="form-select" required><option value="">Produit</option><c:forEach items="${products}" var="p"><option value="${p.id}">${p.name} (Stock: ${p.quantity})</option></c:forEach></select></div>
        <div class="col-md-3"><input type="number" min="1" name="quantity" class="form-control" placeholder="Quantité" required></div>
        <div class="col-md-1"><button type="button" class="btn btn-danger" onclick="removeLine(this)">-</button></div>
    </div>
</div>
<button type="button" class="btn btn-outline-secondary mb-3" onclick="addLine()">Ajouter ligne</button>
<div><button class="btn btn-success">Valider vente</button></div>
</form>
<script>
function addLine(){
  const first=document.querySelector('.line');
  const clone=first.cloneNode(true);
  clone.querySelectorAll('input').forEach(i=>i.value='');
  clone.querySelector('select').selectedIndex=0;
  document.getElementById('lines').appendChild(clone);
}
function removeLine(btn){
  const lines=document.querySelectorAll('.line');
  if(lines.length>1){ btn.closest('.line').remove(); }
}
</script>
<%@ include file="../includes/footer.jsp" %>
