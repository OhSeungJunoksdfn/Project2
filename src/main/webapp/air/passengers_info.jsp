<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>승객 개인정보 입력</title>
  <style type="text/css">
    .errtext { font-size:12px; color:red; }
    input::-webkit-inner-spin-button, input::-webkit-outer-spin-button { opacity:0; }
    [type="radio"] { vertical-align:middle; appearance:none; border:2px solid gray; border-radius:50%; width:1.25em; height:1.25em; transition:border .5s; }
    [type="radio"]:checked { border:.4em solid #4eb8d1; }
    [type="radio"]:hover { box-shadow:0 0 0 .2em lightgray; cursor:pointer; }
  </style>
</head>
<body>
  <%-- 좌석 파라미터 분리 및 카운트 계산 --%>
  <c:set var="adultList" value="${fn:split(param.adultSeats, ',')}"/>
  <c:set var="childList" value="${fn:split(param.childSeats, ',')}"/>

  <c:if test="${not empty param.seats}">
    <div style="text-align:center; margin:20px 0; font-size:1.1rem;">
      선택 좌석: <strong>${param.seats}</strong>
    </div>
  </c:if>

  <section id="registerApp" class="d-flex justify-content-center align-items-center" style="min-height:100vh; margin:50px 0;">
    <div class="container secb shadow py-2" style="max-width:500px;">
      <h3 class="pl-3" style="color:#78d5ef;">승객 개인정보 입력</h3>
      <form ref="myform" method="post" action="../air/reserve.do">
	  <!-- BookingVO.bookingId 에 제대로 넘어가도록 model 의 booking.bookingId 사용 -->
	  <input type="hidden" name="bookingId"  value="${booking.bookingId}" />
	  <!-- flightId, adults, children, adultSeats, childSeats 는 기존처럼 param 으로 OK -->
	  <input type="hidden" name="flightId"    value="${param.flightId}" />
	  <input type="hidden" name="adults"      value="${param.adults}" />
	  <input type="hidden" name="children"    value="${param.children}" />
	  <input type="hidden" name="adultSeats"  value="${param.adultSeats}" />
	  <input type="hidden" name="childSeats"  value="${param.childSeats}" />

        <!-- 성인 승객 블록 반복 -->
        <c:forEach var="seat" items="${adultList}" varStatus="st">
          <div class="passenger-block mb-4">
            <h5>성인 승객 ${st.index+1} (좌석: ${seat})</h5>
            <!-- 여권번호 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">여권번호</p>
		      <input type="text" class="form-control"
		        name="passengers[${st.index}].passport_number"
		        maxlength="9" pattern="[1-9,A-Z]*"
		        placeholder="여권번호"/>
            </div>
            <!-- 이메일 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">이메일</p>
              <div class="input-group">
                 <input type="text" class="form-control"
			        name="passengers[${st.index}].email"
			        placeholder="이메일"/>
                <select name="passengers[${st.index}].emailPrefix" class="form-select" style="max-width:150px;">
                  <option>@naver.com</option><option>@daum.com</option><option>@google.co.kr</option>
                </select>
              </div>
            </div>
            <!-- 이름 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">이름</p>
              <div style="display:flex; gap:0.5rem;">
                 <input type="text" class="form-control"
			        name="passengers[${st.index}].first_name"
			        placeholder="성"/>
                 <input type="text" class="form-control"
			        name="passengers[${st.index}].last_name"
			        placeholder="이름"/>
              </div>
            </div>
            <!-- 생일 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">생일</p>
               <input type="date" class="form-control"
		        	name="passengers[${st.index}].birthday"/>
            </div>
            <!-- 휴대전화 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">휴대전화</p>
              <div style="display:flex;">
                <select name="passengers[${st.index}].phonePrefix" class="form-select" style="max-width:100px;"><option>010</option><option>011</option></select>
                <input type="tel" class="form-control" name="passengers[${st.index}].phone" maxlength="8" placeholder="숫자만 입력" />
              </div>
            </div>
            <!-- 성별 -->
            <div class="mb-2">
              <p style="font-size:16px; font-weight:500;">성별</p>
              <div>
                <label><input type="radio"
				        name="passengers[${st.index}].sex"
				        value="남자" checked/>남자</label>
                <label style="margin-left:1rem;"> <input type="radio"
						        name="passengers[${st.index}].sex"
						        value="여자"/>여자</label>
              </div>
            </div>
            <!-- 블록별 등록/취소 버튼 -->
            <div class="d-grid gap-2">
              <button type="button" class="btn btn-primary" @click="registerBlock()">등록</button>
              <button type="button" class="btn btn-info" onclick="history.back();">취소</button>
            </div>
          </div>
        </c:forEach>

        <!-- 소아 승객 블록 반복 -->
        <c:forEach var="seat" items="${childList}" varStatus="st">
   <!-- 소아 인덱스를 성인 수만큼 오프셋 -->
	<c:set var="i" value="${fn:length(adultList) + st.index}"></c:set>
   <div class="passenger-block mb-4">
     <h5>소아 승객 ${st.index+1} (좌석: ${seat})</h5>

     <!-- 여권번호 -->
     <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">여권번호</p>
       <input
         type="text"
         class="form-control"
         name="passengers[${i}].passport_number"
         maxlength="9"
         pattern="[1-9A-Z]*"
         placeholder="여권번호 (1-9, A-Z)" />
     </div>

     <!-- 이메일 -->
     <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">이메일</p>
       <div class="input-group">
         <input
           type="text"
           class="form-control"
           name="passengers[${i}].email"
           placeholder="이메일" />
         <select
           name="passengers[${i}].emailPrefix"
      	   class="form-select" style="max-width:150px;">
           <option>@naver.com</option>
           <option>@daum.com</option>
           <option>@google.co.kr</option>
         </select>
       </div>
     </div>

     <!-- 이름 -->
     <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">이름</p>
       <div style="display:flex; gap:0.5rem;">
         <input
           type="text"
           class="form-control"
           name="passengers[${i}].first_name"
           placeholder="성" />
         <input
           type="text"
           class="form-control"
          name="passengers[${i}].last_name"
           placeholder="이름" />
       </div>
     </div>

     <!-- 생일 -->
     <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">생일</p>
       <input
         type="date"
         class="form-control"
         name="passengers[${i}].birthday"
         id="birthday_child_${st.index}"
         onchange="calcChildAge(${st.index})" />
      <small id="age_display_${st.index}" class="errtext age-display"></small>
     </div>

     <!-- 휴대전화 -->
    <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">휴대전화</p>
       <div style="display:flex;">
         <select
          name="passengers[${i}].phonePrefix"
           class="form-select"
           style="max-width:100px;">
           <option>010</option>
           <option>011</option>
         </select>
         <input
           type="tel"
           class="form-control"
           name="passengers[${i}].phone"
           maxlength="8"
           placeholder="숫자만 입력" />
       </div>
     </div>

     <!-- 성별 -->
     <div class="mb-2">
       <p style="font-size:16px; font-weight:500;">성별</p>
       <div>
         <label>
           <input
             type="radio"
             name="passengers[${i}].sex"
             value="남자"
             checked /> 남자
         </label>
         <label style="margin-left:1rem;">
           <input
            type="radio"
           name="passengers[${i}].sex"
             value="여자" /> 여자
         </label>
       </div>
     </div>
            <!-- 블록별 등록/취소 버튼 -->
           <div class="d-grid gap-2">
                     <button type="button" class="btn btn-primary" @click="handleChildRegister(${st.index})">등록</button>
				      <button type="button" class="btn btn-info" onclick="history.back();">취소</button>
            </div>
          </div>
        </c:forEach>
      </form>
    </div>
  </section>

  <script>
    // 날짜 계산 함수
    function calcChildAge(idx) {
      const input = document.getElementById('birthday_child_' + idx);
      const dob = new Date(input.value);
      if (isNaN(dob)) return;
      const today = new Date();
      let age = today.getFullYear() - dob.getFullYear();
      const m = today.getMonth() - dob.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) age--;
      document.getElementById('age_display_' + idx).textContent = age + '세';
      return age;
    }
  </script>
  
    <script>
    const initialSelected = {
      airline_code:     '${flight.airline_code}',
      flight_number:    '${flight.flight_number}',
      dep_airport_code: '${flight.dep_airport_code}',
      dep_time:         '${flight.dep_time}',
      arr_airport_code: '${flight.arr_airport_code}',
      arr_time:         '${flight.arr_time}',
      economy_charge:   ${flight.economy_charge}
    };
  </script>

  <!-- Vue 및 제출 로직 -->
  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  
  <script>
    // totalCount 계산
    const adultCount = ${fn:length(adultList)};
    const childCount = ${fn:length(childList)};
    const totalCount = adultCount + childCount;

    Vue.createApp({
        data() {
          return { registeredCount: 0 };
        },
        methods: {
          registerBlock() {
            alert('승객정보 등록됐습니다.');
            this.registeredCount++;
            if (this.registeredCount === totalCount) {
              // 마지막 블록 등록 후 AJAX 호출
              this.sendAjax();
            }
          },
          handleChildRegister(idx) {
            const age = calcChildAge(idx);
            if (age >= 12) {
              alert('나이가 12세 이상이므로 소아 등록할 수 없습니다.');
              return;
            }
            this.registerBlock();
          },
          sendAjax() {
            // 1) 폼 데이터를 FormData 로 읽어오고
            const form = this.$refs.myform;
            const formData = new FormData(form);

            // 2) URLSearchParams 로 변환 (x-www-form-urlencoded)
            const params = new URLSearchParams();
            for (const [key, val] of formData.entries()) {
              params.append(key, val);
            }

            // 3) fetch 호출
            fetch(form.action, {
              method: 'POST',
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
              },
              body: params.toString()
            })
            .then(res => {
              if (!res.ok) throw new Error(`HTTP ${res.status}`);
              return res.text();
            })
            .then(html => {
              // 받아온 HTML 로 페이지 교체
              document.open();
              document.write(html);
              document.close();
            })
            .catch(err => console.error('예약 중 오류:', err));
          }
        }
      }).mount('#registerApp');
    </script>
</body>
</html>
