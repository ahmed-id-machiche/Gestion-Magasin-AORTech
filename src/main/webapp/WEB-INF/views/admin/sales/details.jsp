<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>Détail Vente #${sale.id}</h4>
<div class="card mb-3"><div class="card-body">
<div>Date: ${sale.saleDate}</div>
<div>Client: ${sale.customer != null ? sale.customer.fullName : 'N/A'}</div>
<div>Vendeur: ${sale.user != null ? sale.user.fullname : "Client web"}</div>
<div>Total: <strong>${sale.totalAmount}</strong></div>
</div></div>
<table class="table table-bordered bg-white"><thead><tr><th>Produit</th><th>Qté</th><th>Prix</th><th>Sous-total</th></tr></thead><tbody>
<c:forEach items="${sale.items}" var="i"><tr><td>${i.product.name}</td><td>${i.quantity}</td><td>${i.unitPrice}</td><td>${i.subtotal}</td></tr></c:forEach>
</tbody></table>
<%@ include file="../includes/footer.jsp" %>
