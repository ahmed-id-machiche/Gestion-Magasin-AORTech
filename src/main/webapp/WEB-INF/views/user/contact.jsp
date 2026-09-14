<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
  <div class="contact-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="contact-kicker mb-2">Support client</p>
        <h2 class="contact-title mb-2">Contact Support</h2>
        <p class="contact-subtitle mb-0">
          Une question, un problème ou une demande spéciale ? Notre équipe est là pour vous aider rapidement.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="contact-badge-box d-inline-block">
          <span class="contact-badge-label">Réponse rapide</span>
          <span class="contact-badge-value">24/7</span>
        </div>
      </div>
    </div>
  </div>

  <div class="row justify-content-center">
    <div class="col-lg-8 col-xl-7">
      <div class="contact-card card border-0 shadow-lg rounded-4 overflow-hidden">
        <div class="contact-card-top"></div>
        <div class="card-body p-4 p-md-5">
          <div class="contact-title-wrap mb-4">
            <h4 class="form-title mb-2">Envoyer un message</h4>
            <p class="form-subtitle mb-0">Remplissez le formulaire et nous vous répondrons dans les plus brefs délais.</p>
          </div>

          <c:if test="${param.success == '1'}">
            <div class="alert alert-success border-0 shadow-sm rounded-4 contact-alert-success">
              Message envoyé avec succès. Notre équipe va te répondre bientôt.
            </div>
          </c:if>

          <c:if test="${not empty error}">
            <div class="alert alert-danger border-0 shadow-sm rounded-4">
              ${error}
            </div>
          </c:if>

          <form method="post" action="${pageContext.request.contextPath}/shop/contact" class="contact-form">
            <div class="mb-3">
              <label class="form-label contact-label">Nom complet</label>
              <input
                class="form-control contact-input"
                name="fullName"
                value="${sessionScope.shopCustomer != null ? sessionScope.shopCustomer.fullName : ''}"
                required
              >
            </div>

            <div class="mb-3">
              <label class="form-label contact-label">Email</label>
              <input
                type="email"
                class="form-control contact-input"
                name="email"
                value="${sessionScope.shopCustomer != null ? sessionScope.shopCustomer.email : ''}"
                required
              >
            </div>

            <div class="mb-4">
              <label class="form-label contact-label">Message</label>
              <textarea
                class="form-control contact-textarea"
                rows="6"
                name="message"
                placeholder="Écris ton problème ici..."
                required
              ></textarea>
            </div>

            <div class="d-grid d-sm-flex justify-content-sm-end">
              <button class="btn send-btn px-4">Envoyer</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







