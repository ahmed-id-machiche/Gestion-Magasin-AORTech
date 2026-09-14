<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<div class="row justify-content-center"><div class="col-md-6"><div class="card card-body">
<h4>Inscription client</h4>
<c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
<form method="post" class="row g-2">
<input type="hidden" name="next" value="${next}">
<div class="col-md-6"><input name="firstName" class="form-control" placeholder="Prenom" required></div>
<div class="col-md-6"><input name="lastName" class="form-control" placeholder="Nom" required></div>
<div class="col-md-6"><input name="phone" class="form-control" placeholder="Telephone"></div>
<div class="col-md-6"><input type="email" name="email" class="form-control" placeholder="Email" required></div>
<div class="col-12"><input name="address" class="form-control" placeholder="Adresse"></div>
<div class="col-12"><input type="password" name="password" class="form-control" placeholder="Mot de passe" required></div>
<div class="col-12"><button class="btn btn-dark w-100 mb-2">Creer compte</button></div>
<div class="col-12"><a class="btn btn-outline-secondary w-100" href="${pageContext.request.contextPath}/shop/login${not empty next ? '?next='.concat(next) : ''}">J'ai deja un compte</a></div>
</form></div></div></div>
<%@ include file="includes/footer.jsp" %>





