<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2 class="fw-bold mb-0">Mon Panier</h2>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/shop">Continuer achats</a>
  </div>

  <c:if test="${not empty param.error}">
    <div class="alert alert-danger">${param.error}</div>
  </c:if>

  <div class="cart-card p-3 p-md-4">
    <c:choose>
      <c:when test="${empty cartItems}">
        <div class="alert alert-info mb-0">Panier vide.</div>
      </c:when>
      <c:otherwise>
        <div class="table-responsive">
          <table class="table align-middle">
            <thead>
            <tr>
              <th>Produit</th>
              <th>Prix</th>
              <th style="width: 200px;">Quantite</th>
              <th>Sous-total</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cartItems}" var="item">
              <tr>
                <td>${item.productName}</td>
                <td>${item.unitPrice} MAD</td>
                <td>
                  <form method="post" action="${pageContext.request.contextPath}/cart" class="d-flex gap-2">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="productId" value="${item.productId}">
                    <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/cart">
                    <input type="number" class="form-control" min="1" name="quantity" value="${item.quantity}" required>
                    <button class="btn btn-outline-primary">OK</button>
                  </form>
                </td>
                <td>${item.subtotal} MAD</td>
                <td>
                  <form method="post" action="${pageContext.request.contextPath}/cart">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="productId" value="${item.productId}">
                    <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/cart">
                    <button class="btn btn-danger btn-sm">Supprimer</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2">
          <h5 class="mb-0">Total: <span class="text-primary fw-bold">${cartTotal} MAD</span></h5>
          <a class="btn btn-success" href="${pageContext.request.contextPath}/checkout">Passer au paiement</a>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
