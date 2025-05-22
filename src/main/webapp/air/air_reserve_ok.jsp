<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>항공권 예약 완료</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    body { font-family: Arial, sans-serif; }
    .center-wrapper {
      margin: 50px auto;
      width: 960px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }
    .icon-circle {
      width: 120px;
      height: 120px;
      background: #4eb8d1;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 1rem;
    }
    .icon-circle svg { width: 60px; height: 60px; }
    h3 { margin: .5rem 0 2rem; color: #333; }
    .btn { padding: .75rem 1.5rem; font-size: 1rem; border-radius: 4px; }
    .btn-primary { background-color: #007bff; color: #fff; border: none; }
    .btn-info    { background-color: #17a2b8; color: #fff; border: none; }
    .btn + .btn  { margin-left: 1rem; }
  </style>
</head>
<body>
  <div class="center-wrapper" id="app">
    <!-- 1) 확인 아이콘 -->
    <div class="icon-circle">
      <svg viewBox="0 0 24 24" fill="white">
        <path d="M10 15l-2.5-2.5L6 13.5l4 4 8-8-1.5-1.5z"/>
      </svg>
    </div>

    <!-- 2) 완료 메시지 -->
    <h3>항공권 예약이 완료되었습니다.</h3>

    <!-- 3) 버튼 그룹 -->
    <div>
      <!-- memberId 가 있을 때만 보여주기 -->
      <button
        v-if="memberId"
        class="btn btn-primary"
        @click="viewDetail()"
      >예약 상세보기</button>

      <!-- 비회원은 로그인 유도 -->
      <button
        v-else
        class="btn btn-primary"
        @click="goLogin()"
      >로그인 후 확인</button>

      <button
        class="btn btn-info"
        @click="home()"
      >홈으로</button>
    </div>
  </div>

  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  <script>
    Vue.createApp({
      data() {
        return {
          // 컨트롤러에서 model.addAttribute("bookingNo", ...) 해주셔야 합니다.
          bookingNo:     '${bookingNo}',
          // sessionScope 혹은 model 에 담긴 memberId
          memberId:      '${sessionScope.memberId}'
        };
      },
      methods: {
        viewDetail() {
          // POST 폼 동적 생성
          const form = document.createElement('form');
          form.method = 'POST';
          form.action = '../air/reservation_detail.do';

          // bookingNo 와 memberId 숨김 필드로 추가
          [ ['bookingNo', this.bookingNo], ['memberId', this.memberId] ]
            .forEach(([name, val]) => {
              const inp = document.createElement('input');
              inp.type  = 'hidden';
              inp.name  = name;
              inp.value = val;
              form.appendChild(inp);
            });

          document.body.appendChild(form);
          form.submit();
        },
        goLogin() {
          // 비회원일 경우 로그인 페이지로
          alert('예약 상세보기를 위해 로그인 해주세요.');
          location.href = '../member/login.do';
        },
        home() {
          location.href = '../main/main.do';
        }
      }
    }).mount('#app');
  </script>
</body>
</html>
