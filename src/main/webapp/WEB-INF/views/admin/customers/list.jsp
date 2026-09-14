<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Clients</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/customers/form">Ajouter</a></div>
<form class="mb-3"><div class="input-group"><input class="form-control" name="keyword" placeholder="Recherche client"><button class="btn btn-outline-secondary">Rechercher</button></div></form>
<table class="table table-bordered bg-white"><thead><tr><th>Nom</th><th>Téléphone</th><th>Email</th><th>Adresse</th><th>Actions</th></tr></thead><tbody>
<c:forEach items="${customers}" var="c"><tr><td>${c.firstName} ${c.lastName}</td><td>${c.phone}</td><td>${c.email}</td><td>${c.address}</td><td>
<a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/customers/form?id=${c.id}">Modifier</a>
<form method="post" action="${pageContext.request.contextPath}/customers/delete" style="display:inline" onsubmit="return confirm('Supprimer ?')"><input type="hidden" name="id" value="${c.id}"><button class="btn btn-sm btn-danger">Supprimer</button></form>
</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
