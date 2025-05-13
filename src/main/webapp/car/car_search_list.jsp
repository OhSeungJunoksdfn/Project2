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
<script src="./car_reserve_tab.js"></script>
<style type="text/css">
.checkBtn {
	margin: 1px;
	padding: 2px 10px;
	white-space: nowrap;
}
</style>
</head>
<body>
	
	<div id="app">
  	<car-reserve-tab :onclickhandler="test"></car-reserve-tab>
  	<section class="ftco-section" style="margin-top:0px;padding-top:0px">
      <div class="container">
        <div class="row">
        
          <!-- 사이드바 -->
          <div
            class="col-lg-3 sidebar ftco-animate shadow pt-3"
            id="sidebar"
          >
            <div class="sidebar-wrap ftco-animate">
              <h3 class="heading mb-4">필터</h3>
              <form action="#">
                <div class="fields">
                  <p style="font-size: 18px">필터명</p>
                  <div class="form-group col-12 px-0">
                    <label class="checkBoxAll pb-1">
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn checked">전체</span>
                    </label>
                    <label>
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn">check</span>
                    </label>
                    <label>
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn">check</span>
                    </label>
                    <label>
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn">check</span>
                    </label>
                    <label c>
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn">check</span>
                    </label>
                    <label>
                      <input
                        type="checkbox"
                        name="test"
                        id="test"
                        style="display: none"
                      />
                      <span class="checkBtn">check</span>
                    </label>
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
          <!-- 사이드바 -->
          

          <div class="col-lg-9" >
            <div class="row parent">
              <!-- 카드-->
              <div class="col-12 ftco-animate" v-for="vo in list">
               <div>
                <div
                  class="destination d-flex shadow"
                  style="
                    border-radius: 12px;
                    border: 1px solid #eee;
                    overflow:hidden;
                    
                  "
                >
                  <a
                    :href="'../car/car_detail.do?no='+vo.no+'&pudate=${pudate }&putime=${putime }&rdate=${rtime }&rtime=${rtime }'"
                    class="col-3 d-flex justify-content-center align-items-center"
                
                  >
                  <img :src="vo.poster"
                  	style="width:230px;">
                    <div
                      class="icon d-flex justify-content-center align-items-center"
                    >
                      <span class="icon-link"></span>
                    </div>
                  </a>

                  <div class="col-9 text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3>
                        	<a :href="'../car/car_detail.do?no='+vo.no+'&pudate=${pudate }&putime=${putime }&rdate=${rtime }&rtime=${rtime }'">
                        		{{vo.name }}
                        	</a>
                        </h3>
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
                        <span class="price text-nowrap">{{vo.premium_ins_price}}&nbsp;<br><small> / 24시간</small></span>
                      </div>
                    </div>
                    <p>
                      {{vo.car_class}}ㆍ{{vo.seat}}인승ㆍ{{vo.fuel}}ㆍ금연
                    </p>
                    <p class="days"><span></span></p>
                    <hr />
                    <p class="bottom-area d-flex">
                    	{{vo.non_ins_qual}}
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
        
        
        <div class="col text-center mt-5 mb-5" >
           <div class="block-27">
             <ul>
               <li v-if="startPage>1" ><span  @click="prev()">&lt;</span></li>
               <li :class="i==curpage?'page-item active':'page-item'" v-for="i in range(startPage,endPage)"><span @click="pageChange(i)">{{i}}</span></li>
               <li v-if="endPage<totalpage"><span  @click="next()">&gt;</span></li>
             </ul>
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
    			  curpage: 1,
    			  totalpage: 0,
    			  startPage: 0,
    			  endPage: 0,
    			  pudate:'${pudate}',
    			  putime:'${putime}',
    			  rdate:'${rdate}',
    			  rtime:'${rtime}',
    		  }
    	  },
    	  computed: {
	      },
    	  mounted() { 	  
    			this.dataRecv()
    	  },
    	  methods: {
    		prev(){
      			this.curpage = this.startPage-1
      			this.dataRecv()
      			window.scrollTo({ top: 0, behavior: 'smooth' })
      		},
      		next() {
      			this.curpage = this.endPage+1
      			this.dataRecv()
      			window.scrollTo({ top: 0, behavior: 'smooth' })
      		},
      		pageChange(page) {
      			this.curpage = page
      			this.dataRecv()
      			window.scrollTo({ top: 0, behavior: 'smooth' })
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
      			axios.get('http://localhost:8080/car/list_search_vue.do', {
      				params: {
	      				page: this.curpage,
						pudate:this.pudate,
						putime:this.putime,
						rdate:this.rdate,
						rtime:this.rtime,
      				}

      			}).then(res => {
      				console.log(res.data)
      				this.list = res.data.list
      			    this.curpage = res.data.curpage
      			    this.totalpage = res.data.totalpage
      			    this.startPage = res.data.startPage
      			    this.endPage = res.data.endPage
      			    
      			  	this.$nextTick(() => {
      		          	contentWayPoint()
      		        })
      			}).catch(error => {
      				console.log(error.response)
      			})
      		}
    	  },
    	  components:{
      		'car-reserve-tab':car_reserve_tab
      	  }
    	  
      }).mount("#app")
    </script>
</body>
</html>