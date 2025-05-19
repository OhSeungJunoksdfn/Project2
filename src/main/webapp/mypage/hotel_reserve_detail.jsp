<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="ftco-section ftco-degree-bg" style="margin-left: 20px;">
      <div class="container">
        <div class="row shadow r-12 secb py-3 px-3">
          <div class="col-lg-12">
            <!---->
            <div
              class="row mb-5 justify-content-between align-items-center bb-3"
            >
              <h3>예약 상세보기</h3>
              <div>
                <span style="font-weight: 700">예약완료</span>
              </div>
            </div>
            <!---->
            <!--테이블 시작-->
            <div class="row mb-3">
              <h4 class="col-12">예약정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      예약구분
                    </th>
                    <td width="80%" style="color: red">[객실 예약]</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      호텔명
                    </th>
                    <td width="80%">${vo.hotel_title }</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      객실타입
                    </th>
                    <td width="80%">${vo.room_title }</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      구매 객실 수
                    </th>
                    <td width="80%">1개</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      예약 기간
                    </th>
                    <td width="80%">${vo.stay_days }박 ${vo.stay_days+1 }일</td>
                  </tr>
                  
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      체크 인
                    </th>
                    <td width="80%">${vo.checkinStr } ${vo.checkintime }시부터</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      체크 아웃
                    </th>
                    <td width="80%">${vo.checkoutStr } ${vo.checkouttime }시까지</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      총 투숙인원
                    </th>
                    <td width="80%">${vo.person }명</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      무료 취소 기간
                    </th>
                    <td width="80%">7일전</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      추가할인
                    </th>
                    <td width="80%"></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--테이블 끝-->
            <!--결제정보 시작-->
            <div class="row mb-3">
              <h4 class="col-12">결제정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      상품 금액
                    </th>
                    <td width="80%"><fmt:formatNumber value="${vo.total_price}" type="number" groupingUsed="true"/>원</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      객실 옵션 금액
                    </th>
                    <td width="80%">0원</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      쿠폰 할인
                    </th>
                    <td width="80%">-0원</td>
                  </tr>

                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      사용된 포인트
                    </th>
                    <td width="80%">-0원</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="text-right">
                      총 결제금액 &nbsp;
                      <span style="font-weight: 700; font-size: 24px; color: black">
                        <fmt:formatNumber value="${vo.total_price}" type="number" groupingUsed="true"/>원
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--결제정보 끝-->
            <!--예약자 정보 시작-->
            <div class="row mb-3">
              <h4 class="col-3">예약자 정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      예약자명
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.username}"/>
                    </td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      이메일
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.useremail}"/>
                    </td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      휴대폰 번호
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.userphone}"/>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--예약자 정보 끝-->
            <div class="row justify-content-center">
              <div class="form-group m-2">
                <div class="form-field">
                  <input
                    type="button"
                    value="예약자 정보수정"
                    class="form-control r-12 btn btn-primary"
                    id="btn_payment"
                  />
                </div>
              </div>
              <div class="form-group m-2">
                <div class="form-field">
                 <a href="javascript:history.back()">
                  <input
                    type="submit"
                    value="목록"
                    class="form-control r-12 btn btn-info"
                  />
                 </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</body>
</html>