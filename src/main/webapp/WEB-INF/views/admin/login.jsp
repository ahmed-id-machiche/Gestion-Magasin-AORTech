<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Connexion Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/theme.css?v=20260405" rel="stylesheet">
  
</head>
<body class="d-flex align-items-center admin-login-page">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card admin-login-card">
        <div class="card-body p-4">
          <h4 class="mb-3 text-center admin-login-title">Connexion Admin</h4>
          <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
          <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-3"><label class="form-label">Username</label><input name="username" class="form-control" required></div>
            <div class="mb-3"><label class="form-label">Mot de passe</label><input type="password" name="password" class="form-control" required></div>
            <button class="btn btn-primary w-100">Se connecter</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

