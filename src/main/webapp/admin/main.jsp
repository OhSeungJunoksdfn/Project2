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
    <style type="text/css">
    	.container{
    	max-width: 100%;
    	height: 100vh;
    	
    	
    	}
    	.container *{
    		color: #fff;
    	}
    	.row{
    		height: 100%
    	}
    	#sideBtn{
    		transition:0.2s;
    	}
    </style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="p-2" style="height:100%; width:250px; background-color:#333"  >
				<h3 class="p-2 text-center" style="border-bottom:1px solid #000" >로고</h3>
				
				<a href="../admin/main.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >대시보드</a>
				<a href="../admin/board.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >게시판관리</a>
				<a href="../admin/member.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >회원관리</a>
				<a href="../admin/reply.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >댓글관리</a>
				<a href="../admin/qna.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >문의글</a>
				<a href="../admin/main.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >예약관리</a>
				<a href="../admin/notice.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >공지사항</a>
				<a href="../admin/statistics.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >통계</a>
				<a href="../admin/coupon.do" class="col btn btn-outline-primary border-0 rounded-0 d-flex justify-content-center align-items-center" id="sideBtn" style="height:50px;"  >쿠폰</a>
				
			</div>
			<div class="col bg-light px-0">
				<div class="text-right bg-white align-center shadow-sm p-3">
					<a href="../member/logout.do" class="btn btn-primary rounded-0 px-5" >나가기</a>
				</div>
			 <jsp:include page="${admin_jsp }"/>
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