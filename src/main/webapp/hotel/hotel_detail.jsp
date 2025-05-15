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
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	handleOversize: "resize",
	modal: false,
	overlayOpacity: 0.85
})

</script>
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
	<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 order-md-last sidebar pt-3 shadow" id="sidebar">
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Find City</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Destination, City">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="" id="" class="form-control" placeholder="Keyword search">
	                      <option value="">Select Location</option>
	                      <option value="">San Francisco USA</option>
	                      <option value="">Berlin Germany</option>
	                      <option value="">Lodon United Kingdom</option>
	                      <option value="">Paris Italy</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
		              </div>
		              <div class="form-group">
		              	<div class="range-slider">
		              		<span>
										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
										  </span>
										  <input value="1000" min="0" max="120000" step="500" type="range"/>
										  <input value="50000" min="0" max="120000" step="500" type="range"/>
										</div>
		              </div>
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Star Rating</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>
 <!-- 사이드바 End -->
          <div class="col-lg-9">
          	<div class="row mr-2 sidebar shadow pt-3">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          			   <c:forEach items="${iList }" var="img">
          					<div class="hotel-img r-12" style="background-image:none; ">
          					  <img src="${img.img_og}" style="width: 100%; height: 100%;">
          					</div>
          			   </c:forEach>
          			</div>
          		</div>
          	  
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<h2>${vo.title }</h2>
          			<p class="rate mb-5">
          				<span class="loc"><a><i class="icon-map"></i>${vo.addr }</a></span>
          				<span class="star">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    					</span>

    				</p>
    				<div>
<!--     					<div> -->
<!-- 	    					<div><h3>어메니티</h3></div> -->
<!-- 	    				</div> -->
					<hr>
	    				<div>
	    					<div id="map" style="width:100%;height:280px;"></div> 
	    				</div>
    				</div>
    				<hr>
    				<br>
    						<p>${vo.overview }</p>
          		</div>
          		
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">객실 선택</h4>
          				<div class="row px-3">
          				  <c:forEach items="${rList }" var="room">
							<div class="col-md-4">
				    			<div class="destination">  
				    			  <c:set var="imgs" value="${fn:split(room.room_img, ',')}"/>
				    				   <a href="${fn:trim(imgs[0])}" class="img img-2 r-12" rel="shadowbox[room${room.no}]" title="${room.title}">
									      <img src="${fn:trim(imgs[0])}" class="ImgDetail" style="width:230px; height:170px;">
									    </a>
									    <c:forEach begin="1" end="${fn:length(imgs)-1}" var="i">
									      <a href="${fn:trim(imgs[i])}" class="img img-2 r-12" rel="shadowbox[room${room.no}]" title="${room.title}" style="display:none; width:100%; height:100%;"></a>
									    </c:forEach>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3>${room.title }</h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span></span>
						    						</p>
					    						</div>
					    					   <div class="two">
					    						  <span class="price" style="font-size: 16px;">
					    						    <fmt:formatNumber value="${room.price}" type="number" groupingUsed="true"/>원
					    						    <br><small>/ 1박</small>					    							
				    							  </span>
				    						   </div>
				    						</div>
				    						<p>${room.person }인 / 최대 ${room.person_max}인</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span class="ml-auto"><a href="../hotel/hotel_reserve.do?no=${room.no }">객실 예약</a></span>
				    						</p>
				    					</div>
				    			</div>
				    		</div>
				    	</c:forEach>
          			</div>
          		</div>

				<!-- 댓글 -->
				<section class="ftco-section-parallax">
				      <div class="container">
				        <div class="row">
				          <h3 class="col-12 mb-5">6 Comments</h3>
				          <div class="col-12">
				            <ul class="comment-list">
				              <li class="comment">
				                <div class="vcard bio">
				                  <img src="#" alt="Image placeholder" />
				                </div>
				                <div class="comment-body">
				                  <h3>John Doe</h3>
				                  <div class="meta">October 03, 2018 at 2:21pm</div>
				                  <p>
				                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				                    Pariatur quidem laborum necessitatibus, ipsam impedit vitae
				                    autem, eum officia, fugiat saepe enim sapiente iste iure!
				                    Quam voluptas earum impedit necessitatibus, nihil?
				                  </p>
				                  <p><a href="#" class="reply">Reply</a></p>
				                </div>
				              </li>
				            </ul>
				          </div>
				          <h3 class="ml-3">댓글입력</h3>
				          <div class=" container input-group mb-3">
				            <textarea
				              class="form-control"
				              placeholder="Recipient's username"
				              aria-label="Recipient's username"
				              aria-describedby="button-addon2"
				              style="resize: none; height: 100px !important; border-radius: 12px 0 0 12px"
            				></textarea>
           					 <button class="replyBtn" style="border-radius: 0 12px 12px 0">댓글</button>
				          </div>
				        </div>
				      </div>
				    </section>
				  <!--댓글 끝-->

				  <!--추천-->
				  <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
					<h4 class="mb-4">${vo.title }와(과) 유사한 지역의 추천 숙소</h4>
					<div class="row">
					 <c:forEach items="${r3List }" var="r3List">
					  <div class="col-md-4">
								  <div class="destination">
									  <a href="../hotel/hotel_detail.do?no=${r3List.no }" class="img img-2 r-12" style="background-image:none; ">
									    <img src="${r3List.img }" class="ImgDetail" style="width:230px; height:170px;">
									  </a>
									  <div class="text p-3">
										  <div class="d-flex">
											   <div class="one">
												  <h3><a href="../hotel/hotel_detail.do?no=${r3List.no }">${r3List.title }</a></h3>
												  <p class="rate">
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star-o"></i>
													  <span></span>
												  </p>
											  </div>
											  <div class="two">
												  <span class="price" style="font-size: 16px;">
					    						    <fmt:formatNumber value="${r3List.price}" type="number" groupingUsed="true"/>원
					    						    <br><small>/ 1박</small>					    							
				    							  </span>
											  </div>
										  </div>
										  <p></p>
									  </div>
								  </div>
							  </div>
							 </c:forEach>
					</div>
				</div>
				<!--추천 끝-->

          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=754884240383c655e9425cfe0a3e1713&libraries=services"></script>
<script>
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
geocoder.addressSearch('${vo.addr }', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title }</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
})
</script>
</body>
</html>