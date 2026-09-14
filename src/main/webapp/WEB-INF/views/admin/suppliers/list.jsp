<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Fournisseurs</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/suppliers/form">Ajouter</a></div>
<table class="table table-bordered bg-white"><thead><tr><th>Nom</th><th> Téléphone</th><th>Email</th><th>Adresse</th><th>Actions</th></tr></thead><tbody>
<c:forEach items="${suppliers}" var="s"><tr><td>${s.name}</td><td>${s.phone}</td><td>${s.email}</td><td>${s.address}</td><td>
<a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/suppliers/form?id=${s.id}">Modifier</a>
<form method="post" action="${pageContext.request.contextPath}/suppliers/delete" style="display:inline" onsubmit="return confirm('Supprimer ?')"><input type="hidden" name="id" value="${s.id}"><button class="btn btn-sm btn-danger">Supprimer</button></form>
</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
