<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border-bottom: 3px solid transparent; /* 기본은 투명 */
}

.tab_nav a.active {
	border-bottom: 3px solid #4eb8d1; /* 활성 탭 밑줄 */
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
<div class="wrap" id="mypageListApp">
    <div class="tab">
      <ul class="mainTab_nav">
        <li class="mainTab"><a href="#" style="color: black;">항공권 예약 조회</a></li>
        <li class="mainTab"><a href="../mypage/car_reserve_list.do" style="color: black;">렌터카 예약 조회</a></li>
        <li class="mainTab" ><a href="../mypage/hotel_reserve_list.do" style="color: black; font-weight: bold;">호텔 예약 조회</a></li>
      </ul>
    </div>
    <br>
  <div>
    <div class="tab">
      <ul class="tab_nav">
        <li><a href="#tab1">확정 대기 예약</a></li>
        <li><a href="#tab2">확정된 예약</a></li>
        <li><a href="#tab3">지난 예약</a></li>
      </ul>
    </div>
    <!-- 확정 대기 -->
    <div class="tab_contents">
      <div id="tab1">
        <table class="table">
          <thead>
            <tr>
              <th>차량명</th>
              <th>대여날짜</th>
              <th>반납날짜</th>
              <th>예약 상태</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           <c:forEach items="${ingList }" var="ing">
            <tr>
              <td>${ing.car_name }</td>
              <td><fmt:formatDate value="${ing.pickup_date}" pattern="yyyy:MM:dd" /></td>
              <td><fmt:formatDate value="${ing.return_date}" pattern="yyyy:MM:dd" /></td>
              <td>${ing.status }</td>
              <td style="padding-left: 2px; padding-right: 2px; padding-top: 6px;">
                <a href="../mypage/car_reserve_detail.do?no=${ing.no }">
                  <input type="button" value="예약 상세보기" class="btn btn-primary r-12"/>
                </a>
              </td>
              <td style="padding-left: 2px; padding-right: 2px; padding-top: 6px;">
                <a class="btn btn-outline-danger r-12 cursor-pointer text-dark ml-2"
                	data-no="${ing.no }" 
                	onclick="delCar(${ing.no })"
                >예약 취소</a>
              </td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- 확정 -->
      <div id="tab2">
        <table class="table">
          <thead>
            <tr>
              <th>차량명</th>
              <th>대여날짜</th>
              <th>반납날짜</th>
              <th>예약 상태</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           <c:forEach items="${confirmedList }" var="confd">
            <tr>
              
              <td>${confd.car_name }</td>
              <td><fmt:formatDate value="${confd.pickup_date}" pattern="yyyy:MM:dd" /></td>
              <td><fmt:formatDate value="${confd.return_date}" pattern="yyyy:MM:dd" /></td>
              <td>${confd.status }</td>
              <td style="padding-left: 2px; padding-right: 2px; padding-top: 6px;">
                <a href="../mypage/car_reserve_detail.do?no=${confd.no }">
                  <input type="button" value="예약 상세보기" class="btn btn-primary r-12"/>
                </a>
              </td>
              <td style="padding-left: 2px; padding-right: 2px; padding-top: 6px;">
                <a class="btn btn-outline-danger r-12 cursor-pointer text-dark ml-2"
                	data-no="${confd.no }" 
                	onclick="delCar(${confd.no })"
                >예약 취소</a>
              </td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- 지난 -->
      <div id="tab3">
        <table class="table">
          <thead>
            <tr>
              <th>차량명</th>
              <th>대여날짜</th>
              <th>반납날짜</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           <c:forEach items="${pastList }" var="past">
            <tr>
              <td>${past.car_name }</td>
              <td><fmt:formatDate value="${past.pickup_date}" pattern="yyyy:MM:dd" /></td>
              <td><fmt:formatDate value="${past.return_date}" pattern="yyyy:MM:dd" /></td>
              <td style="padding-left: 2px; padding-right: 2px; padding-top: 6px;">
                <a href="../mypage/car_reserve_detail.do?no=${past.no }">
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
</div>
<script>
$(function(){
  $('.tab_contents > div').hide();
  $('.tab_nav a').click(function () {
    $('.tab_contents > div').hide().filter(this.hash).fadeIn(); /* 클릭한 링크의 href가 #tab1, #tab2 등이라면, 그 id와 일치하는 div를 찾아 보여줌 */
    $('.tab_nav a').removeClass('active'); // active 지우기
    $(this).addClass('active'); 
    return false;
  }).filter(':eq(0)').click(); // 첫 번째 탭 클릭 효과 실행
});

function delCar(no) {
	console.log(no)
	var msg = confirm("예약을 취소 하시겠습니까?");
	if(msg){
		$.ajax({
			type: "POST",
			url: "../mypage/car_reserve_delete.do",
			data: {
				no: no
			},
			success: function() {
				alert("예약이 취소 되었습니다.");
				window.location.href = "../mypage/car_reserve_delete_ok.do";
			},
			error: function() {
			}
		})
	}
	
}
</script>
</body>
</html>
