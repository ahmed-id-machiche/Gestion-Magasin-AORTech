<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<div class="text-center mb-4">
  <h3>Nos Services</h3>
  <p class="text-muted">Des services complets pour t'accompagner avant et apres achat.</p>
</div>

<div class="row g-3">
  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Maintenance & Reparation</h5>
        <p class="card-text">Diagnostic, entretien et reparation PC, smartphone, TV et accessoires avec pieces garanties.</p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Livraison Rapide</h5>
        <p class="card-text">Livraison a domicile en 24h/48h selon la zone, avec suivi de commande en temps reel.</p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Installation a Domicile</h5>
        <p class="card-text">Installation et configuration de TV, routeurs, imprimantes et smart devices directement chez toi.</p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Configuration Logicielle</h5>
        <p class="card-text">Installation Windows, antivirus, drivers, suite bureautique et optimisation des performances.</p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Extension de Garantie</h5>
        <p class="card-text">Prolonge ta garantie produit avec une protection supplementaire contre les pannes et casses.</p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card h-100 shadow-sm border-0">
      <div class="card-body">
        <h5 class="card-title">Support Technique 7j/7</h5>
        <p class="card-text">Assistance technique par message pour t'aider a resoudre rapidement tout probleme.</p>
      </div>
    </div>
  </div>
</div>

<div class="alert alert-info mt-4 mb-0">
  Besoin d'un service specifique ? Va sur la page <a href="${pageContext.request.contextPath}/shop/contact" class="alert-link">Contact</a> et envoie ta demande.
</div>

<%@ include file="includes/footer.jsp" %>





