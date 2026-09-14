<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${offer != null ? 'Modifier Offre' : 'Nouvelle Offre'}</h4>
<c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
<form method="post" class="card card-body">
<c:if test="${offer != null}"><input type="hidden" name="id" value="${offer.id}"></c:if>
<div class="row g-3">
  <div class="col-md-6"><label class="form-label">Titre</label><input class="form-control" name="title" value="${offer.title}" required></div>
  <div class="col-md-6"><label class="form-label">Reduction (%)</label><input type="number" step="0.01" class="form-control" name="discountPercent" value="${offer.discountPercent}"></div>
  <div class="col-md-6"><label class="form-label">Date debut</label><input type="date" class="form-control" name="startDate" value="<fmt:formatDate value='${offer.startDate}' pattern='yyyy-MM-dd'/>"></div>
  <div class="col-md-6"><label class="form-label">Date fin</label><input type="date" class="form-control" name="endDate" value="<fmt:formatDate value='${offer.endDate}' pattern='yyyy-MM-dd'/>"></div>
  <div class="col-12"><label class="form-label">Image URL</label><input class="form-control" name="imageUrl" value="${offer.imageUrl}"></div>
  <div class="col-12"><label class="form-label">Description</label><textarea class="form-control" name="description">${offer.description}</textarea></div>
  <div class="col-12 form-check"><input class="form-check-input" type="checkbox" name="active" id="active" ${offer == null || offer.active ? 'checked' : ''}><label class="form-check-label" for="active">Active</label></div>
</div>
<button class="btn btn-success mt-3">Enregistrer</button>
</form>
<%@ include file="../includes/footer.jsp" %>
