<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:100%;display: flex;justify-content: center;">
		<section class="ftco-section justify-content-end " style="width:80%;">
      <div class="container-wrap mx-auto">
        <div class="row no-gutters">
          <div class="col-md-12 tab-wrap rt-12 shadow" style="border-radius:10px">
            <div class="tab-content p-4 px-5" id="v-pills-tabContent">
              <div
                class="tab-pane fade show active"
                id="v-pills-1"
                role="tabpanel"
                aria-labelledby="v-pills-nextgen-tab"
              >
                <form action="#" class="search-destination">
                  <div class="row">
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">Where</label>
                        <div class="form-field">
                          <div class="icon">
                            <span class="icon-map-marker"></span>
                          </div>
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Where"
                          />
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">Check In</label>
                        <div class="form-field">
                          <div class="icon">
                            <span class="icon-map-marker"></span>
                          </div>
                          <input
                            type="text"
                            class="form-control checkin_date"
                            placeholder="Check In"
                          />
                        </div>
                      </div>
                    </div>
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">Check Out</label>
                        <div class="form-field">
                          <div class="icon">
                            <span class="icon-map-marker"></span>
                          </div>
                          <input
                            type="text"
                            class="form-control checkout_date"
                            placeholder="From"
                          />
                        </div>
                      </div>
                    </div>
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">Guest</label>
                        <div class="form-field">
                          <div class="select-wrap">
                            <div class="icon">
                              <span class="ion-ios-arrow-down"></span>
                            </div>
                            <select name="" id="" class="form-control">
                              <option value="">1</option>
                              <option value="">2</option>
                              <option value="">3</option>
                              <option value="">4</option>
                              <option value="">5</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md align-self-end">
                      <div class="form-group">
                        <div class="form-field">
                          <input
                            type="submit"
                            value="Search"
                            class="form-control btn btn-primary"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	</div>
    <section class="ftco-section" id="hotelListApp">
      <div class="container">
        <div class="row">
        
<!--           <div -->
<!--             class="col-lg-3 sidebar order-md-last ftco-animate shadow pt-3" -->
<!--             id="sidebar" -->
<!--           > -->
<!--             <div class="sidebar-wrap ftco-animate"> -->
<!--               <h3 class="heading mb-4">필터</h3> -->
<!--               <form action="#"> -->
<!--                 <div class="fields"> -->
<!--                   <p style="font-size: 18px">필터명</p> -->
<!--                   <div class="form-group col-12 px-0"> -->
<!--                     <label class="checkBoxAll pb-1"> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn checked">전체</span> -->
<!--                     </label> -->
<!--                     <label> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn">check</span> -->
<!--                     </label> -->
<!--                     <label> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn">check</span> -->
<!--                     </label> -->
<!--                     <label> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn">check</span> -->
<!--                     </label> -->
<!--                     <label c> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn">check</span> -->
<!--                     </label> -->
<!--                     <label> -->
<!--                       <input -->
<!--                         type="checkbox" -->
<!--                         name="test" -->
<!--                         id="test" -->
<!--                         style="display: none" -->
<!--                       /> -->
<!--                       <span class="checkBtn">check</span> -->
<!--                     </label> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <input -->
<!--                       type="text" -->
<!--                       id="checkin_date" -->
<!--                       class="form-control checkin_date" -->
<!--                       placeholder="Date from" -->
<!--                     /> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <input -->
<!--                       type="text" -->
<!--                       id="checkout_date" -->
<!--                       class="form-control checkout_date" -->
<!--                       placeholder="Date to" -->
<!--                     /> -->
<!--                   </div> -->

<!--                   <div class="form-group"> -->
<!--                     <input -->
<!--                       type="submit" -->
<!--                       value="Search" -->
<!--                       class="btn btn-primary py-3 px-5" -->
<!--                     /> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
<!--           </div> -->
          <!-- END-->
          <div class="col-lg-9">
            <div class="row mr-3 pt-3 shadow r-12 secb">
              <div class="col-sm col-md-6 col-lg-4 ftco-animate">
                <div class="destination">
                  <a
                    href="../hotel/hotel_detail.do"
                    class="img img-2 d-flex justify-content-center align-items-center r-12"
                    style="background-image: url(../images/hotel-1.jpg)"
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
                        <h3><a href="#">New Orleans, LA</a></h3>
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
                        <span class="price per-price"
                          >$40<br /><small>/night</small></span
                        >
                      </div>
                    </div>
                    <p>
                      Far far away, behind the word mountains, far from the
                      countries
                    </p>
                    <hr />
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i> Miami, Fl</span>
                      <span class="ml-auto"><a href="#">Book Now</a></span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- .col-md-8 -->
        </div>
        <!-- 페이지네이션 -->
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a class="page-link" @click="prev()">&lt;</a></li>
                <li :class="i==curpage?'page-item active':'page-item'" v-for="i in range(startPage,endPage)"><a class="page-link" @click="pageChange(i)"><span>{{i}}</span></a></li>
                <li><a class="page-link" @click="next()">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script>
      let hotelListApp=Vue.createApp({
    	  data() {
    		  return {
    			  list:[],
    			  curpage: 1,
    			  totalpage: 0,
    			  startPage: 0,
    			  endPage: 0
    		  }
    	  },
    	  mounted() {
    		  this.dataRecv()
    	  },
    	  methods: {
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
      		range(start,end) {
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
      				
      			}).then(res => {
      				console.log(res.data)
      				this.list = res.data.list
      				this.curpage = res.data.curpage
      				this.totalpage = res.data.totalpage
      				this.startPage = res.data.startPage
      				this.endPage = res.data.endPage
      			}).catch(error => {
      				console.log(error.response)
      			})
      		}
    	  }
      }).mount("#hotelListApp")
    </script>
</body>
</html>