<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
  <div class="orders-hero mb-4">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <p class="orders-kicker mb-2">Historique client</p>
        <h2 class="orders-title mb-2">Mes commandes</h2>
        <p class="orders-subtitle mb-0">
          Consulte l’historique de tes achats et accède rapidement à chaque reçu.
        </p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="orders-badge-box d-inline-block">
          <span class="orders-badge-label">Commandes</span>
          <span class="orders-badge-value">${orders.size()}</span>
        </div>
      </div>
    </div>
  </div>

  <div class="orders-card card border-0 shadow-lg rounded-4 overflow-hidden">
    <div class="orders-card-top"></div>
    <div class="table-responsive">
      <table class="table orders-table align-middle mb-0">
        <thead>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>Total</th>
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${orders}" var="o">
            <tr>
              <td>
                <span class="order-id-badge">#${o.id}</span>
              </td>
              <td>
                <span class="order-date">${o.saleDate}</span>
              </td>
              <td>
                <span class="order-total">${o.totalAmount} MAD</span>
              </td>
              <td class="text-center">
                <a class="btn receipt-btn" href="${pageContext.request.contextPath}/shop/receipt?id=${o.id}">
                  Voir reçu
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  
</div>
<%@ include file="includes/footer.jsp" %>







