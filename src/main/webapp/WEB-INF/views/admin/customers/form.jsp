<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<h4>${customer != null ? 'Modifier Client' : 'Nouveau Client'}</h4>
<form method="post" class="card card-body">
<c:if test="${customer != null}"><input type="hidden" name="id" value="${customer.id}"></c:if>
<div class="row g-3">
<div class="col-md-6"><label class="form-label">Prénom</label><input name="firstName" class="form-control" value="${customer.firstName}" required></div>
<div class="col-md-6"><label class="form-label">Nom</label><input name="lastName" class="form-control" value="${customer.lastName}" required></div>
<div class="col-md-6"><label class="form-label">Téléphone</label><input name="phone" class="form-control" value="${customer.phone}"></div>
<div class="col-md-6"><label class="form-label">Email</label><input name="email" class="form-control" value="${customer.email}"></div>
<div class="col-12"><label class="form-label">Adresse</label><input name="address" class="form-control" value="${customer.address}"></div>
</div>
<button class="btn btn-success mt-3">Enregistrer</button>
</form>
<%@ include file="../includes/footer.jsp" %>
