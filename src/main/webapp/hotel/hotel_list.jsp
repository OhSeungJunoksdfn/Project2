<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.checkBtn {
	margin: 1px;
	padding: 2px 10px;
	white-space: nowrap;
}
</style>
</head>
<body>
  <div style="width:100%;display: flex;justify-content: center;">
	<section class="ftco-section" id="hotelListApp">
      <div class="container">
        <div class="row">
          <!--사이드바-->
          <div class="col-lg-3 sidebar ftco-animate shadow pt-3">
            <div class="sidebar-wrap ftco-animate">
              <h3 class="heading mb-4">상세 검색</h3>
              <form action="#">
                <div class="fields">
                  <p style="font-size: 18px">지역</p>
                  <div class="form-group col-12 px-0">
                    <label class="checkBoxAll pb-1">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: areacode === 0 }" @click="selAreacode(0)">전체</span>
                    </label>
                    <br>
                    <label>
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: areacode === 1 }" @click="selAreacode(1)">서울</span>
                    </label>
                    <label>
                      <input type="checkbox" style="display: none" />
                      <span class="checkBtn" :class="{ checked: areacode === 39 }" @click="selAreacode(39)">제주</span>
                    </label>
                    
                    <p style="font-size: 18px" v-show="locDetail">지역 상세</p>
                    <label class="checkBoxAll pb-1">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: sigungucode === sgg.sigungucode }" v-for="sgg in filterSGG" 
                      :key="sgg.areacode+'_'+sgg.sigungucode" @click="selSigungucode(sgg.sigungucode)">{{ sgg.name }}</span>
                    </label>
                   
                    <p style="font-size: 18px" v-show="locDetail">숙박 타입</p>
                    <label class="checkBoxAll pb-1">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn checked" v-if="areacode === 1" @click="selCat3('B02010100')">호텔</span>
                    </label>
                    
                    
                    <label class="checkBoxAll pb-1" v-if="areacode === 39">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: cat3 === '' }" @click="selCat3('')">전체</span>
                    </label>
                    <label class="checkBoxAll pb-1" v-if="areacode === 39">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: cat3 === 'B02010100' }" @click="selCat3('B02010100')">호텔</span>
                    </label>
                    <label class="checkBoxAll pb-1" v-if="areacode === 39">
                      <input type="checkbox" style="display: none"/>
                      <span class="checkBtn" :class="{ checked: cat3 === 'B02010700' }" @click="selCat3('B02010700')">펜션</span>
                    </label>
                    
                    
