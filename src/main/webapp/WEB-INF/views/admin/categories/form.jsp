<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${category != null ? 'Modifier Catégorie' : 'Nouvelle Catégorie'}</h4>
<form method="post" class="card card-body">
    <c:if test="${category != null}"><input type="hidden" name="id" value="${category.id}"></c:if>
    <label class="form-label">Nom</label><input name="name" class="form-control mb-2" value="${category.name}" required>
    <label class="form-label">Description</label><textarea name="description" class="form-control mb-3">${category.description}</textarea>
    <button class="btn btn-success">Enregistrer</button>
</form>
<%@ include file="../includes/footer.jsp" %>
