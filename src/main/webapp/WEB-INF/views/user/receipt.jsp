<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageTitle != null ? pageTitle : 'Boutique'}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
  :root {
    --brand-primary: #0d6efd;
    --brand-dark: #0b1220;
    --brand-accent: #22c55e;
    --brand-gold: #f59e0b;
    --text-soft: rgba(255,255,255,0.78);
    --glass: rgba(255,255,255,0.08);
    --border-soft: rgba(255,255,255,0.12);
  }

  * {
    font-family: 'Poppins', sans-serif;
  }

  body {
    background:
      radial-gradient(circle at top left, rgba(13,110,253,0.08), transparent 30%),
      linear-gradient(to bottom, #f8fafc, #eef2f7);
  }

  .shop-navbar {
    position: sticky;
    top: 0;
    z-index: 1030;
    background: linear-gradient(135deg, #0b1220 0%, #111827 45%, #172554 100%);
    backdrop-filter: blur(12px);
    box-shadow: 0 10px 30px rgba(2, 6, 23, 0.28);
    border-bottom: 1px solid rgba(255,255,255,0.08);
    animation: slideDown 0.8s ease;
  }

  .shop-navbar .container {
    padding-top: 0.9rem;
    padding-bottom: 0.9rem;
  }

  .brand-wrap {
    display: flex;
    align-items: center;
    gap: 0.9rem;
    text-decoration: none;
    position: relative;
  }

  .brand-logo {
    width: 52px;
    height: 52px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.35rem;
    font-weight: 800;
    color: #ffffff;
    background: linear-gradient(135deg, var(--brand-primary), #3b82f6, #06b6d4);
    box-shadow:
      0 0 0 4px rgba(255,255,255,0.06),
      0 10px 22px rgba(13,110,253,0.35);
    transform: rotate(-6deg);
    transition: transform 0.35s ease, box-shadow 0.35s ease;
    animation: floatLogo 3.2s ease-in-out infinite;
  }

  .brand-wrap:hover .brand-logo {
    transform: rotate(0deg) scale(1.06);
    box-shadow:
      0 0 0 4px rgba(255,255,255,0.08),
      0 16px 28px rgba(13,110,253,0.42);
  }

  .brand-text {
    display: flex;
    flex-direction: column;
    line-height: 1.05;
  }

  .brand-title {
    margin: 0;
    font-size: 1.55rem;
    font-weight: 800;
    letter-spacing: 0.4px;
    background: linear-gradient(90deg, #ffffff, #bfdbfe, #93c5fd);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 0 20px rgba(147,197,253,0.08);
  }

  .brand-subtitle {
    margin: 0;
    font-size: 0.72rem;
    font-weight: 500;
    letter-spacing: 2.2px;
    text-transform: uppercase;
    color: var(--text-soft);
  }

  .nav-links {
    display: flex;
    align-items: center;
    gap: 0.55rem;
    margin-left: 1.5rem;
  }

  .nav-pill {
    color: #e5e7eb;
    text-decoration: none;
    padding: 0.62rem 1rem;
    border-radius: 999px;
    font-size: 0.92rem;
    font-weight: 500;
    background: transparent;
    border: 1px solid transparent;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
  }

  .nav-pill::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(90deg, rgba(255,255,255,0.10), rgba(255,255,255,0.02));
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .nav-pill:hover {
    color: #ffffff;
    border-color: var(--border-soft);
    background: var(--glass);
    transform: translateY(-2px);
  }

  .nav-pill:hover::before {
    opacity: 1;
  }

  .header-actions {
    display: flex;
    align-items: center;
    gap: 0.7rem;
    flex-wrap: wrap;
  }

  .action-btn {
    border-radius: 999px;
    padding: 0.68rem 1.1rem;
    font-weight: 600;
    border: 1px solid rgba(255,255,255,0.14);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
  }

  .action-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(15, 23, 42, 0.22);
  }

  .action-outline {
    background: rgba(255,255,255,0.05);
    color: #ffffff;
  }

  .action-outline:hover {
    background: rgba(255,255,255,0.14);
    color: #ffffff;
    border-color: rgba(255,255,255,0.22);
  }

  .action-warning {
    background: linear-gradient(135deg, #f59e0b, #fbbf24);
    color: #111827;
    border: none;
  }

  .action-warning:hover {
    color: #111827;
    box-shadow: 0 12px 22px rgba(245, 158, 11, 0.35);
  }

  .count-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 24px;
    height: 24px;
    margin-left: 0.45rem;
    padding: 0 0.45rem;
    border-radius: 999px;
    background: rgba(255,255,255,0.16);
    color: #ffffff;
    font-size: 0.75rem;
    font-weight: 700;
  }

  .hero-strip {
    height: 3px;
    background: linear-gradient(90deg, #0d6efd, #06b6d4, #22c55e, #f59e0b);
    background-size: 200% 100%;
    animation: shimmer 5s linear infinite;
  }

  .login-card,
  .contact-card,
  .checkout-form-card,
  .summary-card {
    background: rgba(255,255,255,0.92);
    backdrop-filter: blur(10px);
    border-radius: 24px;
    box-shadow: 0 18px 40px rgba(15,23,42,0.12);
  }

  .login-card-top,
  .contact-card-top,
  .checkout-card-top {
    height: 5px;
    background: linear-gradient(90deg, #0d6efd, #06b6d4, #22c55e, #f59e0b);
    background-size: 200% 100%;
    animation: shimmer 5s linear infinite;
  }

  .login-title,
  .contact-title,
  .checkout-title {
    color: #ffffff;
    font-weight: 800;
  }

  .login-subtitle,
  .contact-subtitle,
  .checkout-subtitle {
    color: rgba(255,255,255,0.82);
  }

  .login-badge-box,
  .contact-badge-box,
  .checkout-badge-box {
    min-width: 150px;
    background: rgba(255,255,255,0.12);
    border: 1px solid rgba(255,255,255,0.14);
    backdrop-filter: blur(10px);
    border-radius: 22px;
    padding: 1rem 1.25rem;
    text-align: center;
  }

  .login-badge-label,
  .contact-badge-label,
  .checkout-badge-label {
    display: block;
    font-size: 0.8rem;
    color: rgba(255,255,255,0.72);
    margin-bottom: 0.3rem;
  }

  .login-badge-value,
  .contact-badge-value,
  .checkout-badge-value {
    font-size: 1.5rem;
    font-weight: 800;
    color: #fff;
  }

  .login-input,
  .contact-input,
  .contact-textarea,
  .checkout-input {
    border-radius: 16px;
    border: 1px solid rgba(148,163,184,0.26);
    background: rgba(255,255,255,0.95);
    padding: 0.85rem 1rem;
    box-shadow: none;
    transition: all 0.3s ease;
  }

  .login-input:focus,
  .contact-input:focus,
  .contact-textarea:focus,
  .checkout-input:focus {
    border-color: #60a5fa;
    box-shadow: 0 0 0 4px rgba(96,165,250,0.15);
  }

  .login-btn,
  .register-btn,
  .send-btn,
  .confirm-btn {
    min-height: 50px;
    border: 0;
    border-radius: 16px;
    font-weight: 700;
    color: #fff;
    background: linear-gradient(135deg, #0d6efd, #2563eb, #06b6d4);
    box-shadow: 0 12px 24px rgba(13,110,253,0.22);
    transition: all 0.3s ease;
  }

  .login-btn:hover,
  .register-btn:hover,
  .send-btn:hover,
  .confirm-btn:hover {
    color: #fff;
    transform: translateY(-2px);
    box-shadow: 0 16px 28px rgba(13,110,253,0.28);
  }

  .checkout-disabled {
    background: #f8fafc;
  }

  @keyframes slideDown {
    from {
      opacity: 0;
      transform: translateY(-24px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  @keyframes floatLogo {
    0%, 100% {
      transform: rotate(-6deg) translateY(0);
    }
    50% {
      transform: rotate(-3deg) translateY(-4px);
    }
  }

  @keyframes shimmer {
    0% {
      background-position: 0 0;
    }
    100% {
      background-position: 200% 0;
    }
  }

  @media (max-width: 991.98px) {
    .shop-navbar .container {
      gap: 1rem;
    }

    .nav-links {
      margin-left: 0;
      margin-top: 1rem;
      flex-wrap: wrap;
    }

    .header-actions {
      margin-top: 1rem;
      justify-content: flex-start;
    }
  }

  @media (max-width: 575.98px) {
    .brand-title {
      font-size: 1.2rem;
    }

    .brand-logo {
      width: 46px;
      height: 46px;
      font-size: 1.1rem;
    }

    .nav-pill,
    .action-btn {
      width: 100%;
      text-align: center;
      justify-content: center;
    }
  }
</style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg shop-navbar">
  <div class="container d-flex flex-wrap align-items-center justify-content-between">
    <a class="brand-wrap navbar-brand m-0" href="${pageContext.request.contextPath}/shop">
      <div class="brand-logo">AO</div>
      <div class="brand-text">
        <h1 class="brand-title">AORTech</h1>
        <p class="brand-subtitle">Smart Digital Store</p>
      </div>
    </a>

    <div class="nav-links me-auto">
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop">Home</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/offers">Offres</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/services">Services</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/contact">Contact</a>
    </div>

    <div class="header-actions d-flex align-items-center">
      <a class="btn action-btn action-outline" href="${pageContext.request.contextPath}/favorites">
        Favoris
        <span class="count-badge">${favoritesCount != null ? favoritesCount : 0}</span>
      </a>

      <a class="btn action-btn action-outline" href="${pageContext.request.contextPath}/cart">
        Panier
        <span class="count-badge">${cartCount != null ? cartCount : 0}</span>
      </a>

      <c:choose>
        <c:when test="${sessionScope.shopCustomer != null}">
          <a class="btn action-btn action-outline" href="${pageContext.request.contextPath}/shop/profile">Profil</a>
          <a class="btn action-btn action-outline" href="${pageContext.request.contextPath}/shop/orders">Mes commandes</a>
          <a class="btn action-btn action-warning" href="${pageContext.request.contextPath}/shop/logout">Logout</a>
        </c:when>
        <c:otherwise>
          <a class="btn action-btn action-outline" href="${pageContext.request.contextPath}/shop/login">Login</a>
          <a class="btn action-btn action-warning" href="${pageContext.request.contextPath}/shop/register">Inscription</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>

<div class="hero-strip"></div>

<div class="container py-4">
  <div class="receipt-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="receipt-kicker mb-2">Justificatif d'achat</p>
        <h2 class="receipt-title mb-2">Reçu #${sale.id}</h2>
        <p class="receipt-subtitle mb-0">
          Consulte le détail complet de ta commande, les produits achetés et le montant total.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="receipt-badge-box d-inline-block">
          <span class="receipt-badge-label">Montant</span>
          <span class="receipt-badge-value">${sale.totalAmount} MAD</span>
        </div>
      </div>
    </div>
  </div>

  <div class="receipt-card card border-0 shadow-lg rounded-4 overflow-hidden">
    <div class="receipt-card-top"></div>
    <div class="card-body p-4 p-md-5">
      <div class="row g-4 mb-4">
        <div class="col-md-4">
          <div class="receipt-info-box h-100">
            <span class="receipt-info-label">Date</span>
            <strong class="receipt-info-value">${sale.saleDate}</strong>
          </div>
        </div>
        <div class="col-md-4">
          <div class="receipt-info-box h-100">
            <span class="receipt-info-label">Client</span>
            <strong class="receipt-info-value">${sale.customer.fullName}</strong>
          </div>
        </div>
        <div class="col-md-4">
          <div class="receipt-info-box h-100">
            <span class="receipt-info-label">Adresse</span>
            <strong class="receipt-info-value">${sale.customer.address}</strong>
          </div>
        </div>
      </div>

      <div class="receipt-table-wrap table-responsive mb-4">
        <table class="table receipt-table align-middle mb-0">
          <thead>
            <tr>
              <th>Produit</th>
              <th>Qte</th>
              <th>Prix</th>
              <th>Sous-total</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${sale.items}" var="i">
              <tr>
                <td>
                  <span class="receipt-product-name">${i.product.name}</span>
                </td>
                <td>
                  <span class="receipt-qty-badge">${i.quantity}</span>
                </td>
                <td>${i.unitPrice} MAD</td>
                <td>
                  <span class="receipt-subtotal">${i.subtotal} MAD</span>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
        <h4 class="receipt-total mb-0">Total : ${sale.totalAmount} MAD</h4>
        <a class="btn receipt-back-btn" href="${pageContext.request.contextPath}/shop/orders">
          Retour commandes
        </a>
      </div>
    </div>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







