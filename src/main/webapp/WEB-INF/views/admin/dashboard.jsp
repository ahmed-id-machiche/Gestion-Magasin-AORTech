<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<h3 class="mb-4">Tableau de bord</h3>

<div class="row g-3 mb-3">
    <div class="col-md-3"><div class="card"><div class="card-body"><h6>Produits</h6><h3>${stats.totalProducts}</h3></div></div></div>
    <div class="col-md-3"><div class="card"><div class="card-body"><h6>Catégories</h6><h3>${stats.totalCategories}</h3></div></div></div>
    <div class="col-md-3"><div class="card"><div class="card-body"><h6>Clients</h6><h3>${stats.totalCustomers}</h3></div></div></div>
    <div class="col-md-3"><div class="card"><div class="card-body"><h6>Fournisseurs</h6><h3>${stats.totalSuppliers}</h3></div></div></div>
</div>

<div class="row g-3 mb-4">
    <div class="col-md-4"><div class="card border-warning"><div class="card-body"><h6>Stock faible</h6><h3>${stats.lowStockCount}</h3></div></div></div>
    <div class="col-md-4"><div class="card"><div class="card-body"><h6>Ventes</h6><h3>${stats.salesCount}</h3></div></div></div>
    <div class="col-md-4"><div class="card border-success"><div class="card-body"><h6>Chiffre d'affaires</h6><h3>${stats.totalRevenue} MAD</h3></div></div></div>
</div>

<div class="row g-3">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-body">
                <h6 class="mb-3">Graphique des statistiques</h6>
                <canvas id="statsBarChart" height="110"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h6 class="mb-3">Répartition (cercle)</h6>
                <canvas id="statsDoughnutChart" height="250"></canvas>
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

  const barCtx = document.getElementById('statsBarChart');
  if (barCtx) {
    new Chart(barCtx, {
      type: 'bar',
      data: {
        labels: ['Produits', 'Catégories', 'Clients', 'Fournisseurs', 'Stock faible', 'Ventes'],
        datasets: [{
          label: 'Nombre',
          data: [totalProducts, totalCategories, totalCustomers, totalSuppliers, lowStockCount, salesCount],
          backgroundColor: ['#2563eb', '#06b6d4', '#22c55e', '#a855f7', '#f59e0b', '#ef4444'],
          borderRadius: 10
        }]
      },
      options: {
        responsive: true,
        plugins: { legend: { display: false } },
        scales: { y: { beginAtZero: true, ticks: { precision: 0 } } }
      }
    });
  }

  const doughnutCtx = document.getElementById('statsDoughnutChart');
  if (doughnutCtx) {
    new Chart(doughnutCtx, {
      type: 'doughnut',
      data: {
        labels: ['Produits', 'Clients', 'Ventes', 'Stock faible'],
        datasets: [{
          data: [totalProducts, totalCustomers, salesCount, lowStockCount],
          backgroundColor: ['#2563eb', '#22c55e', '#0ea5e9', '#f59e0b'],
          borderWidth: 0
        }]
      },
      options: {
        responsive: true,
        plugins: { legend: { position: 'bottom' } },
        cutout: '65%'
      }
    });
  }
</script>
<%@ include file="includes/footer.jsp" %>
