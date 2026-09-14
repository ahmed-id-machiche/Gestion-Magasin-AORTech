<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
  <div class="login-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="login-kicker mb-2">Espace client</p>
        <h2 class="login-title mb-2">Connexion client</h2>
        <p class="login-subtitle mb-0">
          Connecte-toi pour accéder à ton profil, tes favoris, ton panier et tes commandes.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="login-badge-box d-inline-block">
          <span class="login-badge-label">Accès sécurisé</span>
          <span class="login-badge-value">SSL</span>
        </div>
      </div>
    </div>
  </div>

  <div class="row justify-content-center">
    <div class="col-md-7 col-lg-5">
      <div class="login-card card border-0 shadow-lg rounded-4 overflow-hidden">
        <div class="login-card-top"></div>
        <div class="card-body p-4 p-md-5">
          <div class="mb-4 text-center text-md-start">
            <h4 class="login-form-title mb-2">Login client</h4>
            <p class="login-form-subtitle mb-0">Entre tes identifiants pour continuer ton expérience shopping.</p>
          </div>

          <c:if test="${not empty error}">
            <div class="alert alert-danger border-0 shadow-sm rounded-4">
              ${error}
            </div>
          </c:if>

          <form method="post" class="login-form">
            <input type="hidden" name="next" value="${next}">

            <div class="mb-3">
              <label class="form-label login-label">Email</label>
              <input type="email" name="email" class="form-control login-input" required>
            </div>

            <div class="mb-4">
              <label class="form-label login-label">Mot de passe</label>
              <input type="password" name="password" class="form-control login-input" required>
            </div>

            <button class="btn login-btn w-100 mb-3">Se connecter</button>

            <a
              class="btn register-btn w-100"
              href="${pageContext.request.contextPath}/shop/register${not empty next ? '?next='.concat(next) : ''}"
            >
              Pas de compte ? Inscription
            </a>
          </form>
        </div>
      </div>
    </div>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







