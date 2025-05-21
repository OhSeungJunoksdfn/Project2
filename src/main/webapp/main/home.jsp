<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"          import="org.jsoup.Jsoup,
                 org.jsoup.nodes.Document,
                 org.jsoup.nodes.Element" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .region-bg {
      background-size: cover;
      background-position: center;
      color: #fff;               /* 텍스트 가시성 확보 */
    }
    .region-bg.seoul {
      background-image: url('${pageContext.request.contextPath}/images/background_seoul.jpg');
    }
    .region-bg.jeju {
      background-image: url('${pageContext.request.contextPath}/images/background_jeju.jpg');
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
                <!-- 렌트카 서치 바 넣는 곳 -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-4">
            <div class="intro ftco-animate r-12 sidebar shadow p-2 region-bg seoul">
              <h3 class="text-center"> < 서울여행 ></h3>
              <p>
                대한민국의 수도 ‘서울’은 K-컬처를 필두로 빠르게 성장하는 문화 트렌드와 600년 역사와 전통이 만나 다양한 요소들의 조화로움을 느낄 수 있는 도시입니다.<br/>
                다채로운 매력으로 가득한 도시 서울은 글로벌 관광도시의 최전선으로 나아가고 있습니다.
              </p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="intro ftco-animate r-12 sidebar shadow p-2 region-bg jeju">
              <h3 class="text-center">< 제주여행 ></h3>
              <p>
                제주도는 아름다운 자연 경관과 다양한 관광 명소를 보유한 섬으로, 한국에서 가장 큰 섬입니다.<br/> 제주 여행은 자연을 즐기는 사람들에게 특히 매력적이며, 다양한 테마로 여행을 즐길 수 있습니다.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">See our latest vacation ideas</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 ftco-animate">
            <a
              href="#"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-1.jpg)"
            >
              <div class="text text-center r-12">
                <h3>Beachfront Scape</h3>
              </div>
            </a>
          </div>
          <div class="col-md-4 ftco-animate">
            <a
              href="#"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-2-1.jpg)"
            >
              <div class="text text-center r-12">
                <h3>Group Holidays</h3>
              </div>
            </a>
          </div>
          <div class="col-md-4 ftco-animate">
            <a
              href="#"
              class="destination-entry img r-12"
              style="background-image: url(../images/destination-3.jpg)"
            >
              <div class="text text-center r-12">
                <h3>City Breaks</h3>
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
          <h2 class="mb-4">The Best Travel Agency</h2>
        </div>
        <div>
          <p>
            On her way she met a copy. The copy warned the Little Blind Text,
            that where it came from it would have been rewritten a thousand
            times and everything that was left from its origin would be the word
            "and" and the Little Blind Text should turn around and return to its
            own, safe country. But nothing the copy said could convince her and
            so it didn’t take long until a few insidious Copy Writers ambushed
            her, made her drunk with Longe and Parole and dragged her into their
            agency, where they abused her for their.
          </p>
        </div>
      </div>
    </section>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch">
            <div
              class="media block-6 services d-block ftco-animate sidebar shadow r-12 p-3"
            >
              <div class="icon"><span class="flaticon-yatch"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Special Activities</h3>
                <p>
                  A small river named Duden flows by their place and supplies.
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div
              class="media block-6 services d-block sidebar shadow-inner r-12 p-3"
            >
              <div class="icon"><span class="flaticon-around"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Travel Arrangements</h3>
                <p>
                  A small river named Duden flows by their place and supplies.
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div
              class="media block-6 services d-block ftco-animate sidebar shadow r-12 p-3"
            >
              <div class="icon"><span class="flaticon-compass"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Private Guide</h3>
                <p>
                  A small river named Duden flows by their place and supplies.
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div
              class="media block-6 services d-block sidebar shadow-inner r-12 p-3"
            >
              <div class="icon">
                <span class="flaticon-map-of-roads"></span>
              </div>
              <div class="media-body">
                <h3 class="heading mb-3">Location Manager</h3>
                <p>
                  A small river named Duden flows by their place and supplies.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Most Popular Destination</h2>
          </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm col-md-6 col-lg ftco-animate">
            <div class="destination">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/destination-1.jpg)"
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
                    <h3><a href="#">Paris, Italy</a></h3>
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
                    <span class="price">$200</span>
                  </div>
                </div>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <p class="days"><span>2 days 3 nights</span></p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Discover</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm col-md-6 col-lg ftco-animate">
            <div class="destination d-md-flex flex-column-reverse">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/destination-2.jpg)"
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
                    <h3><a href="#">Paris, Italy</a></h3>
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
                    <span class="price">$200</span>
                  </div>
                </div>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <p class="days"><span>2 days 3 nights</span></p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Discover</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm col-md-6 col-lg ftco-animate">
            <div class="destination">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/destination-3.jpg)"
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
                    <h3><a href="#">Paris, Italy</a></h3>
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
                    <span class="price">$200</span>
                  </div>
                </div>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <p class="days"><span>2 days 3 nights</span></p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Discover</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm col-md-6 col-lg ftco-animate">
            <div class="destination d-md-flex flex-column-reverse">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/destination-4.jpg)"
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
                    <h3><a href="#">Paris, Italy</a></h3>
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
                    <span class="price">$200</span>
                  </div>
                </div>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <p class="days"><span>2 days 3 nights</span></p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Discover</a></span>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section
      class="ftco-section ftco-counter img"
      id="section-counter"
      style="background-image: url(../images/bg_1.jpg)"
      data-stellar-background-ratio="0.5"
    >
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-10">
            <div class="row">
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="100000">0</strong>
                    <span>Happy Customers</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="40000">0</strong>
                    <span>Destination Places</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="87000">0</strong>
                    <span>Hotels</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="56400">0</strong>
                    <span>Restaurant</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- 호텔 랜덤 리스트 시작 -->
    <section class="ftco-section">
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
          <!-- 호텔 랜덤 리스트 끝 -->
        </div>
      </div>
    </section>

    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div
            class="col-md-7 text-center heading-section heading-section-white ftco-animate"
          >
            <h2 class="mb-4">Our satisfied customer says</h2>
            <p>
              Far far away, behind the word mountains, far from the countries
              Vokalia and Consonantia, there live the blind texts. Separated
              they live in
            </p>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div
                    class="user-img mb-5"
                    style="background-image: url(../images/person_1.jpg)"
                  >
                    <span
                      class="quote d-flex align-items-center justify-content-center"
                    >
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5">
                      Far far away, behind the word mountains, far from the
                      countries Vokalia and Consonantia, there live the blind
                      texts.
                    </p>
                    <p class="name">Mark Web</p>
                    <span class="position">Marketing Manager</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div
                    class="user-img mb-5"
                    style="background-image: url(../images/person_2.jpg)"
                  >
                    <span
                      class="quote d-flex align-items-center justify-content-center"
                    >
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5">
                      Far far away, behind the word mountains, far from the
                      countries Vokalia and Consonantia, there live the blind
                      texts.
                    </p>
                    <p class="name">Mark Web</p>
                    <span class="position">Interface Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div
                    class="user-img mb-5"
                    style="background-image: url(../images/person_3.jpg)"
                  >
                    <span
                      class="quote d-flex align-items-center justify-content-center"
                    >
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5">
                      Far far away, behind the word mountains, far from the
                      countries Vokalia and Consonantia, there live the blind
                      texts.
                    </p>
                    <p class="name">Mark Web</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div
                    class="user-img mb-5"
                    style="background-image: url(../images/person_1.jpg)"
                  >
                    <span
                      class="quote d-flex align-items-center justify-content-center"
                    >
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5">
                      Far far away, behind the word mountains, far from the
                      countries Vokalia and Consonantia, there live the blind
                      texts.
                    </p>
                    <p class="name">Mark Web</p>
                    <span class="position">Web Developer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div
                    class="user-img mb-5"
                    style="background-image: url(../images/person_1.jpg)"
                  >
                    <span
                      class="quote d-flex align-items-center justify-content-center"
                    >
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5">
                      Far far away, behind the word mountains, far from the
                      countries Vokalia and Consonantia, there live the blind
                      texts.
                    </p>
                    <p class="name">Mark Web</p>
                    <span class="position">System Analyst</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Recommended Restaurants</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="destination">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/restaurant-1.jpg)"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <h3><a href="#">Luxury Restaurant</a></h3>
                <p class="rate">
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star-o"></i>
                  <span>8 Rating</span>
                </p>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Discover</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="destination d-md-flex flex-column-reverse">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/restaurant-2.jpg)"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <h3><a href="#">Luxury Restaurant</a></h3>
                <p class="rate">
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star-o"></i>
                  <span>8 Rating</span>
                </p>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Book Now</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="destination">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/restaurant-3.jpg)"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <h3><a href="#">Luxury Restaurant</a></h3>
                <p class="rate">
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star-o"></i>
                  <span>8 Rating</span>
                </p>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Book Now</a></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="destination d-md-flex flex-column-reverse">
              <a
                href="#"
                class="img img-2 d-flex justify-content-center align-items-center r-12"
                style="background-image: url(../images/restaurant-4.jpg)"
              >
                <div
                  class="icon d-flex justify-content-center align-items-center"
                >
                  <span class="icon-link"></span>
                </div>
              </a>
              <div class="text p-3">
                <h3><a href="#">Luxury Restaurant</a></h3>
                <p class="rate">
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star"></i>
                  <i class="icon-star-o"></i>
                  <span>8 Rating</span>
                </p>
                <p>
                  Far far away, behind the word mountains, far from the
                  countries
                </p>
                <hr />
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i> San Franciso, CA</span>
                  <span class="ml-auto"><a href="#">Book Now</a></span>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2><strong>Tips</strong> &amp; Articles</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20 r-12"
                style="background-image: url('../images/image_1.jpg')"
              >
              </a>
              <div class="text">
                <span class="tag">Tips, Travel</span>
                <h3 class="heading mt-3">
                  <a href="#"
                    >8 Best homestay in Philippines that you don't miss out</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">October 3, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20 r-12"
                style="background-image: url('../images/image_2.jpg')"
              >
              </a>
              <div class="text">
                <span class="tag">Culture</span>
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">October 3, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20 r-12"
                style="background-image: url('../images/image_3.jpg')"
              >
              </a>
              <div class="text">
                <span class="tag">Tips, Travel</span>
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">October 3, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div
              class="col-md-7 text-center heading-section heading-section-white ftco-animate"
            >
              <h2>Subcribe to our Newsletter</h2>
              <p>
                Far far away, behind the word mountains, far from the countries
                Vokalia and Consonantia, there live the blind texts. Separated
                they live in
              </p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Enter email address"
                      />
                      <input
                        type="submit"
                        value="Subscribe"
                        class="submit px-3"
                      />
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</div>
<script src="../hotel/hotel_searchbar.js"></script>
<script>
let mainApp = Vue.createApp({
	data() {
		return {
			hotels: [],
		}
	},
	mounted() {
		this.hotelList()
	},
	methods: {
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
		}
	},
	components:{
		'hotel-search-bar': hotel_searchbar
	}
}).mount("#mainApp")
</script>
</body>
</html>