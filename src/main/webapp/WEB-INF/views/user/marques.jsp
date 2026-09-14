<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<style>
  .brands-container {
    background-color: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
    overflow: hidden;
    margin-top: 1.5rem;
    margin-bottom: 3rem;
  }

  .brands-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
  }

  @media (max-width: 1199.98px) {
    .brands-grid {
      grid-template-columns: repeat(4, 1fr);
    }
  }

  @media (max-width: 767.98px) {
    .brands-grid {
      grid-template-columns: repeat(3, 1fr);
    }
  }

  @media (max-width: 575.98px) {
    .brands-grid {
      grid-template-columns: repeat(2, 1fr);
    }
  }

  .brand-tile {
    height: 130px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-right: 1px solid #f0f0f0;
    border-bottom: 1px solid #f0f0f0;
    padding: 1.5rem;
    background: #ffffff;
    transition: all 0.25s ease;
    text-decoration: none !important;
    position: relative;
    cursor: pointer;
  }

  .brand-tile:hover {
    background: #f8fafc;
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(13, 110, 253, 0.15);
    z-index: 2;
  }

  /* Custom Brand Typography Styling */
  .brand-text-sony { font-family: Arial, sans-serif; font-weight: 400; font-size: 1.4rem; color: #222222; letter-spacing: 1px; }
  .brand-text-pantum { font-family: Arial, sans-serif; font-weight: 700; font-size: 1.25rem; color: #444444; letter-spacing: 2px; }
  .brand-text-netgear { font-family: Arial, sans-serif; font-weight: 600; font-size: 1.15rem; color: #555555; letter-spacing: 3px; }
  .brand-text-maestro { font-family: Arial, sans-serif; font-weight: 500; font-size: 1.1rem; color: #666666; }
</style>

<div class="text-center my-3">
  <h2 class="fw-bold text-dark mb-1">Nos Marques Partenaires</h2>
  <p class="text-muted">Cliquez sur une marque pour découvrir tous les produits correspondants.</p>
</div>

<div class="brands-container">
  <div class="brands-grid">
    <!-- 1. SONY -->
    <a href="${pageContext.request.contextPath}/shop?brand=Sony" class="brand-tile" title="Voir les produits Sony">
      <span class="brand-text-sony">sony</span>
    </a>

    <!-- 2. PANTUM -->
    <a href="${pageContext.request.contextPath}/shop?brand=Pantum" class="brand-tile" title="Voir les produits Pantum">
      <span class="brand-text-pantum">PANTUM</span>
    </a>

    <!-- 3. NETGEAR -->
    <a href="${pageContext.request.contextPath}/shop?brand=Netgear" class="brand-tile" title="Voir les produits Netgear">
      <span class="brand-text-netgear">NETGEAR</span>
    </a>

    <!-- 4. Maestro Cloud -->
    <a href="${pageContext.request.contextPath}/shop?brand=Maestro" class="brand-tile" title="Voir les produits Maestro">
      <span class="brand-text-maestro">Maestro Cloud</span>
    </a>

    <!-- 5. Apple -->
    <a href="${pageContext.request.contextPath}/shop?brand=Apple" class="brand-tile" title="Voir les produits Apple">
      <svg width="36" height="44" viewBox="0 0 170 170" fill="#333333">
        <path d="M150.37 130.25c-2.45 5.66-5.35 10.87-8.71 15.66-4.58 6.53-8.33 11.05-11.22 13.56-4.48 4.12-9.28 6.23-14.42 6.35-3.69 0-8.14-1.05-13.32-3.18-5.19-2.12-9.97-3.17-14.34-3.17-4.58 0-9.49 1.05-14.75 3.17-5.26 2.13-9.5 3.24-12.74 3.35-4.34.13-9.16-1.9-14.49-6.09-3.26-2.64-7.14-7.24-11.66-13.82-7.29-10.53-13.06-22.37-17.3-35.53-4.25-13.16-6.37-25.29-6.37-36.39 0-14.73 3.8-27.18 11.41-37.35 7.61-10.17 17.41-15.34 29.4-15.51 4.58 0 9.77 1.25 15.58 3.75 5.81 2.5 9.94 3.75 12.39 3.75 2.12 0 6.31-1.29 12.57-3.87 6.26-2.58 11.39-3.79 15.39-3.63 11.75.52 21.09 4.7 28.02 12.54-10.36 6.26-15.43 14.88-15.21 25.86.22 8.65 3.51 16.03 9.87 22.14 6.36 6.11 14.12 9.72 23.27 10.83-2.61 7.74-6.08 15.33-10.42 22.77zM119.22 31.8c0-6.85 2.52-13.41 7.56-19.68 5.04-6.27 11.37-10.02 19-11.25.13 1.01.2 1.83.2 2.45 0 6.77-2.61 13.42-7.83 19.95-5.22 6.53-11.64 10.28-19.26 11.25-.13-.77-.19-1.68-.19-2.72z"/>
      </svg>
    </a>

    <!-- 6. HP -->
    <a href="${pageContext.request.contextPath}/shop?brand=HP" class="brand-tile" title="Voir les produits HP">
      <svg width="48" height="48" viewBox="0 0 100 100">
        <circle cx="50" cy="50" r="46" fill="#0096d6"/>
        <path d="M35 24h10l-12 52h-10zM57 24h10l-12 52h-10z" fill="#ffffff"/>
        <path d="M28 44h35v9h-35z" fill="#ffffff"/>
      </svg>
    </a>

    <!-- 7. Lenovo -->
    <a href="${pageContext.request.contextPath}/shop?brand=Lenovo" class="brand-tile" title="Voir les produits Lenovo">
      <div style="background-color: #e2231a; padding: 6px 16px; border-radius: 2px;">
        <span style="color: #ffffff; font-weight: 800; font-size: 1.3rem; letter-spacing: -0.5px; font-family: sans-serif;">Lenovo</span>
      </div>
    </a>

    <!-- 8. DELL Technologies -->
    <a href="${pageContext.request.contextPath}/shop?brand=Dell" class="brand-tile" title="Voir les produits Dell">
      <div class="text-center">
        <span style="font-weight: 800; font-size: 1.3rem; color: #0076ce; letter-spacing: 0.5px; font-family: Arial, sans-serif;">DELL</span>
        <span style="display: block; font-size: 0.65rem; color: #555; text-transform: uppercase; letter-spacing: 1.5px; font-weight: 600;">Technologies</span>
      </div>
    </a>

    <!-- 9. DELL Gaming -->
    <a href="${pageContext.request.contextPath}/shop?brand=Dell" class="brand-tile" title="Voir les produits Dell Gaming">
      <div class="text-center">
        <span style="font-weight: 800; font-size: 1.3rem; color: #0076ce; letter-spacing: 0.5px; font-family: Arial, sans-serif;">DELL</span>
        <span style="display: block; font-size: 0.75rem; color: #0076ce; font-weight: 700; letter-spacing: 1px;">Gaming</span>
      </div>
    </a>

    <!-- 10. ASUS -->
    <a href="${pageContext.request.contextPath}/shop?brand=Asus" class="brand-tile" title="Voir les produits Asus">
      <span style="font-weight: 900; font-size: 1.5rem; color: #00539b; font-style: italic; letter-spacing: 1px; font-family: Arial, sans-serif;">ASUS</span>
    </a>

    <!-- 11. ROG -->
    <a href="${pageContext.request.contextPath}/shop?brand=ROG" class="brand-tile" title="Voir les produits ROG">
      <div class="d-flex align-items-center gap-2">
        <svg width="32" height="32" viewBox="0 0 100 100" fill="#de1a24">
          <path d="M10 20 L80 20 L90 35 L40 60 L10 20 Z" />
          <path d="M45 65 L95 35 L85 80 L45 65 Z" />
        </svg>
        <span style="font-weight: 900; font-size: 1.1rem; color: #de1a24; font-style: italic; font-family: Arial, sans-serif;">ROG</span>
      </div>
    </a>

    <!-- 12. Microsoft -->
    <a href="${pageContext.request.contextPath}/shop?brand=Microsoft" class="brand-tile" title="Voir les produits Microsoft">
      <div class="d-flex align-items-center gap-2">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2px; width: 20px; height: 20px;">
          <div style="background: #f25022;"></div>
          <div style="background: #7fba00;"></div>
          <div style="background: #00a4ef;"></div>
          <div style="background: #ffb900;"></div>
        </div>
        <span style="font-weight: 600; font-size: 1.15rem; color: #737373; font-family: 'Segoe UI', sans-serif;">Microsoft</span>
      </div>
    </a>

    <!-- 13. EPSON -->
    <a href="${pageContext.request.contextPath}/shop?brand=Epson" class="brand-tile" title="Voir les produits Epson">
      <span style="font-weight: 800; font-size: 1.4rem; color: #003399; font-family: Arial, sans-serif; letter-spacing: 1px;">EPSON<sup>®</sup></span>
    </a>

    <!-- 14. Canon -->
    <a href="${pageContext.request.contextPath}/shop?brand=Canon" class="brand-tile" title="Voir les produits Canon">
      <span style="font-weight: 800; font-size: 1.5rem; color: #cc0000; font-family: 'Times New Roman', serif;">Canon</span>
    </a>

    <!-- 15. logitech -->
    <a href="${pageContext.request.contextPath}/shop?brand=Logitech" class="brand-tile" title="Voir les produits Logitech">
      <span style="font-weight: 700; font-size: 1.3rem; color: #000000; font-family: Arial, sans-serif;">logitech</span>
    </a>

    <!-- 16. EATON -->
    <a href="${pageContext.request.contextPath}/shop?brand=Eaton" class="brand-tile" title="Voir les produits Eaton">
      <span style="font-weight: 900; font-size: 1.5rem; color: #005eb8; font-family: Arial, sans-serif;">FAT·N</span>
    </a>

    <!-- 17. tp-link -->
    <a href="${pageContext.request.contextPath}/shop?brand=TP-Link" class="brand-tile" title="Voir les produits TP-Link">
      <div class="d-flex align-items-center gap-2">
        <svg width="24" height="24" viewBox="0 0 100 100" fill="#4ac4b6">
          <path d="M20 20 h60 v60 h-60 z" />
        </svg>
        <span style="font-weight: 700; font-size: 1.2rem; color: #4ac4b6; font-family: Arial, sans-serif;">tp-link</span>
      </div>
    </a>

    <!-- 18. kaspersky -->
    <a href="${pageContext.request.contextPath}/shop?brand=Kaspersky" class="brand-tile" title="Voir les produits Kaspersky">
      <span style="font-weight: 600; font-size: 1.2rem; color: #006d55; font-family: Arial, sans-serif;">kaspersky</span>
    </a>

    <!-- 19. Jabra -->
    <a href="${pageContext.request.contextPath}/shop?brand=Jabra" class="brand-tile" title="Voir les produits Jabra">
      <span style="font-weight: 800; font-size: 1.35rem; color: #222222; font-family: Arial, sans-serif;">Jabra<sup>®</sup></span>
    </a>

    <!-- 20. MSI -->
    <a href="${pageContext.request.contextPath}/shop?brand=MSI" class="brand-tile" title="Voir les produits MSI">
      <div class="d-flex align-items-center gap-2">
        <svg width="28" height="28" viewBox="0 0 100 100" fill="#d00000">
          <path d="M10 50 L50 10 L90 50 L50 90 Z"/>
        </svg>
        <span style="font-weight: 900; font-size: 1.4rem; color: #d00000; font-family: Arial, sans-serif; font-style: italic;">msi</span>
      </div>
    </a>

    <!-- 21. HUAWEI -->
    <a href="${pageContext.request.contextPath}/shop?brand=Huawei" class="brand-tile" title="Voir les produits Huawei">
      <div class="d-flex align-items-center gap-2">
        <svg width="24" height="24" viewBox="0 0 100 100" fill="#c8102e">
          <circle cx="50" cy="50" r="40"/>
        </svg>
        <span style="font-weight: 800; font-size: 1.05rem; color: #222222; font-family: Arial, sans-serif; letter-spacing: 1px;">HUAWEI</span>
      </div>
    </a>

    <!-- 22. HYPERX -->
    <a href="${pageContext.request.contextPath}/shop?brand=HyperX" class="brand-tile" title="Voir les produits HyperX">
      <span style="font-weight: 900; font-size: 1.3rem; color: #e31837; font-style: italic; font-family: Arial, sans-serif; letter-spacing: 1px;">HYPER<span style="color:#222;">X</span></span>
    </a>

    <!-- 23. aruba -->
    <a href="${pageContext.request.contextPath}/shop?brand=Aruba" class="brand-tile" title="Voir les produits Aruba">
      <span style="font-weight: 700; font-size: 1.35rem; color: #ff8200; font-family: Arial, sans-serif;">aruba</span>
    </a>

    <!-- 24. ALTAI Super WiFi -->
    <a href="${pageContext.request.contextPath}/shop?brand=Altai" class="brand-tile" title="Voir les produits Altai">
      <div class="text-center">
        <span style="font-weight: 900; font-size: 1.15rem; color: #d00000; font-family: Arial, sans-serif; letter-spacing: 1px;">ALTAI</span>
        <span style="display: block; font-size: 0.65rem; color: #d00000; font-weight: 600;">Super WiFi</span>
      </div>
    </a>
  </div>
</div>

<%@ include file="includes/footer.jsp" %>
