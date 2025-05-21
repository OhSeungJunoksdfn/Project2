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
        <input type="hidden" name="seats" value="${param.seats}" />

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
                <select name="emailPrefix" class="form-select" style="max-width:150px;">
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
                <select name="phonePrefix" class="form-select" style="max-width:100px;"><option>010</option><option>011</option></select>
                <input type="tel" class="form-control" name="phone" maxlength="8" placeholder="숫자만 입력" />
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
           class="form-select"
           style="max-width:150px;">
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
          name="passengers[${i}].phone"
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
            this.registeredCount++;
            if (this.registeredCount === totalCount) {
              this.$refs.myform.submit();
            }
          },                          /* 이 쉼표는 registerBlock 끝에서 함수 구분용 */
          handleChildRegister(idx) {  /* methods 블록 바로 안에 정의 */
            const age = calcChildAge(idx);
            if (age >= 12) {
              alert('나이가 12세 이상이므로 소아 등록할 수 없습니다.');
              return;
            }
            this.registerBlock();
          }                          /* 마지막 메서드는 쉼표 불필요 */
        }
      }).mount('#registerApp');
    </script>
</body>
</html>
