<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"          import="org.jsoup.Jsoup,
                 org.jsoup.nodes.Document,
                 org.jsoup.nodes.Element" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .region-bg {
	  position: relative;
	  overflow: hidden; /* 확대 시 넘침 방지 */
	  color: #fff;
	  z-index: 0;
	  cursor:pointer;
	}
	.region-bg::before {
	  content: "";
	  position: absolute;
	  top: 0; left: 0; right: 0; bottom: 0;
	  overflow: hidden;
	  background-size: cover;
	  background-position: center;
	  background-repeat: no-repeat;
	  background-image: inherit; /* 부모에서 전달받음 */
	  transition: transform 1s ease;
	  z-index: -1;
	}
    .region-bg.seoul {
      background-image: url('${pageContext.request.contextPath}/images/background_seoul.jpg');
    }
    .region-bg.jeju {
      background-image: url('${pageContext.request.contextPath}/images/background_jeju.jpg');
    }
    .region-bg:hover::before {
	  transform: scale(1.1);
	}
        .weather-box { background: rgba(255,255,255,0.8); padding: 1.5rem; border-radius: .5rem; }
    .city-title { font-size: 1.5rem; font-weight: bold; margin-bottom: .75rem; }
    .weather-list { list-style: disc inside; }
  </style>
</head>
<body>
<div id="mainApp">
<section class="ftco-section justify-content-end ftco-search">
      <div class="container-wrap mx-auto">
        <div class="row no-gutters">
          <div class="col-md-12 nav-link-wrap">
            <div
              class="nav nav-pills justify-content-start ml-3 text-center"
              id="v-pills-tab"
              role="tablist"
              aria-orientation="vertical"
            >
              <a
                class="nav-link active rounded-top"
                id="v-pills-1-tab"
                data-toggle="pill"
                href="#v-pills-1"
                role="tab"
                aria-controls="v-pills-1"
                aria-selected="true"
                >Flight</a
              >

              <a
                class="nav-link rounded-top"
                id="v-pills-2-tab"
                data-toggle="pill"
                href="#v-pills-2"
                role="tab"
                aria-controls="v-pills-2"
                aria-selected="false"
                >Hotel</a
              >

              <a
                class="nav-link rounded-top"
                id="v-pills-3-tab"
                data-toggle="pill"
                href="#v-pills-3"
                role="tab"
                aria-controls="v-pills-3"
                aria-selected="false"
                >Car Rent</a
              >
            </div>
          </div>
          <div class="col-md-12 tab-wrap rt-12">
            <div class="tab-content p-4 px-5" id="v-pills-tabContent">
              <div
                class="tab-pane fade show active"
                id="v-pills-1"
                role="tabpanel"
                aria-labelledby="v-pills-nextgen-tab"
              >
              <!-- 호텔 서치바 넣는 곳 -->
              <air-search-bar @search="handleSearch1"></air-search-bar>
              </div>
				<!-- 호텔 서치바 시작 -->
              <div
                class="tab-pane fade"
                id="v-pills-2"
                role="tabpanel"
                aria-labelledby="v-pills-2-tab"
              >
                <hotel-search-bar @search="handleSearch"></hotel-search-bar>
              </div>
				<!-- 호텔 서치바 끝 -->
              <div
                class="tab-pane fade"
                id="v-pills-3"
                role="tabpanel"
                aria-labelledby="v-pills-effect-tab"
              >
              	<car-search-bar @search="handleSearch"></car-search-bar>
                <!-- 렌트카 서치 바 넣는 곳 -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row" >
          <div class="col-md-6">
            <div class="intro ftco-animate d-flex justify-content-center align-items-center r-12 p-2 region-bg seoul" 
            	style="background-color: rgba(0, 0, 0, 0.3);background-blend-mode: multiply;height:400px;">
              <h3 class="text-center" style="font-size:48px;color:white">서울여행</h3>
            </div>
          </div>
          <div class="col-md-6">
            <div class="intro ftco-animate d-flex justify-content-center align-items-center r-12  p-2 region-bg jeju" 
            	style="background-color: rgba(0, 0, 0, 0.3);background-blend-mode: multiply;height:400px;">
              <h3 class="text-center" style="font-size:48px;color:white">제주여행</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">제주 여행, 지금 바로 계획해보세요</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 ftco-animate">
            <a
              href="../hotel/hotel_list.do"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-1.jpg)"
            >
              <div class="text text-center r-12">
                <h3>Hotels</h3>
              </div>
            </a>
          </div>
          <div class="col-md-4 ftco-animate">
            <a
              href="../car/car_list.do"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-2-1.jpg)"
            >
              <div class="text text-center r-12">
                <h3>Car Rentals</h3>
              </div>
            </a>
          </div>
          <div class="col-md-4 ftco-animate">
            <a
              href="../board/list.do"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-3.jpg)"
            >
              <div class="text text-center r-12">
                <h3>Community</h3>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-about d-md-flex">
      <div
        class="one-half img"
        style="background-image: url(../images/about.jpg)"
      ></div>
      <div class="one-half ftco-animate">
        <div class="heading-section ftco-animate">
          <h2 class="mb-4">당신의 소중한 여행, 우리가 함께합니다</h2>
        </div>
        <div>
          <p>
           	도시의 소음에서 멀어진 그곳,
			바람은 이야기를 전하고, 바다는 고요를 속삭이며,
			걷는 모든 길이 새로운 추억으로 이어집니다.
			제주도는 단순한 여행지가 아닌,
			지친 마음에 쉼을, 호기심에 설렘을,
			당신의 여행을 이야기로 바꿔주는 특별한 공간입니다.
			지금, 따뜻한 제주에서 당신만의 순간을 만나보세요.
          </p>
        </div>
      </div>
    </section>
	
	<!-- 호텔 랜덤 리스트 시작 -->
	<section class="ftco-section ">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Hotels</h2>
          </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm col-md-6 col-lg ftco-animate" v-for="hotel in hotels">
            <div class="destination">
              <a
                :href="'../hotel/hotel_detail.do?no='+hotel.no"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                :style="{ backgroundImage: 'url(' + hotel.img + ')' }"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <div class="d-flex">
                  <div class="one">
                    <h3><a :href="'../hotel/hotel_detail.do?no='+hotel.no">{{hotel.title}}</a></h3>
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
                    <span class="price per-price"
                      >{{hotel.price}}<br /><small>/박</small>
                      </span>
                  </div>
                </div>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <hr />
                <p class="bottom-area d-flex justify-content-between align-items-center">
				  <span class="text-truncate" style="max-width: 70%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
				    <i class="icon-map-o"></i> {{ hotel.addr }}
				  </span>
				  <span><a :href="'../hotel/hotel_detail.do?no='+hotel.no">객실 보기</a></span>
				</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- 호텔 랜덤 리스트 끝 -->
    
	<!-- 차량 랜덤 리스트 시작 -->
	<section class="ftco-section pt-0">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Cars</h2>
          </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm col-md-6 col-lg ftco-animate" v-for="car in cars">
            <div class="destination">
              <a
                :href="'../car/car_info.do?no='+car.no"
                class="img img-3 d-flex justify-content-center align-items-center r-12"
                :style="{ backgroundImage: 'url(' + car.poster + ')' }"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <div class="d-flex">
                  <div class="one">
                    <h3><a :href="'../car/car_info.do?no='+car.no">{{car.name}}</a></h3>
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
                    <span class="price per-price"
                      >{{car.premium_ins_price.toLocaleString()}}<br /><small>/24시간</small>
                      </span>
                  </div>
                </div>
                <p>
                  {{car.premium_ins_qual}}
                </p>
                <hr />
                <p class="bottom-area d-flex justify-content-between align-items-center">
				  <span class="text-truncate" style="max-width: 70%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
				    </i>{{car.car_class}}ㆍ{{car.seat}}인승ㆍ{{car.fuel}}ㆍ금연
				  </span>
				  <span><a :href="'../car/car_info.do?no='+car.no">차량 정보</a></span>
				</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- 차량 랜덤 리스트 끝 -->


    
    <section class="ftco-section-parallax" >
      <div class="parallax-img d-flex align-items-center" style="padding:8em 0">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div
              class="col-md-4 text-center heading-section heading-section-white ftco-animate"
            >
            
              <h2  style="border:5px solid white; border-radius:999px;">
              <c:if test="${sessionScope.id==null }">
              <a href="../member/login.do" style="color:white">문의하기</a>
              </c:if>
              <c:if test="${sessionScope.id!=null }">
              <a href="../customer/insert.do" style="color:white">문의하기</a>
              </c:if>
              </h2>
              
            </div>
          </div>
        </div>
      </div>
    </section>
