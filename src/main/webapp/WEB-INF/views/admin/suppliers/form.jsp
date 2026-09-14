<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${supplier != null ? 'Modifier Fournisseur' : 'Nouveau Fournisseur'}</h4>
<form method="post" class="card card-body">
<c:if test="${supplier != null}"><input type="hidden" name="id" value="${supplier.id}"></c:if>
<label class="form-label">Nom</label><input name="name" class="form-control mb-2" value="${supplier.name}" required>
<label class="form-label">Téléphone</label><input name="phone" class="form-control mb-2" value="${supplier.phone}">
<label class="form-label">Email</label><input name="email" class="form-control mb-2" value="${supplier.email}">
<label class="form-label">Adresse</label><input name="address" class="form-control mb-3" value="${supplier.address}">
<button class="btn btn-success">Enregistrer</button>
</form>
<%@ include file="../includes/footer.jsp" %>
