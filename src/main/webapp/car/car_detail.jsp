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
      <div class="container">
        <div class="row">
        	<div class="col-3 order-md-last sidebar pt-3 shadow" id="sidebar" >
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">결제 정보</h3>
        			<form action="#" @submit.prevent>
	        			<div class="fields">
	
			              <div class="form-group">
			              	대여일시
			                <input type="text" id="checkin_date" class="form-control" readonly
			                	:value="pudate + '   ' +putime">
			              </div>
			              <div class="form-group">
			              	반납일시
			                <input type="text" id="checkin_date" class="form-control" readonly
			                	:value="rdate + '   ' +rtime">
			              </div>
			              <div class="text-center">{{timeInterval}}</div>
						  <hr>
						  <div class="form-group">
						  	<span style="font-size:15px">보험</span>
			                <span style="font-size:15px;position:absolute;right:0">{{ins_kind}}</span>
			                <div></div>
			              </div>
			              <hr>
			              <div style="display:flex;">
			              		<h5 style="font-size:18px">결제액 </h5>
			              		<h5 style="font-size:18px;margin-left:auto"> {{calcRentalPrice}}원</h5>
			              </div>
			              
			              <div class="form-group">
			                <input type="submit" value="예약하기" class="btn btn-primary py-3 px-5" @click="reserve()">
			              </div>
			            </div>
	            	</form>
        		</div>
          </div>
          
          <div class="col-9">
          	<div class="row mr-2 sidebar shadow pt-3">
          		<div class="col-12" style="display:flex;">
          			<div class="col-5 ftco-animate" style="margin:0px;padding:0px">
          				<img class=" r-12" src="${vo.poster }" 
          					style="width:90%">
	          		</div>
	          		<div class="col-7" style="padding:0px">
	          			<h5>${vo.name }</h5>
	          			<hr>
	          			<ul style="font-size:12px">
	          				<li style="margin-top:20px;margin-bottom:20px">
	          					<span style="font-weight:450">차량 정보 :</span> ${vo.car_class}ㆍ${vo.seat}인승ㆍ${vo.fuel}ㆍ자동
	          				</li>
	          				<li style="margin-top:20px;margin-bottom:20px">
	          					<span style="font-weight:450">운전 자격 :</span> ${fn:substring(vo.non_ins_qual, 3, fn:length(vo.non_ins_qual))}
	          				</li> 
	          			</ul>
	          			<h5 style="font-size:16px;margin-top:20px">차량 옵션</h5>
	          			<hr >
	          			<ul style="list-style-type: none;padding-left:10px;">
	          					<li style="font-size:10px">
	          						${fn:substring(vo.detail_option, 7, fn:length(vo.detail_option))}
	          					</li>
	          			</ul>
	          		</div>
	          		<hr>
          		</div>
          		
          		
          		
          		<section class="ftco-section">
			      <div class="container">
			        <div class="row">
			          <div class="col-4">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<input class="ins_radio" type="radio" style="margin-bottom:5px"
			              	@click="radio_click(1)" id="1"/>
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
			          <div class="col-4 ">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<input class="ins_radio" type="radio" style="margin-bottom:5px"
			              	@click="radio_click(2)" id="2"/>
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
			          <div class="col-4">
			            <div class="intro ftco-animate r-12 sidebar shadow p-3">
			              <span style="display:flex">
			              	<input class="ins_radio" type="radio" style="margin-bottom:5px"
			              	@click="radio_click(3)" id="3"/>
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
	    			<div id="map" style="width:100%;height:280px;"></div> 
	    			
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
				<div style="font-size:1px;visibility: hidden;">a</div>
          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
      
    </section> <!-- .section -->

    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a9387f2bc9bb88630761af3fd4f0ca3&libraries=services"></script>
<script>

</script>
<script>
      const carApp=Vue.createApp({
    	  data() {
    		  return {
    			  pudate:'${pudate}',
    			  putime:'${putime}',
    			  rdate:'${rdate}',
    			  rtime:'${rtime}',
    			  nor_ins_desc:'${vo.normal_ins_desc}'.split('-'),
    			  pre_ins_desc:'${vo.premium_ins_desc}'.split('-'),
    			  non_ins_price:Number('${vo.non_ins_price}'),
    			  normal_ins_price:Number('${vo.normal_ins_price}'),
    			  premium_ins_price:Number('${vo.premium_ins_price}'),
    			  checked_ins:0,
    			  puDateObject:new Date(`${pudate} ${putime}`),
    			  rDateObject:new Date(`${rdate} ${rtime}`),
    			  rentalPrice:0
    		  }
    	  },
    	  computed: {
    		  timeInterval(){
    			  const diffMs = this.rDateObject - this.puDateObject
    			  const diffHours = Math.floor(diffMs / ((1000 * 60 * 60))%24);
    			  const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));
    			  
    			  const str = diffDays + '일 ' + diffHours + '시간'
    			  return str
    		  },
    		  calcRentalPrice(){
    			  const diffMs = this.rDateObject - this.puDateObject
    			  const diffHours = diffMs / (1000 * 60 * 60);
    			  const ins_prices = [0,
    				  				this.non_ins_price,
    				  				this.normal_ins_price,
    				  				this.premium_ins_price]
    			  this.rentalPrice = Math.floor(ins_prices[this.checked_ins]*(diffHours/24))
    			  return this.rentalPrice.toLocaleString()
    		  },
    		  ins_kind(){
    			  const inss = ["","자차면책 가입 안함","일반자차","고급자차"]
    			  return inss[this.checked_ins]
    		  }
	      },
    	  mounted() { 
	    	  console.log(this.puDateObject)

    	  },
    	  methods: {
    		reserve(){
    			console.log("reserve")
    			
    			if(this.checked_ins===0){
    				alert("자차보험을 선택해주세요")
    			}else{
					this.postData()
    			}
    			
    		},
    		radio_click(value) {
    			$('.ins_radio').prop('checked',false)
    			$('#'+value).prop('checked',true)
    			this.checked_ins=Number(value)
    			console.log(this.checked_ins)
    		},
      		postData() {
    			const form = document.createElement("form");
				form.method = "POST";
				form.action = "../car/car_reserve.do";
	
				const inputPudate = document.createElement("input");
				inputPudate.type = "hidden";
				inputPudate.name = "pudate";
				inputPudate.value = this.pudate;
				const inputPutime = document.createElement("input");
				inputPutime.type = "hidden";
				inputPutime.name = "putime";
				inputPutime.value = this.putime;
				const inputRdate = document.createElement("input");
				inputRdate.type = "hidden";
				inputRdate.name = "rdate";
				inputRdate.value = this.rdate;
				const inputRtime = document.createElement("input");
				inputRtime.type = "hidden";
				inputRtime.name = "rtime";
				inputRtime.value = this.rtime;
				const inputIns = document.createElement("input");
				inputIns.type = "hidden";
				inputIns.name = "ins";
				inputIns.value = this.checked_ins;
				const inputNo = document.createElement("input");
				inputNo.type = "hidden";
				inputNo.name = 'no';
				inputNo.value = '${vo.no}';
				const inputPrice = document.createElement("input");
				inputPrice.type = "hidden";
				inputPrice.name = 'price';
				inputPrice.value = this.rentalPrice;
	
				form.appendChild(inputPudate);
				form.appendChild(inputPutime);
				form.appendChild(inputRdate);
				form.appendChild(inputRtime);
				form.appendChild(inputIns);
				form.appendChild(inputNo);
				form.appendChild(inputPrice);
				document.body.appendChild(form);
				
				form.submit();
      		}
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