<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<!-- Welcome Hero Banner -->
<div class="welcome-hero-card mb-4 d-flex flex-wrap align-items-center justify-content-between gap-3">
  <div>
    <span class="badge bg-primary bg-opacity-25 text-info rounded-pill px-3 py-2 fw-semibold mb-2" style="font-size: 0.8rem;">
      <i class="bi bi-stars me-1"></i> Espace d'Administration Creative
    </span>
    <h2 class="fw-extrabold text-white mb-1" style="letter-spacing: -0.5px;">
      Bonjour, ${sessionScope.currentUser.fullname} 👋
    </h2>
    <p class="text-white-50 mb-0" style="max-width: 600px; font-size: 0.95rem;">
      Voici l'analyse globale et les performances en temps réel de votre plateforme <strong>AORTech Digital Store</strong>.
    </p>
  </div>
  <div class="d-flex align-items-center gap-2 flex-wrap">
    <a href="${pageContext.request.contextPath}/products/create" class="btn btn-primary rounded-pill px-4 py-2 fw-bold shadow-sm">
      <i class="bi bi-plus-circle me-1"></i> Produit
    </a>
    <a href="${pageContext.request.contextPath}/sales/create" class="btn btn-light rounded-pill px-4 py-2 fw-bold text-dark shadow-sm">
      <i class="bi bi-cart-plus me-1"></i> Vente
    </a>
  </div>
</div>

<!-- Primary 4 KPI Metric Cards -->
<div class="row g-4 mb-4">
  <!-- Revenue Card -->
  <div class="col-sm-6 col-xl-3">
    <div class="kpi-card p-4">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <span class="text-muted fw-semibold fs-6">Chiffre d'affaires</span>
        <div class="kpi-icon-wrap kpi-revenue shadow-sm">
          <i class="bi bi-cash-stack"></i>
        </div>
      </div>
      <h3 class="fw-extrabold text-dark mb-1" style="font-size: 1.65rem;">${stats.totalRevenue} MAD</h3>
      <div class="d-flex align-items-center gap-2 mt-2">
        <span class="badge bg-emerald-subtle text-success rounded-pill px-2.5 py-1 fw-bold" style="background-color: #d1fae5; font-size: 0.75rem;">
          <i class="bi bi-arrow-up-right me-1"></i>+12.5%
        </span>
        <span class="text-muted small">ce mois</span>
      </div>
    </div>
  </div>

  <!-- Sales Count Card -->
  <div class="col-sm-6 col-xl-3">
    <div class="kpi-card p-4">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <span class="text-muted fw-semibold fs-6">Ventes accomplies</span>
        <div class="kpi-icon-wrap kpi-sales shadow-sm">
          <i class="bi bi-cart-check-fill"></i>
        </div>
      </div>
      <h3 class="fw-extrabold text-dark mb-1" style="font-size: 1.8rem;">${stats.salesCount}</h3>
      <div class="d-flex align-items-center gap-2 mt-2">
        <span class="text-primary fw-semibold small"><i class="bi bi-bag-check me-1"></i>Commandes validées</span>
      </div>
    </div>
  </div>

  <!-- Total Products Card -->
  <div class="col-sm-6 col-xl-3">
    <div class="kpi-card p-4">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <span class="text-muted fw-semibold fs-6">Produits actifs</span>
        <div class="kpi-icon-wrap kpi-products shadow-sm">
          <i class="bi bi-box-seam-fill"></i>
        </div>
      </div>
      <h3 class="fw-extrabold text-dark mb-1" style="font-size: 1.8rem;">${stats.totalProducts}</h3>
      <div class="d-flex align-items-center gap-2 mt-2">
        <span class="text-purple fw-semibold small" style="color: #8b5cf6;"><i class="bi bi-grid-3x3-gap me-1"></i>Catalogue en ligne</span>
      </div>
    </div>
  </div>

  <!-- Low Stock Warning Card -->
  <div class="col-sm-6 col-xl-3">
    <div class="kpi-card p-4">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <span class="text-muted fw-semibold fs-6">Stock critique</span>
        <div class="kpi-icon-wrap kpi-warning shadow-sm">
          <i class="bi bi-exclamation-triangle-fill"></i>
        </div>
      </div>
      <h3 class="fw-extrabold text-dark mb-1" style="font-size: 1.8rem;">${stats.lowStockCount}</h3>
      <div class="d-flex align-items-center gap-2 mt-2">
        <c:choose>
          <c:when test="${stats.lowStockCount > 0}">
            <span class="badge bg-warning text-dark rounded-pill px-2.5 py-1 fw-bold" style="font-size: 0.75rem;">Alerte Réappro</span>
          </c:when>
          <c:otherwise>
            <span class="badge bg-success bg-opacity-10 text-success rounded-pill px-2.5 py-1 fw-bold" style="font-size: 0.75rem;">Niveaux de stock OK</span>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>

