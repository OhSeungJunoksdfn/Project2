<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.mainTab_nav li {
	display: inline-block;
	margin: 0 20px;
}

.mainTab a {
	display: inline-block;
	width: 220px; 
	text-align: center;
	color: black;
}
.table thead tr th
.table tbody tr td {
	font-size: 12px;
	color: black;
}
</style>
</head>
<body>
<div class="wrap">
  <div class="tab">
      <ul class="mainTab_nav">
        <li class="mainTab"><a href="#" style="color: black;">항공권 예약 조회</a></li>
        <li class="mainTab"><a href="#" style="color: black;">렌트카 예약 조회</a></li>
        <li class="mainTab" ><a href="../admin/hotel_reserve_list.do" style="font-weight: bold;">호텔 예약 조회</a></li>
      </ul>
    </div>
    <div class="row">
      <table class="table">
        <thead>
          <tr>
            <th>호텔명</th>
            <th>객실명</th>
            <th>예약자계정</th>
            <th>예약자명</th>
            <th>예약자 이메일</th>
            <th>예약자 전화번호</th>
            <th>예약 인원</th>
            <th>총 금액</th>
            <th>예약일</th>
            <th>예약 상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
</div>
</body>
</html>