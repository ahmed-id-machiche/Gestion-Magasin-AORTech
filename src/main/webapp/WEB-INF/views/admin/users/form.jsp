<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${user != null ? 'Modifier Utilisateur' : 'Nouvel Utilisateur'}</h4>
<form method="post" class="card card-body">
<c:if test="${user != null}"><input type="hidden" name="id" value="${user.id}"></c:if>
<label class="form-label">Username</label><input name="username" class="form-control mb-2" value="${user.username}" required>
<label class="form-label">Nom complet</label><input name="fullname" class="form-control mb-2" value="${user.fullname}" required>
<label class="form-label">Mot de passe ${user != null ? '(laisser vide pour conserver)' : ''}</label><input type="password" name="password" class="form-control mb-2" ${user == null ? 'required' : ''}>
<label class="form-label">Rôle</label>
<select name="role" class="form-select mb-3">
<c:forEach items="${roles}" var="r"><option value="${r}" ${user.role.name() == r.name() ? 'selected' : ''}>${r}</option></c:forEach>
</select>
<button class="btn btn-success">Enregistrer</button>
</form>
<%@ include file="../includes/footer.jsp" %>
