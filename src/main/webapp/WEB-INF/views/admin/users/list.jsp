<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Utilisateurs</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/users/form">Ajouter</a></div>
<table class="table table-bordered bg-white"><thead><tr><th>Username</th><th>Nom</th><th>Role</th><th>Actions</th></tr></thead><tbody>
<c:forEach items="${users}" var="u"><tr><td>${u.username}</td><td>${u.fullname}</td><td>${u.role}</td><td>
<a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/users/form?id=${u.id}">Modifier</a>
<form method="post" action="${pageContext.request.contextPath}/users/delete" style="display:inline" onsubmit="return confirm('Supprimer ?')"><input type="hidden" name="id" value="${u.id}"><button class="btn btn-sm btn-danger">Supprimer</button></form>
</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
