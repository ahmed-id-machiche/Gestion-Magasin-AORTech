<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageTitle != null ? pageTitle : 'Boutique'}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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

  .nav-icon-btn {
    width: 44px;
    height: 44px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    background: rgba(255, 255, 255, 0.08);
    border-radius: 50%;
    transition: all 0.25s ease;
    text-decoration: none;
  }
  .nav-icon-btn:hover, .nav-icon-btn:focus {
    color: #ffffff;
    background: rgba(255, 255, 255, 0.2);
    transform: translateY(-2px);
  }
  .cart-badge-counter {
    position: absolute;
    top: -2px;
    right: -2px;
    background-color: #0d6efd;
    color: #ffffff;
    font-size: 0.72rem;
    font-weight: 700;
    min-width: 20px;
    height: 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid #0b1220;
  }

  /* Product Buttons Styling */
  .favorite-btn {
    border-radius: 999px !important;
    padding: 0.65rem 1.25rem !important;
    font-weight: 600 !important;
    font-size: 0.88rem !important;
    transition: all 0.3s ease !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 0.4rem !important;
  }

  .favorite-outline {
    background-color: #fff0f3 !important;
    color: #e63946 !important;
    border: 1.5px solid #ffccd5 !important;
  }

  .favorite-outline:hover {
    background-color: #ffccd5 !important;
    color: #d90429 !important;
    border-color: #ff4d6d !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 6px 15px rgba(230, 57, 70, 0.2) !important;
  }

  .favorite-active {
    background: linear-gradient(135deg, #e63946 0%, #d90429 100%) !important;
    color: #ffffff !important;
    border: 1.5px solid transparent !important;
    box-shadow: 0 4px 14px rgba(230, 57, 70, 0.35) !important;
  }

  .favorite-active:hover {
    color: #ffffff !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 20px rgba(230, 57, 70, 0.45) !important;
  }

  .cart-btn {
    background: linear-gradient(135deg, #0d6efd 0%, #2563eb 100%) !important;
    color: #ffffff !important;
    font-weight: 700 !important;
    font-size: 0.9rem !important;
    padding: 0.65rem 1.4rem !important;
    border-radius: 999px !important;
    border: none !important;
    box-shadow: 0 4px 14px rgba(13, 110, 253, 0.3) !important;
    transition: all 0.3s ease !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 0.4rem !important;
    flex-grow: 1;
  }

  .cart-btn:hover {
    color: #ffffff !important;
    background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%) !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 20px rgba(13, 110, 253, 0.45) !important;
  }

  .quantity-input {
    width: 75px !important;
    border-radius: 999px !important;
    text-align: center !important;
    font-weight: 700 !important;
    border: 1.5px solid #cbd5e1 !important;
    padding: 0.55rem 0.5rem !important;
  }

  .quantity-input:focus {
    border-color: #0d6efd !important;
    box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.15) !important;
  }

  .search-btn {
    background: linear-gradient(135deg, #0d6efd 0%, #2563eb 100%) !important;
    color: #ffffff !important;
    font-weight: 700 !important;
    border-radius: 999px !important;
    padding: 0.7rem 1.5rem !important;
    border: none !important;
    box-shadow: 0 4px 14px rgba(13, 110, 253, 0.25) !important;
    transition: all 0.3s ease !important;
  }

  .search-btn:hover {
    color: #ffffff !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 20px rgba(13, 110, 253, 0.35) !important;
  }

  .search-input {
    border-radius: 999px !important;
    padding: 0.75rem 1.25rem !important;
    border: 1.5px solid #cbd5e1 !important;
  }

  .search-input:focus {
    border-color: #0d6efd !important;
    box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.12) !important;
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
      <div class="brand-logo"><i class="bi bi-shop"></i></div>
      <div class="brand-text">
        <h1 class="brand-title">AORTech</h1>
        <p class="brand-subtitle">Smart Digital Store</p>
      </div>
    </a>

    <div class="nav-links me-auto">
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop">Home</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/offers">Offres</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/marques">Marques</a>
      <a class="nav-pill" href="${pageContext.request.contextPath}/shop/contact">Contact</a>
    </div>

    <div class="header-actions d-flex align-items-center gap-3">
      <!-- Profile Icon & Dropdown -->
      <div class="dropdown">
        <button class="nav-icon-btn btn border-0 p-0 position-relative" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Mon Compte">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
          </svg>
        </button>
        <ul class="dropdown-menu dropdown-menu-end rounded-4 shadow-lg border-0 p-2 mt-2" style="min-width: 220px;">
          <c:choose>
            <c:when test="${sessionScope.shopCustomer != null}">
              <li class="px-3 py-2 border-bottom mb-1">
                <small class="text-muted d-block" style="font-size: 0.75rem;">Connecté en tant que</small>
                <span class="fw-bold text-dark fs-6">${sessionScope.shopCustomer.firstName} ${sessionScope.shopCustomer.lastName}</span>
              </li>
              <li><a class="dropdown-item rounded-3 py-2 fw-medium" href="${pageContext.request.contextPath}/shop/profile"><i class="bi bi-person-circle me-2 text-primary"></i>Mon Profil</a></li>
              <li><a class="dropdown-item rounded-3 py-2 fw-medium" href="${pageContext.request.contextPath}/shop/orders"><i class="bi bi-box-seam me-2 text-primary"></i>Mes Commandes</a></li>
              <li><hr class="dropdown-divider my-1"></li>
              <li><a class="dropdown-item rounded-3 py-2 fw-bold text-danger" href="${pageContext.request.contextPath}/shop/logout"><i class="bi bi-box-arrow-right me-2"></i>Déconnexion</a></li>
            </c:when>
            <c:otherwise>
              <li class="px-3 py-1 mb-1">
                <span class="fw-bold text-dark fs-6">Espace Client</span>
              </li>
              <li><a class="dropdown-item rounded-3 py-2 fw-semibold text-primary" href="${pageContext.request.contextPath}/shop/login"><i class="bi bi-box-arrow-in-right me-2"></i>Se connecter</a></li>
              <li><a class="dropdown-item rounded-3 py-2 fw-medium" href="${pageContext.request.contextPath}/shop/register"><i class="bi bi-person-plus me-2"></i>Créer un compte</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>

      <!-- Panier Icon with Count Badge -->
      <a href="${pageContext.request.contextPath}/cart" class="nav-icon-btn position-relative" title="Panier">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
          <path d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
        </svg>
        <span class="cart-badge-counter">
          ${cartCount != null ? cartCount : 0}
        </span>
      </a>
    </div>
  </div>
</nav>

<div class="hero-strip"></div>

<div class="container py-4">
