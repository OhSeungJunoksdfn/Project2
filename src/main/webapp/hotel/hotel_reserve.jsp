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
<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row shadow r-12 secb py-3 px-3">
          <div class="col-lg-12">
            <!---->
            <div
              class="row mb-5 justify-content-between align-items-center bb-3"
            >
              <h3>예약하기</h3>
              <div>
                <span style="font-weight: 700">예약정보</span> > 예약완료
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
                    <td width="80%" style="color: red">[객실] 확정예약</td>
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
                    <td width="80%">${vo.title }</td>
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
                    <td width="80%">${stay_day }박 ${stay_day+1 }일</td>
                  </tr>
                  
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      체크 인
                    </th>
                    <td width="80%">${checkin} ${vo.checkintime }시부터</td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      체크 아웃
                    </th>
                    <td width="80%">${checkout } ${vo.checkouttime }시까지</td>
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
            <!--할인 테이블-->
            <div class="row mb-3">
              <h4 class="col-12">할인/포인트</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      쿠폰 할인
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="20"
                        value="0"
                      />
                      <p style="float: left; padding-left: 10px;" class="py-1">
                        원 사용가능쿠폰:<span style="color: #34c0e7">0장</span>
                      </p>
                       <input
                    type="button"
                    value="쿠폰"
                    class="btn btn-primary ml-2"
                    style="border-radius: 6px;"
                 	/>
                       
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      포인트
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="20"
                        value="0"
                      />
                      <p style="float: left; padding-left: 10px" class="py-1">
                        P 사용 보유포인트(<span style="color: #34c0e7">0</span>)
                      </p>
                      <input
	                    type="button"
	                    value="모두 사용"
	                    class="btn btn-primary ml-2"
	                    style="border-radius:6px"
	                  />
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--할인테이블 끝-->
            <!--결제정보 시작-->
            <div class="row mb-3">
              <h4 class="col-12">결제정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      상품 금액
                    </th>
                    <td width="80%"><fmt:formatNumber value="${price_total}" type="number" groupingUsed="true"/>원</td>
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
                      포인트
                    </th>
                    <td width="80%">-0원</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="text-right">
                      총 결제금액 &nbsp;
                      <span style="font-weight: 700; font-size: 24px; color: black">
                        <fmt:formatNumber value="${price_total}" type="number" groupingUsed="true"/>원
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
              <span class="col-9 text-right">
                <input type="checkbox" /> 예약자와 투숙자의 정보가 다를시 체크
              </span>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      예약자명
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.name}"/>
                    </td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      이메일
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.email}"/>
                    </td>
                  </tr>
                  <tr>
                    <th width="20%" style="background-color: #e9e9e9; color: black">
                      휴대폰 번호
                    </th>
                    <td width="80%">
                      <input type="text" style="float: left" size="50" value="${vo.phone}"/>
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
                    value="결제하기"
                    class="form-control r-12 btn btn-primary"
                    id="btn_payment"
                  />
                </div>
              </div>
              <div class="form-group m-2">
                <div class="form-field">
                  <input
                    type="submit"
                    value="취소하기"
                    class="form-control r-12 btn btn-info"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- .section -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$("#btn_payment").click(function () {
    // 아임포트 초기화
    IMP.init("imp06561258");

    // 고유 주문번호 생성
    var merchant_uid = 'order_' + new Date().getTime();

    // 결제 요청
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: "[호텔 예약] ${vo.hotel_title} ${vo.title}",
        amount: ${price_total},
        buyer_email: "${vo.email}",
        buyer_name: "${vo.name}",
        buyer_tel: "${vo.phone}",
        buyer_addr: "",
        buyer_postcode: ""
    }, function (rsp) {
        // ✅ 결제 결과와 상관없이 insert 요청
        $.ajax({
            type: "POST",
            url: "../hotel/hotel_reserve_insert_vue.do",
            data: {
            	// 값 바인딩 시 form 태그 이용하면 편함 (혹은 JSON 사용 원하시면 gpt 찾아보시면 잘 나와있는 듯 합니다.)
            	// 이미 작성을 해버렸다면 ?
            	// *** 컬럼명: 객체값 형태로 작성 
            	// *** 테이블의 컬럼명 = ReserVO의 필드명 = data의 data명 모두 일치 해야함.
            	// 숫자열은 그냥 작성, 문자열은 따옴표 필수
            	hotel_no: ${vo.hotel_no},
                room_no: ${vo.no},
                username: "${vo.name}",
                userphone: "${vo.phone}",
                useremail: "${vo.email}",
                checkin: "${checkin}",
                checkout: "${checkout}",
                person: ${person},
                total_price: ${price_total},
                stay_days: ${stay_day},
                imp_uid: rsp.imp_uid || "",				// 결제 번호 생성 => 관련 실패 시 빈 문자열
                merchant_uid: rsp.merchant_uid || merchant_uid, // 주문 번호 생성 관련
                amount: rsp.paid_amount || 0,			// 결제 금액 관련
                success: rsp.success					// 성공 여부 플래그
            },
            success: function () {
                // 항상 완료 페이지로 이동 (RestController void로 변경)
                window.location.href = "../hotel/hotel_reserve_ok.do"
            },
            error: function () {
                alert("예약 저장 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
            }
        });
    });
});
</script>
</body>
</html>