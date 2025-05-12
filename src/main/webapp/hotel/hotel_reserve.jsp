<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      예약구분
                    </th>
                    <td width="80%" style="color: red">[객실] 확정예약</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      호텔명
                    </th>
                    <td width="80%">서머셋 제주신화월드</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      객실타입
                    </th>
                    <td width="80%">패밀리 스위트</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      이용기간
                    </th>
                    <td width="80%">2025.04.18(금) ~ 2025.04.20(토)/ 2박</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      구매 객실 수
                    </th>
                    <td width="80%">1개</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      객실옵션
                    </th>
                    <td width="80%"></td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      추가옵션
                    </th>
                    <td width="80%"></td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      총 투숙인원
                    </th>
                    <td width="80%">성인 2명</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      무료 취소 기간
                    </th>
                    <td width="80%">7일전</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
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
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      상품 금액
                    </th>
                    <td width="80%">339,000원</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      객실 옵션 금액
                    </th>
                    <td width="80%">0원</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      쿠폰 할인
                    </th>
                    <td width="80%">-0원</td>
                  </tr>

                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      포인트
                    </th>
                    <td width="80%">-0원</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="text-right">
                      총 결제금액 &nbsp;
                      <span
                        style="font-weight: 700; font-size: 24px; color: black"
                        >339,000원</span
                      >
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
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      예약자명
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="홍길동"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      이메일
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="hong@hong.com"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      휴대폰 번호
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="010-0000-0000"
                      />
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
                    type="submit"
                    value="결제하기"
                    class="form-control r-12 btn btn-primary"
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
</body>
</html>