<!--                     <div class="form-group"> -->
<!-- 		              	<div class="range-slider"> -->
<!-- 		              		<span> -->
<!-- 								<input type="number" value="50000" min="0" max="250000"/>	- -->
<!-- 								<input type="number" value="50000" min="0" max="120000"/> -->
<!-- 							</span> -->
<!-- 								<input value="1000" min="0" max="120000" step="500" type="range"/> -->
<!-- 								<input value="50000" min="0" max="120000" step="500" type="range"/> -->
<!-- 						</div> -->
<!-- 		            </div> -->
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      id="checkin_date"
                      class="form-control checkin_date"
                      placeholder="Date from"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      id="checkout_date"
                      class="form-control checkout_date"
                      placeholder="Date to"
                    />
                  </div>

                  <div class="form-group">
                    <input
                      type="submit"
                      value="Search"
                      class="btn btn-primary py-3 px-5"
                    />
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- END-->
          <div class="col-lg-9">
            <div class="row parent">
              <!-- 카드-->
              <div class="col-12 ftco-animate" v-for="vo in list">
               <div>
                <div
                  class="destination d-flex shadow"
                  style="
                    border-radius: 12px;
                    border: 1px solid #eee;
                    overflow: hidden;
                  "
                >
                  <a
                    :href="'../hotel/hotel_detail.do?no='+vo.no"
                    class="col-3 img img-2 d-flex justify-content-center align-items-center"
                  >
                  <img :src="vo.img">
                    <div
                      class="icon d-flex justify-content-center align-items-center"
                    >
                      <span class="icon-link"></span>
                    </div>
                  </a>

                  <div class="col-9 text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3><a :href="'../hotel/hotel_detail.do?no='+vo.no">{{ vo.title }}</a></h3>
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
                        <span class="price text-nowrap">{{ commaPrice(vo.price) }}원<br><small> / 1박</small></span>
                      </div>
                    </div>
                    <p>
                      {{ vo.person }} {{vo.person_max}}
                    </p>
                    <p class="days"><span></span></p>
                    <hr />
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i>{{ vo.addr }}</span>
                      <span class="ml-auto"><a href="#">바로 예약</a></span>
                    </p>
                  </div>
                </div>
              </div>
              <!-- 카드 끝-->
              </div>
            </div>
          </div>
          <!-- .col-md-8 -->
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li class="cursor-pointer" v-if="startPage > 1"><span @click="prev()">&lt;</span></li>
                <li class="cursor-pointer" v-for="i in range(startPage, endPage)" :class="i === curpage?'active':''"><span @click="pageChange(i)">{{i}}</span></li>
                <li class="cursor-pointer" v-if="endPage < totalpage"><span @click="next()">&gt;</span></li>
              </ul>
            </div>
          </div>
        </div>
       </div>
     </section>
  </div>
    <script>
      let hotelListApp=Vue.createApp({
    	  data() {
    		  return {
    			  list: [],
    			  SGGList: [],
    			  curpage: 1,
    			  totalpage: 0,
    			  startPage: 0,
    			  endPage: 0,
    			  areacode: [],
    			  sigungucode: [],
    			  sort: 'price_asc',
    			  locDetail: false,
    			  cat3: '',
    		  }
    	  },
    	  computed: {
			filterSGG() {
	      		return this.SGGList.filter(ssg =>
	      		ssg.areacode === this.areacode
	      		)
	      	}
	      },
    	  mounted() {
    			this.dataRecv()
    	  },
    	  methods: {
    		selCat3(Ccode) {
    			this.cat3 = Ccode
    			this.curpage = 1
    			this.dataRecv()
    		},
    		selSigungucode(Scode) {
    			this.sigungucode = Scode
    			this.curpage = 1
    			this.dataRecv()
    		},
    		selAreacode(Acode) {
    			this.areacode = Acode
    			this.curpage = 1
    			this.sigungucode = 0
    			this.locDetail = Acode !== 0
    			this.dataRecv()
    		},
    		commaPrice(price) {
    			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    		},
    		prev(){
      			this.curpage = this.startPage-1
      			this.dataRecv()
      		},
      		next() {
      			this.curpage = this.endPage+1
      			this.dataRecv()
      		},
      		pageChange(page) {
      			this.curpage = page
      			this.dataRecv()
      		},
      		range(start, end) {
      			let arr = []
      			let len = end-start
      			for(let i=0; i<=len; i++)
      			{
      				arr[i] = start
      				start++
      			}
      			return arr
      		},
      		dataRecv() {
      			axios.get('http://localhost:8080/hotel/list_vue.do', {
      				params: {
	      				page: this.curpage,
	      				areacode: this.areacode,
	      				sigungucode: this.sigungucode,
	      				cat3: this.cat3,
	      				sort: this.sort,
      				}
      			}).then(res => {
      				console.log(res.data)
      				this.list = res.data.list
      			    this.curpage = res.data.curpage
      			    this.totalpage = res.data.totalpage
      			    this.startPage = res.data.startPage
      			    this.endPage = res.data.endPage
      			    this.SGGList = res.data.SGGList
      			    window.scrollTo({ top: 0, behavior: 'smooth' })
      			    
      			  	this.$nextTick(() => {
      		          	contentWayPoint()
      		        })
      			}).catch(error => {
      				console.log(error.response)
      			})
      		}
    	  }
      }).mount("#hotelListApp")
    </script>
</body>
</html>