</div>
<script src="../hotel/hotel_searchbar.js"></script>
<script src="../car/car_reserve_tab.js"></script>
<script src="../air/air_reserve_tab1.js"></script>
<script>
let mainApp = Vue.createApp({
	data() {
		return {
			hotels: [],
			cars:[]
		}
	},
	mounted() {
		this.hotelList()
		this.carList()
	},
	methods: {    
		handleSearch1(filters) {
	      this.isInbound      = false;
	      this.curpage        = 1;
	      this.list           = [];
	      this.from           = filters.from;
	      this.to             = filters.to;
	      this.departureDate  = filters.departureDate;
	      this.returnDate     = filters.returnDate;
	      this.adults         = filters.adults;
	      this.children       = filters.children;
	      this.fetchPage(); 
	      
	    },
	    
	    fetchPage() {
	        axios.get('/air/list_vue.do', {
	          params:{
	            page:this.curpage,
	            from:this.from,
	            to:this.to,
	            date:this.departureDate,
	            adults:   this.adults,
	            children: this.children,
	            
	          }
	        })
	        .catch(console.error);
	      },
		handleSearch({ checkin, checkout, person }) {
			// 쿼리스트링 가져온 후 vue로 보내기위한 메소드
			const query =
			      'checkin=' + encodeURIComponent(checkin) +
			      '&checkout=' + encodeURIComponent(checkout) +
			      '&person=' + encodeURIComponent(person);
			
			window.location.href = 'http://localhost:8080/hotel/hotel_list.do?' + query;
		},
		hotelList() {
			axios.get('http://localhost:8080/hotel/hotel_mainPage_vue.do')
			.then(res => {
				console.log(res.data)
				this.hotels = res.data
				this.$nextTick(() => {
  		          	contentWayPoint()
  		        })
			}).catch(err => {
				console.log(err.response)
			})
		},
		carList() {
			axios.get('http://localhost:8080/car/car_mainPage_vue.do')
			.then(res => {
				console.log(res.data)
				this.cars = res.data.list
				this.$nextTick(() => {
  		          	contentWayPoint()
  		        })
			}).catch(err => {
				console.log(err.response)
			})
		}
	},
	components:{
		'hotel-search-bar': hotel_searchbar,
		'car-search-bar':car_reserve_tab,
		'air-search-bar':air_reserve_tab1
	}
}).mount("#mainApp")
</script>
</body>
</html>