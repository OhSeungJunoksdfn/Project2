<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 예약 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.wrap {
	width: 100%;
	text-align: center;
}

.tab_nav li {
	display: inline-block;
	margin: 0 20px;
}

.tab_nav a {
	display: inline-block;
	width: 220px; 
	text-align: center;
	padding: 10px 0;
	color: gray;
	text-decoration: none;
	border-bottom: 3px solid transparent;
}

.tab_nav a.active {
	border-bottom: 3px solid #4eb8d1;
	color: #4eb8d1;
	font-weight: bold;
}

.tab_contents > div {
	display: none;
	margin-top: 25px;
	margin-left: 50px;
}
.table {
	font-size: 14px;
	color: black;
}
</style>
</head>
<body>
<div class="wrap">
  <!-- 상단 탭 (MyPage 전체 네비) -->
  <div class="tab">
    <ul class="mainTab_nav">
      <li class="mainTab"><a href="#" style="color: black; font-weight: bold;">항공권 예약 조회</a></li>
      <li class="mainTab"><a href="../mypage/car_reserve_list.do" style="color: black;">렌트카 예약 조회</a></li>
      <li class="mainTab"><a href="../mypage/hotel_reserve_list.do" style="color: black;">호텔 예약 조회</a></li>
    </ul>
  </div>
  <br>

  <!-- 항공권 예약 상태별 탭 -->
  <div class="tab">
    <ul class="tab_nav">
      <li><a href="#tab1">확정 대기 예약</a></li>
      <li><a href="#tab2">확정된 예약</a></li>
      <li><a href="#tab3">지난 예약</a></li>
    </ul>
  </div>

  <div class="tab_contents">
    <!-- 1) 확정 대기 예약 -->
    <div id="tab1">
      <table class="table">
        <thead>
          <tr>
            <th>예약번호</th>
            <th>항공사</th>
            <th>편명</th>
            <th>출발→도착</th>
            <th>출발일</th>
            <th>인원(성인/소아)</th>
            <th>상태</th>
            <th></th><th></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${waitingList}" var="res">
            <tr>
              <td>${res.reservationId}</td>
              <td>${res.airlineCode}</td>
              <td>${res.flightNumber}</td>
              <td>${res.depAirport} → ${res.arrAirport}</td>
              <td>${res.depDate}</td>
              <td>${res.adults} / ${res.children}</td>
              <td>${res.status}</td>
              <td style="padding:6px;">
                <a href="../mypage/air_reserve_detail.do?reservationId=${res.reservationId}">
                  <input type="button" value="예약 상세보기" class="btn btn-primary r-12"/>
                </a>
              </td>
              <td style="padding:6px;">
                <a class="btn btn-outline-danger r-12 cursor-pointer text-dark"
                   data-id="${res.reservationId}"
                   onclick="delAir(${res.reservationId})">예약 취소</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- 2) 확정된 예약 -->
    <div id="tab2">
      <table class="table">
        <thead>
          <tr>
            <th>예약번호</th>
            <th>항공사</th>
            <th>편명</th>
            <th>출발→도착</th>
            <th>출발일</th>
            <th>인원(성인/소아)</th>
            <th>상태</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${confirmedList}" var="res">
            <tr>
              <td>${res.reservationId}</td>
              <td>${res.airlineCode}</td>
              <td>${res.flightNumber}</td>
              <td>${res.depAirport} → ${res.arrAirport}</td>
              <td>${res.depDate}</td>
              <td>${res.adults} / ${res.children}</td>
              <td>${res.status}</td>
              <td style="padding:6px;">
                <a href="../mypage/air_reserve_detail.do?reservationId=${res.reservationId}">
                  <input type="button" value="예약 상세보기" class="btn btn-primary r-12"/>
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- 3) 지난 예약 -->
    <div id="tab3">
      <table class="table">
        <thead>
          <tr>
            <th>예약번호</th>
            <th>항공사</th>
            <th>편명</th>
            <th>출발→도착</th>
            <th>출발일</th>
            <th>인원(성인/소아)</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${pastList}" var="res">
            <tr>
              <td>${res.reservationId}</td>
              <td>${res.airlineCode}</td>
              <td>${res.flightNumber}</td>
              <td>${res.depAirport} → ${res.arrAirport}</td>
              <td>${res.depDate}</td>
              <td>${res.adults} / ${res.children}</td>
              <td style="padding:6px;">
                <a href="../mypage/air_reserve_detail.do?reservationId=${res.reservationId}">
                  <input type="button" value="예약 상세보기" class="btn btn-primary r-12"/>
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script>
$(function(){
  // 탭 컨텐츠 초기화
  $('.tab_contents > div').hide();
  $('.tab_nav a').click(function () {
    $('.tab_contents > div').hide().filter(this.hash).fadeIn();
    $('.tab_nav a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
});

// 항공권 예약 취소 AJAX
function delAir(id) {
  if (!confirm("정말 예약을 취소하시겠습니까?")) return;
  $.ajax({
    type: "POST",
    url: "../mypage/air_reserve_delete.do",
    data: { reservationId: id },
    success: function() {
      alert("예약이 취소되었습니다.");
      window.location.href = "../mypage/air_reserve_delete_ok.do";
    },
    error: function() {
      alert("취소 중 오류가 발생했습니다.");
    }
  });
}
</script>
</body>
</html>
