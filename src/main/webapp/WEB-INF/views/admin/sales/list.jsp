<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<div class="d-flex justify-content-between mb-3"><h4>Ventes</h4><a class="btn btn-primary" href="${pageContext.request.contextPath}/sales/create">Nouvelle vente</a></div>
<table class="table table-bordered bg-white"><thead><tr><th>ID</th><th>Date</th><th>Client</th><th>Vendeur</th><th>Total</th><th>Details</th></tr></thead><tbody>
<c:forEach items="${sales}" var="s"><tr><td>#${s.id}</td><td>${s.saleDate}</td><td>${s.customer != null ? s.customer.fullName : 'N/A'}</td><td>${s.user != null ? s.user.fullname : "Client web"}</td><td>${s.totalAmount}</td><td><a class="btn btn-sm btn-info" href="${pageContext.request.contextPath}/sales/details?id=${s.id}">Voir</a></td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
