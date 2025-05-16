<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예약 내역</title>
  <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
  />
</head>
<body>
  <section class="container py-5">
    <h3 class="mb-4">내 예약 내역</h3>
    <c:choose>
      <c:when test="${not empty reservations}">
        <table class="table table-bordered text-center">
          <thead class="thead-light">
            <tr>
              <th>예약번호</th>
              <th>편명</th>
              <th>출발일시</th>
              <th>도착일시</th>
              <th>운임(₩)</th>
              <th>예약일</th>
              <th>상태</th>
              <th>취소</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="res" items="${reservations}">
              <tr>
                <td>${res.reservationId}</td>
                <td>${res.flightNumber}</td>
                <td>${res.depTime}</td>
                <td>${res.arrTime}</td>
                <td>
                  <c:choose>
                    <c:when test="${res.economyCharge == 0}">
                      결항
                    </c:when>
                    <c:otherwise>
                      ${res.economyCharge}₩
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>${res.bookingDate}</td>
                <td>${res.paymentStatus}</td>
                <td>
                  <form 
                    action="${pageContext.request.contextPath}/air/reserve/delete.do" 
                    method="post"
                    onsubmit="return confirm('정말 이 예약을 취소하시겠습니까?');"
                  >
                    <input type="hidden" name="reservationId" value="${res.reservationId}" />
                    <button type="submit" class="btn btn-sm btn-danger">
                      취소
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:when>
      <c:otherwise>
        <p>현재 예약 내역이 없습니다.</p>
      </c:otherwise>
    </c:choose>
    <div class="mt-3">
      <a href="${pageContext.request.contextPath}/air/air_reserve.do" class="btn btn-secondary">
        검색 화면으로 돌아가기
      </a>
    </div>
  </section>
</body>
</html>
