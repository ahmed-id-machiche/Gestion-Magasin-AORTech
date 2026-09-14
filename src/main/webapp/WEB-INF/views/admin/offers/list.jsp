<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Offres</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/offers/form">Ajouter Offre</a></div>
<table class="table table-bordered bg-white"><thead><tr><th>Titre</th><th>Reduction</th><th>Actif</th><th>Periode</th><th>Actions</th></tr></thead><tbody>
<c:forEach items="${offers}" var="o"><tr><td>${o.title}</td><td>${o.discountPercent}%</td><td>${o.active}</td><td>${o.startDate} - ${o.endDate}</td><td>
<a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/offers/form?id=${o.id}">Modifier</a>
<form method="post" action="${pageContext.request.contextPath}/offers/delete" style="display:inline" onsubmit="return confirm('Supprimer ?')"><input type="hidden" name="id" value="${o.id}"><button class="btn btn-sm btn-danger">Supprimer</button></form>
</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
