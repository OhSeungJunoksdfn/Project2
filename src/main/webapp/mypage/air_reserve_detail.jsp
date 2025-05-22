<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>항공권 예약 상세보기</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    .wrap { width:100%; text-align:center; }
    .tab_nav li { display:inline-block; margin:0 20px; }
    .tab_nav a {
      display:inline-block; width:220px; text-align:center;
      padding:10px 0; color:gray; text-decoration:none;
      border-bottom:3px solid transparent;
    }
    .tab_nav a.active {
      border-bottom:3px solid #4eb8d1;
      color:#4eb8d1; font-weight:bold;
    }
    .table { font-size:14px; color:black; width:100%; }
    .bb-3 { border-bottom:3px solid #e9e9e9; margin-bottom:15px; padding-bottom:10px; }
    .r-12 { border-radius:12px; }
    .secb { background:#fff; border-radius:8px; }
  </style>
</head>
<body>
<div class="wrap">
  <section class="ftco-section ftco-degree-bg" style="margin:20px;">
    <div class="container">
      <div class="row shadow r-12 secb py-3 px-3">
        <div class="col-lg-12">

          <!-- 헤더 -->
          <div class="row mb-5 justify-content-between align-items-center bb-3">
            <h3>예약 상세보기</h3>
            <div>
              <span style="font-weight:700; color:green;">예약완료</span>
            </div>
          </div>

          <!-- 예약정보 -->
          <div class="row mb-3">
            <h4 class="col-12">예약정보</h4>
            <table class="table" style="border-top:3px solid gray;">
              <tbody>
                <tr>
                  <th style="background:#e9e9e9;">예약구분</th>
                  <td style="color:red;">[항공권 예약]</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">예약번호</th>
                  <td>${vo.reservationId}</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">항공사 / 편명</th>
                  <td>${vo.airlineCode} / ${vo.flightNumber}</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">출발 → 도착</th>
                  <td>${vo.depAirportCode} (${vo.depDate} ${vo.depTime}) 
                      → ${vo.arrAirportCode} (${vo.arrDate} ${vo.arrTime})</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">선택 좌석</th>
                  <td>${vo.seats}</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">인원</th>
                  <td>성인 ${vo.adults}명 / 소아 ${vo.children}명</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">예약일시</th>
                  <td><fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 결제정보 -->
          <div class="row mb-3">
            <h4 class="col-12">결제정보</h4>
            <table class="table" style="border-top:3px solid gray;">
              <tbody>
                <tr>
                  <th style="background:#e9e9e9;">운임 합계</th>
                  <td><fmt:formatNumber value="${vo.economyCharge}" type="number" groupingUsed="true"/>원</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">쿠폰 할인</th>
                  <td>-<fmt:formatNumber value="${vo.couponDiscount}" type="number" groupingUsed="true"/>원</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">포인트 사용</th>
                  <td>-<fmt:formatNumber value="${vo.usedPoints}" type="number" groupingUsed="true"/>원</td>
                </tr>
                <tr>
                  <td colspan="2" class="text-right">
                    총 결제금액&nbsp;
                    <span style="font-weight:700; font-size:24px;">
                      <fmt:formatNumber value="${vo.totalPrice}" type="number" groupingUsed="true"/>원
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 예약자 정보 -->
          <div class="row mb-3">
            <h4 class="col-12">예약자 정보</h4>
            <table class="table" style="border-top:3px solid gray;">
              <tbody>
                <tr>
                  <th style="background:#e9e9e9;">예약자명</th>
                  <td>${vo.userName}</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">이메일</th>
                  <td>${vo.userEmail}</td>
                </tr>
                <tr>
                  <th style="background:#e9e9e9;">휴대폰번호</th>
                  <td>${vo.userPhone}</td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 버튼 -->
          <div class="row justify-content-center">
            <div class="form-group m-2">
              <div class="form-field">
                <a href="../mypage/air_reserve_update.do?reservationId=${vo.reservationId}">
                  <input type="button" value="예약정보 수정" class="form-control r-12 btn btn-primary"/>
                </a>
              </div>
            </div>
            <div class="form-group m-2">
              <div class="form-field">
                <a href="javascript:history.back()">
                  <input type="button" value="목록" class="form-control r-12 btn btn-info"/>
                </a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </section>
</div>
</body>
</html>
