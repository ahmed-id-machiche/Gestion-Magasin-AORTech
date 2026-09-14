<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>${pageTitle != null ? pageTitle : 'Gestion Magasin'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
      :root {
        --brand-primary: #0d6efd;
        --brand-dark: #0b1220;
        --brand-card-bg: #ffffff;
        --text-soft: rgba(255,255,255,0.78);
        --glass: rgba(255,255,255,0.08);
        --border-soft: rgba(255,255,255,0.12);
      }
      * { font-family: 'Poppins', sans-serif; }
      body {
        background: #f1f5f9;
        color: #0f172a;
      }
      .shop-navbar {
        position: sticky; top: 0; z-index: 1030;
        background: linear-gradient(135deg, #0b1220 0%, #111827 45%, #172554 100%);
        backdrop-filter: blur(12px);
        box-shadow: 0 10px 30px rgba(2, 6, 23, 0.28);
        border-bottom: 1px solid rgba(255,255,255,0.08);
      }
      .brand-wrap { display:flex; align-items:center; gap:.9rem; text-decoration:none; }
      .brand-logo {
        width:48px; height:48px; border-radius:14px; display:flex; align-items:center; justify-content:center;
        font-size:1.2rem; font-weight:800; color:#fff;
        background: linear-gradient(135deg, var(--brand-primary), #3b82f6, #06b6d4);
        box-shadow: 0 0 0 4px rgba(255,255,255,.06), 0 10px 22px rgba(13,110,253,.35);
      }
      .brand-title {
        margin:0; font-size:1.35rem; font-weight:800;
        background: linear-gradient(90deg,#fff,#bfdbfe,#93c5fd);
        -webkit-background-clip:text; -webkit-text-fill-color:transparent;
      }
      .brand-subtitle { margin:0; font-size:.7rem; letter-spacing:2px; text-transform:uppercase; color:var(--text-soft); }
      .action-btn {
        border-radius:999px; padding:.5rem 1.1rem; font-weight:600; font-size:0.88rem;
        border:1px solid rgba(255,255,255,.14); color:#fff; background:rgba(255,255,255,.05);
        transition: all 0.3s ease;
      }
      .action-warning { background: linear-gradient(135deg,#ef4444,#dc2626); color:#ffffff; border:none; }
      .action-warning:hover { color:#ffffff; transform: translateY(-2px); box-shadow: 0 6px 16px rgba(239,68,68,0.35); }
      .hero-strip { height:3px; background: linear-gradient(90deg,#0d6efd,#06b6d4,#22c55e,#f59e0b); }
      
      /* Sidebar Styling */
      .sidebar {
        min-height: calc(100vh - 70px);
        background: linear-gradient(180deg, #0b1220 0%, #0f172a 100%);
        border-right: 1px solid rgba(255,255,255,.06);
        padding-top: 1rem;
      }
      .sidebar a {
        color: #94a3b8; text-decoration: none; display: flex; align-items: center;
        padding: 0.8rem 1.25rem; font-weight: 500; font-size: 0.92rem;
        border-left: 3px solid transparent; transition: all .25s ease; margin-bottom: 0.2rem;
      }
      .sidebar a:hover {
        background: rgba(255,255,255,0.06); color: #ffffff; padding-left: 1.5rem;
      }
      .sidebar a.active {
        background: linear-gradient(90deg, rgba(13,110,253,0.25), rgba(13,110,253,0.05));
        color: #60a5fa; border-left-color: #3b82f6; font-weight: 700;
      }
      
      /* Creative Dashboard Styles */
      .content { padding: 1.75rem; }
      .kpi-card {
        border: none;
        border-radius: 20px;
        background: #ffffff;
        box-shadow: 0 10px 30px rgba(15, 23, 42, 0.05);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
      }
      .kpi-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 40px rgba(15, 23, 42, 0.1);
      }
      .kpi-icon-wrap {
        width: 56px;
        height: 56px;
        border-radius: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
      }
      .kpi-revenue { background: linear-gradient(135deg, #10b981, #059669); color: #fff; }
      .kpi-sales { background: linear-gradient(135deg, #3b82f6, #1d4ed8); color: #fff; }
      .kpi-products { background: linear-gradient(135deg, #8b5cf6, #6d28d9); color: #fff; }
      .kpi-warning { background: linear-gradient(135deg, #f59e0b, #d97706); color: #fff; }
      .kpi-categories { background: linear-gradient(135deg, #06b6d4, #0891b2); color: #fff; }
      .kpi-customers { background: linear-gradient(135deg, #ec4899, #be185d); color: #fff; }
      .kpi-suppliers { background: linear-gradient(135deg, #64748b, #475569); color: #fff; }

      .chart-container-card {
        border: none;
        border-radius: 24px;
        background: #ffffff;
        box-shadow: 0 12px 32px rgba(15, 23, 42, 0.06);
        padding: 1.5rem;
      }

      .welcome-hero-card {
        background: linear-gradient(135deg, #0b1220 0%, #1e293b 60%, #172554 100%);
        border-radius: 24px;
        color: #ffffff;
        padding: 1.75rem 2rem;
        box-shadow: 0 15px 35px rgba(2, 6, 23, 0.2);
        position: relative;
        overflow: hidden;
      }

      .welcome-hero-card::after {
        content: "";
        position: absolute;
        right: -40px;
        top: -40px;
        width: 200px;
        height: 200px;
        background: radial-gradient(circle, rgba(59,130,246,0.2), transparent 70%);
        border-radius: 50%;
      }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg shop-navbar">
  <div class="container d-flex align-items-center justify-content-between py-2">
    <a class="brand-wrap navbar-brand m-0" href="${pageContext.request.contextPath}/dashboard">
      <div class="brand-logo">AD</div>
      <div>
        <h1 class="brand-title">AORTech Admin</h1>
        <p class="brand-subtitle">Back Office</p>
      </div>
    </a>
    <div class="d-flex align-items-center gap-2">
      <span class="text-white">${sessionScope.currentUser.fullname}</span>
      <a href="${pageContext.request.contextPath}/logout" class="btn action-btn action-warning">Logout</a>
    </div>
  </div>
</nav>
<div class="hero-strip"></div>
<div class="container-fluid">
  <div class="row">

