<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.two .pricec {
	font-size: 16px;
}
.ImgDetail {
	object-fit: cover;
    border-radius: 10px;
    cursor: pointer;
}
#map {
	border-radius: 10px;
}
</style>
</head>
<body>
<!-- 시작 -->
<!-- 사이드바 Start -->
	<div id="app">
		<section class="ftco-section ftco-degree-bg">
      <div class="container" >
        <div class="row">
          
          <div class="">
          	<div class="row mr-2 sidebar shadow pt-3">
          		<div class="col-md-12" style="display:flex;">
          			<div class="col-md-5 ftco-animate" style="margin:0px;padding:0px">
          				<img class=" r-12" src="${vo.poster }" 
          					style="width:90%">
	          		</div>
	          		<div class="col-md-7" style="padding:0px">
	          			<h5>${vo.name }</h5>
	          			<hr>
	          			<ul style="font-size:15px">
	          				<li style="margin-top:20px;margin-bottom:20px">
	          					<span style="font-weight:450">차량 정보 :</span> ${vo.car_class}ㆍ${vo.seat}인승ㆍ${vo.fuel}ㆍ자동
	          				</li>
	          				<li style="margin-top:20px;margin-bottom:20px">
	          					<span style="font-weight:450">운전 자격 :</span> ${fn:substring(vo.non_ins_qual, 3, fn:length(vo.non_ins_qual))}
	          				</li> 
	          			</ul>
	          			<h5 style="font-size:20px;margin-top:20px">차량 옵션</h5>
	          			<hr >
	          			<ul style="list-style-type: none;padding-left:10px;">
	          					<li style="font-size:15px">
	          						${fn:substring(vo.detail_option, 7, fn:length(vo.detail_option))}
	          					</li>
	          			</ul>
	          		</div>
	          		<hr>
          		</div>
          		
          		
          		
          		<section class="ftco-section col-md-12">
			      <div class="container">
			        <div class="row">
			          <div class="col-md-4">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<h5 style="font-weight:500;font-size:17px">&nbsp;자차면책 가입안함</h5>
			              </span>
			              <hr style="transform: translateY(-10px);">
			              <p style="font-size:12px">
			              	<span>-자차 미가입</span>
			                <h5 style="font-size:12px;margin-top:10px;margin-bottom:40px">${vo.non_ins_qual }</h5>
			              </p>
			              <h5 style="position:absolute;bottom:0;right:0;margin-right:20px;">
			              	{{non_ins_price.toLocaleString()}}원
			              </h5>
			            </div>
			          </div>
			          <div class="col-md-4 ">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<h5 style="font-weight:500;font-size:17px">&nbsp;일반자차 포함</h5>
			              </span>
			              <hr style="transform: translateY(-10px);">
			              <p style="font-size:12px">
			              	<div style="font-size:12px" v-for="(desc,index) in nor_ins_desc.slice(1)">-{{desc}}</div>
			                <h5 style="font-size:12px;margin-top:10px;margin-bottom:40px">${vo.normal_ins_qual }</h5>
			              </p>
			              <h5 style="position:absolute;bottom:0;right:0;margin-right:20px;">
			              	{{normal_ins_price.toLocaleString()}}원
			              </h5>
			            </div>
			          </div>
			          <div class="col-md-4">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<h5 style="font-weight:500;font-size:17px">&nbsp;고급자차 포함</h5>
			              </span>
			              <hr style="transform: translateY(-10px);">
			              <p style="font-size:12px">
			              	<div style="font-size:12px" v-for="(desc,index) in pre_ins_desc.slice(1)">-{{desc}}</div>
			                <h5 style="font-size:12px;margin-top:10px;margin-bottom:40px">${vo.normal_ins_qual }</h5>
			              </p>
			              <h5 style="position:absolute;bottom:0;right:0;margin-right:20px;">
			              	{{premium_ins_price.toLocaleString()}}원
			              </h5>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="" style="padding:10px;padding-top:100px">
			      	<h5>${vo.branch.branch_name }</h5>
	    			<div id="map" style="width:100%;height:400px;"></div> 
	    			
	    			<div style="padding:10px">
	    				<div style="">
		    				<h5 style="font-size:15px">주소</h5>
		    				<div style="font-size:14px">${vo.branch.location }</div>
		    			</div>
		    			<div style="margin-top:20px">
		    				<h5 style="font-size:15px">전화</h5>
		    				<div style="font-size:14px">${vo.branch.branch_phone }</div>
		    			</div>
		    			<div style="margin-top:20px">
		    				<h5 style="font-size:15px">영업시간</h5>
		    				<div style="font-size:14px">${vo.branch.open_time }-${vo.branch.close_time }</div>
		    			</div>
	    			</div>
	    			
	    			
	    		</div>
			    </section>
          		
				<!-- 댓글-->
				<jsp:include page="../component/replyComponent.jsp">
				  <jsp:param name="no"   value="${no}" />
				  <jsp:param name="type" value="car"/>
				</jsp:include>
				  <!--댓글 끝-->

				  <!--추천-->
				  <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
					<h4 class="mb-4">Related Hotels</h4>
					<div class="row">
					  <div class="col-md-4">
								  <div class="destination">
									  <a href="hotel-single.html" class="img img-2 r-12" style="background-image: url(../images/hotel-1.jpg);"></a>
									  <div class="text p-3">
										  <div class="d-flex">
											  <div class="one">
												  <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
												  <p class="rate">
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star-o"></i>
													  <span>8 Rating</span>
												  </p>
											  </div>
											  <div class="two">
												  <span class="price per-price">$40<br><small>/night</small></span>
											  </div>
										  </div>
										  <p>Far far away, behind the word mountains, far from the countries</p>
										  <hr>
										  <p class="bottom-area d-flex">
											  <span><i class="icon-map-o"></i> Miami, Fl</span> 
											  <span class="ml-auto"><a href="#">Book Now</a></span>
										  </p>
									  </div>
								  </div>
							  </div>
							  <div class="col-md-4">
								  <div class="destination">
									  <a href="hotel-single.html" class="img img-2 r-12" style="background-image: url(../images/hotel-2.jpg);"></a>
									  <div class="text p-3">
										  <div class="d-flex">
											  <div class="one">
												  <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
												  <p class="rate">
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star-o"></i>
													  <span>8 Rating</span>
												  </p>
											  </div>
											  <div class="two">
												  <span class="price per-price">$40<br><small>/night</small></span>
											  </div>
										  </div>
										  <p>Far far away, behind the word mountains, far from the countries</p>
										  <hr>
										  <p class="bottom-area d-flex">
											  <span><i class="icon-map-o"></i> Miami, Fl</span> 
											  <span class="ml-auto"><a href="#">Book Now</a></span>
										  </p>
									  </div>
								  </div>
							  </div>
							  <div class="col-md-4">
								  <div class="destination">
									  <a href="hotel-single.html" class="img img-2 r-12" style="background-image: url(../images/hotel-3.jpg);"></a>
									  <div class="text p-3">
										  <div class="d-flex">
											  <div class="one">
												  <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
												  <p class="rate">
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star-o"></i>
													  <span>8 Rating</span>
												  </p>
											  </div>
											  <div class="two">
												  <span class="price per-price">$40<br><small>/night</small></span>
											  </div>
										  </div>
										  <p>Far far away, behind the word mountains, far from the countries</p>
										  <hr>
										  <p class="bottom-area d-flex">
											  <span><i class="icon-map-o"></i> Miami, Fl</span> 
											  <span class="ml-auto"><a href="#">Book Now</a></span>
										  </p>
									  </div>
								  </div>
							  </div>
					</div>
				</div>
				<!--추천끝-->

          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
      
    </section> <!-- .section -->

    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=754884240383c655e9425cfe0a3e1713&libraries=services"></script>
<script>

</script>
<script>
      const carApp=Vue.createApp({
    	  data() {
    		  return {
    			  nor_ins_desc:'${vo.normal_ins_desc}'.split('-'),
    			  pre_ins_desc:'${vo.premium_ins_desc}'.split('-'),
    			  non_ins_price:Number('${vo.non_ins_price}'),
    			  normal_ins_price:Number('${vo.normal_ins_price}'),
    			  premium_ins_price:Number('${vo.premium_ins_price}'),
    			  rentalPrice:0
    		  }
    	  },
    	  computed: {
	      },
    	  mounted() { 

    	  },
    	  methods: {

    	  }
    	  
      }).mount("#app");
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.branch.location}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        /* var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.branch.branch_name}</div>'
	        });
	        infowindow.open(map, marker); */
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	})
</script>
</body>
</html>