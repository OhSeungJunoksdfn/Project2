<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.tab_nav li {
	display: inline-block;
	margin: 0 20px;
}

.tab_nav a {
	display: inline-block;
	width: 220px; 
	text-align: center;
	color: black;
}
</style>
</head>
<body>
  <div class="wrap">
    <div class="tab">
      <ul class="tab_nav">
        <li><a href="#">항공권 예약 조회</a></li>
        <li><a href="#">렌트카 예약 조회</a></li>
        <li><a href="../mypage/hotel_reserve_list.do">호텔 예약 조회</a></li>
      </ul>
    </div>
  </div>
</body>
</html>