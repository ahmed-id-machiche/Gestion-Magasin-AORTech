<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
  <div class="profile-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="profile-kicker mb-2">Compte client</p>
        <h2 class="profile-title mb-2">Mon profil</h2>
        <p class="profile-subtitle mb-0">
          Gère tes informations personnelles pour garder ton compte à jour et faciliter tes commandes.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="profile-badge-box d-inline-block">
          <span class="profile-badge-label">Compte actif</span>
          <span class="profile-badge-value">OK</span>
        </div>
      </div>
    </div>
  </div>

  <div class="row justify-content-center">
    <div class="col-lg-8 col-xl-7">
      <div class="profile-card card border-0 shadow-lg rounded-4 overflow-hidden">
        <div class="profile-card-top"></div>
        <div class="card-body p-4 p-md-5">
          <div class="mb-4">
            <h4 class="profile-form-title mb-2">Informations personnelles</h4>
            <p class="profile-form-subtitle mb-0">Modifie tes coordonnées et enregistre les changements en un clic.</p>
          </div>

          <c:if test="${param.success == '1'}">
            <div class="alert alert-success border-0 shadow-sm rounded-4 profile-alert-success">
              Profil mis à jour avec succès.
            </div>
          </c:if>

          <form method="post" class="row g-3 profile-form">
            <div class="col-md-6">
              <label class="form-label profile-label">Prénom</label>
              <input name="firstName" value="${sessionScope.shopCustomer.firstName}" class="form-control profile-input" required>
            </div>

            <div class="col-md-6">
              <label class="form-label profile-label">Nom</label>
              <input name="lastName" value="${sessionScope.shopCustomer.lastName}" class="form-control profile-input" required>
            </div>

            <div class="col-md-6">
              <label class="form-label profile-label">Téléphone</label>
              <input name="phone" value="${sessionScope.shopCustomer.phone}" class="form-control profile-input">
            </div>

            <div class="col-md-6">
              <label class="form-label profile-label">Email</label>
              <input value="${sessionScope.shopCustomer.email}" class="form-control profile-input profile-disabled" disabled>
            </div>

            <div class="col-12">
              <label class="form-label profile-label">Adresse</label>
              <input name="address" value="${sessionScope.shopCustomer.address}" class="form-control profile-input">
            </div>

            <div class="col-12 d-grid d-sm-flex justify-content-sm-end gap-2">
              <a href="${pageContext.request.contextPath}/shop/logout" class="btn btn-outline-danger px-4 rounded-3 fw-bold align-self-center">Déconnexion</a>
              <button class="btn save-profile-btn px-4">Sauvegarder</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







