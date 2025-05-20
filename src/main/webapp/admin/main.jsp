<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Abril+Fatface"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css" />
    <link rel="stylesheet" href="../css/animate.css" />

    <link rel="stylesheet" href="../css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="../css/magnific-popup.css" />

    <link rel="stylesheet" href="../css/aos.css" />

    <link rel="stylesheet" href="../css/ionicons.min.css" />

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="../css/jquery.timepicker.css" />

    <link rel="stylesheet" href="../css/flaticon.css" />
    <link rel="stylesheet" href="../css/icomoon.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style>
  html, body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
  }
  /* 최상위 컨테이너 */
  .full-height {
    min-height: 100vh;
  }
  /* 사이드+콘텐츠 row */
  .full-height-row {
    min-height: 100vh;
  }
  /* 메인 컬럼: 최소 100vh, 내용 크기에 따라 더 커짐 */
  .main-col {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }
  /* 실제 스크롤을 담당할 영역 */
  .scrollable-content {
    flex: 1 1 auto;
    overflow-y: auto;
  }
</style>
</head>
<body>
	<div class="container-fluid full-height px-0" style="max-width:100%;">
  		<div class="row full-height-row no-gutters">
			<div class="col-auto p-2 bg-dark" style="width:250px;">
				
				<a href="../admin/main.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >대시보드</a>
				<a href="../admin/board.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >게시판관리</a>
				<a href="../admin/member.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >회원관리</a>
				<a href="../admin/reply.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >댓글관리</a>
				<a href="../admin/qna.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >문의글</a>
				<a href="../admin/reserve.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >예약관리</a>
				<a href="../admin/notice.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >공지사항</a>
				<a href="../admin/statistics.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >통계</a>
				<a href="../admin/coupon.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px; color:white"  >쿠폰</a>
		        <a href="../member/logout.do" class="col btn btn-primary rounded-0 mt-1">나가기</a>
				
			</div>
			<div class="col main-col bg-light px-0">
			   <div class="scrollable-content">
		        <div class="container h-100">
		          <div class="row pt-4 justify-content-center">
		            <jsp:include page="${admin_jsp}"/>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
 <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
        <circle
          class="path-bg"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke="#eeeeee"
        />
        <circle
          class="path"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke-miterlimit="10"
          stroke="#F96D00"
        />
      </svg>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.waypoints.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <!-- <script src="../js/jquery.timepicker.min.js"></script> -->
    <script src="../js/scrollax.min.js"></script>
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
    <!-- <script src="../js/google-map.js"></script> -->
    <script src="../js/main.js"></script>
</body>
</html>