<!-- Secondary Stat Row -->
<div class="row g-4 mb-4">
  <div class="col-md-4">
    <div class="kpi-card p-3.5 d-flex align-items-center gap-3">
      <div class="kpi-icon-wrap kpi-categories shadow-sm" style="width: 48px; height: 48px; font-size: 1.25rem;">
        <i class="bi bi-tags-fill"></i>
      </div>
      <div>
        <span class="text-muted small d-block">Catégories</span>
        <h4 class="fw-bold text-dark mb-0">${stats.totalCategories}</h4>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="kpi-card p-3.5 d-flex align-items-center gap-3">
      <div class="kpi-icon-wrap kpi-customers shadow-sm" style="width: 48px; height: 48px; font-size: 1.25rem;">
        <i class="bi bi-people-fill"></i>
      </div>
      <div>
        <span class="text-muted small d-block">Clients Inscrits</span>
        <h4 class="fw-bold text-dark mb-0">${stats.totalCustomers}</h4>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="kpi-card p-3.5 d-flex align-items-center gap-3">
      <div class="kpi-icon-wrap kpi-suppliers shadow-sm" style="width: 48px; height: 48px; font-size: 1.25rem;">
        <i class="bi bi-truck"></i>
      </div>
      <div>
        <span class="text-muted small d-block">Fournisseurs Partenaires</span>
        <h4 class="fw-bold text-dark mb-0">${stats.totalSuppliers}</h4>
      </div>
    </div>
  </div>
</div>

<!-- Creative Charts Section -->
<div class="row g-4 mb-4">
  <!-- Bar Chart -->
  <div class="col-lg-8">
    <div class="chart-container-card h-100">
      <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
          <h5 class="fw-bold text-dark mb-0">Graphique des Métriques</h5>
          <small class="text-muted">Aperçu comparatif des indicateurs clés</small>
        </div>
        <span class="badge bg-light text-dark rounded-pill border px-3 py-1.5 fw-semibold">Temps réel</span>
      </div>
      <div style="position: relative; height: 320px; width: 100%;">
        <canvas id="statsBarChart"></canvas>
      </div>
    </div>
  </div>

  <!-- Doughnut Chart -->
  <div class="col-lg-4">
    <div class="chart-container-card h-100">
      <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
          <h5 class="fw-bold text-dark mb-0">Répartition globale</h5>
          <small class="text-muted">Segment par catégorie</small>
        </div>
        <i class="bi bi-pie-chart-fill text-primary fs-5"></i>
      </div>
      <div style="position: relative; height: 280px; width: 100%;" class="d-flex align-items-center justify-content-center">
        <canvas id="statsDoughnutChart"></canvas>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const totalProducts = Number('${stats.totalProducts}');
  const totalCategories = Number('${stats.totalCategories}');
  const totalCustomers = Number('${stats.totalCustomers}');
  const totalSuppliers = Number('${stats.totalSuppliers}');
  const lowStockCount = Number('${stats.lowStockCount}');
  const salesCount = Number('${stats.salesCount}');

  // Custom Styled Bar Chart
  const barCtx = document.getElementById('statsBarChart');
  if (barCtx) {
    new Chart(barCtx, {
      type: 'bar',
      data: {
        labels: ['Produits', 'Catégories', 'Clients', 'Fournisseurs', 'Stock faible', 'Ventes'],
        datasets: [{
          label: 'Quantité',
          data: [totalProducts, totalCategories, totalCustomers, totalSuppliers, lowStockCount, salesCount],
          backgroundColor: [
            '#8b5cf6',
            '#06b6d4',
            '#ec4899',
            '#64748b',
            '#f59e0b',
            '#3b82f6'
          ],
          borderRadius: 12,
          borderSkipped: false,
          barThickness: 36
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          tooltip: {
            backgroundColor: '#0f172a',
            titleFont: { family: 'Poppins', size: 14, weight: 'bold' },
            bodyFont: { family: 'Poppins', size: 13 },
            padding: 12,
            cornerRadius: 12
          }
        },
        scales: {
          x: {
            grid: { display: false },
            ticks: { font: { family: 'Poppins', weight: '600', size: 12 }, color: '#64748b' }
          },
          y: {
            grid: { color: '#f1f5f9' },
            ticks: { font: { family: 'Poppins', size: 12 }, color: '#94a3b8', precision: 0 },
            beginAtZero: true
          }
        }
      }
    });
  }

  // Custom Styled Doughnut Chart
  const doughnutCtx = document.getElementById('statsDoughnutChart');
  if (doughnutCtx) {
    new Chart(doughnutCtx, {
      type: 'doughnut',
      data: {
        labels: ['Produits', 'Clients', 'Ventes', 'Stock faible'],
        datasets: [{
          data: [totalProducts, totalCustomers, salesCount, lowStockCount],
          backgroundColor: ['#8b5cf6', '#ec4899', '#3b82f6', '#f59e0b'],
          borderWidth: 4,
          borderColor: '#ffffff',
          hoverOffset: 6
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: { family: 'Poppins', weight: '600', size: 12 },
              usePointStyle: true,
              padding: 16
            }
          }
        },
        cutout: '72%'
      }
    });
  }
</script>

<%@ include file="includes/footer.jsp" %>
