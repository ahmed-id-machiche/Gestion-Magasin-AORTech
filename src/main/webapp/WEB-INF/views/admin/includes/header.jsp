<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>${pageTitle != null ? pageTitle : 'Gestion Magasin'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
      :root {
        --brand-primary: #0d6efd;
        --text-soft: rgba(255,255,255,0.78);
        --glass: rgba(255,255,255,0.08);
        --border-soft: rgba(255,255,255,0.12);
      }
      * { font-family: 'Poppins', sans-serif; }
      body {
        background:
          radial-gradient(circle at top left, rgba(13,110,253,0.08), transparent 30%),
          linear-gradient(to bottom, #f8fafc, #eef2f7);
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
        width:52px; height:52px; border-radius:16px; display:flex; align-items:center; justify-content:center;
        font-size:1.25rem; font-weight:800; color:#fff;
        background: linear-gradient(135deg, var(--brand-primary), #3b82f6, #06b6d4);
        box-shadow: 0 0 0 4px rgba(255,255,255,.06), 0 10px 22px rgba(13,110,253,.35);
      }
      .brand-title {
        margin:0; font-size:1.4rem; font-weight:800;
        background: linear-gradient(90deg,#fff,#bfdbfe,#93c5fd);
        -webkit-background-clip:text; -webkit-text-fill-color:transparent;
      }
      .brand-subtitle { margin:0; font-size:.72rem; letter-spacing:2px; text-transform:uppercase; color:var(--text-soft); }
      .action-btn {
        border-radius:999px; padding:.55rem 1rem; font-weight:600;
        border:1px solid rgba(255,255,255,.14); color:#fff; background:rgba(255,255,255,.05);
      }
      .action-warning { background: linear-gradient(135deg,#f59e0b,#fbbf24); color:#111827; border:none; }
      .hero-strip { height:3px; background: linear-gradient(90deg,#0d6efd,#06b6d4,#22c55e,#f59e0b); }
      .sidebar {
        min-height: calc(100vh - 72px);
        background: linear-gradient(180deg, #111827, #0f172a);
        border-right: 1px solid rgba(255,255,255,.08);
      }
      .sidebar a {
        color:#cbd5e1; text-decoration:none; display:block; padding:.75rem 1rem;
        border-bottom:1px solid rgba(255,255,255,.04); transition:all .25s ease;
      }
      .sidebar a:hover { background: rgba(59,130,246,.15); color:#fff; padding-left:1.2rem; }
      .content { padding:1.5rem; }
      .content .card {
        border:1px solid #e2e8f0; border-radius:16px;
        background: linear-gradient(180deg, #ffffff, #f8fbff);
        box-shadow: 0 10px 24px rgba(15,23,42,.08);
      }
      .content .table {
        background:#fff; border:1px solid #e2e8f0; border-radius:14px; overflow:hidden;
      }
      .content .table thead th {
        background:#f8fafc; color:#334155; font-weight:700; border-color:#e2e8f0;
      }
      .content .form-control, .content .form-select {
        border-radius:12px; border:1px solid #cbd5e1;
      }
      .content .form-control:focus, .content .form-select:focus {
        border-color:#60a5fa; box-shadow:0 0 0 .2rem rgba(96,165,250,.15);
      }
      .content .btn { border-radius:999px; }
      .content .btn-primary { background:linear-gradient(135deg,#0d6efd,#2563eb); border:none; }
      .content .btn-warning { background:linear-gradient(135deg,#f59e0b,#fbbf24); border:none; color:#111827; }
      .content .btn-danger { background:linear-gradient(135deg,#ef4444,#dc2626); border:none; }
      .content .btn-success { background:linear-gradient(135deg,#16a34a,#22c55e); border:none; }
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

