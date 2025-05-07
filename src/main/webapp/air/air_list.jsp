<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
<style type="text/css">
span:hover,a:hover{
	cursor:pointer
}
</style>
    
</head>
<body>
	<div id="listApp">
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
                <form @submit.prevent="dataRecv" class="search-destination">
                  <div class="row">
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label>출발</label>
                        <div class="select-wrap">
                            <div class="icon">
                              <span class="ion-ios-arrow-down"></span>
                            </div>
                            <select name="" id="" class="form-control" >
                              <option value="">출발 공항</option>
                              <option value="">서울</option>
                              <option value="">제주</option>
                            </select>
                          </div>
                      </div>
                    </div>
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">도착</label>
                       <div class="select-wrap">
                            <div class="icon">
                              <span class="ion-ios-arrow-down"></span>
                            </div>
                            <select name="" id="" class="form-control" >
                              <option value="">도착 공항</option>
                              <option value="">서울</option>
                              <option value="">제주</option>
                            </select>
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
					        v-model="checkin"
					        type="date"
					        class="form-control"
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
		        v-model="checkout"
		        type="date"
		        class="form-control"
		      />
		    </div>
                      </div>
                    </div>
                    <div class="col-md align-items-end">
                      <div class="form-group">
                        <label for="#">Travelers</label>
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

              <div
                class="tab-pane fade"
                id="v-pills-2"
                role="tabpanel"
                aria-labelledby="v-pills-performance-tab"
              >
                <form action="#" class="search-destination">
                  <div class="row">
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

              <div
                class="tab-pane fade"
                id="v-pills-3"
                role="tabpanel"
                aria-labelledby="v-pills-effect-tab"
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
    <section class="ftco-section ftco-degree-bg" style="margin:0px;padding:20px">
      <div class="container">
        <div class="row">
          <ul class="col-12 nav nav-tabs">
            <li class="nav-item">
              <a
                class="tablink nav-link active cursor-pointer"
                onclick="openPage('Home')"
                aria-current="page"
                @click="test()"
                >Active</a
              >
            </li>
          </ul>
          <div
            id="About"
            class="tabcontent"
            style="
              color: white;
              display: none;
              padding: 100px 20px;
              height: 100%;
            "
          >
            <h3>About</h3>
            <p>Who we are and what we do.</p>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section" style="margin:0px;padding:0px">
      <div class="container" style="width:100%">
        <div class="row d-flex " >
          <div class="col-12 col-md-4 d-flex ftco-animate" v-for="vo in list">
            <div class="blog-entry align-self-stretch ">
              <div class="text" style="margin-bottom:0px">
                <h3 class="heading" style="margin-bottom:0px"><a href="#">{{vo.dep_airport_code}}</a></h3>
                
                <hr style="margin:0px"/>
                <h3 class="heading" style="margin-bottom:0px;float:left"><a href="#">
                	{{vo.economy_charge()}}원
                </a></h3>
                <span style="margin-bottom:0px;margin-left:6px;position:relative;top:4px;font-size:12px"><a href="#"></a></span>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </section>
    <div class="row mt-5 mb-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li v-if="startPage>1" ><span  @click="prev()">&lt;</span></li>
                <li :class="i==curpage?'page-item active':'page-item'" v-for="i in range(startPage,endPage)"><span @click="pageChange(i)">{{i}}</span></li>
                <li v-if="endPage<totalpage"><span  @click="next()">&gt;</span></li>
              </ul>
            </div>
          </div>
        </div>
     </div>
    <!--검색-->
    <script>
    	let listApp=Vue.createApp({
    		data(){
        		return {
        			list:[],
        			curpage:1,
        			totalpage:0,
        			startPage:0,
        			endPage:0
        		}
        	},
        	mounted(){
        		// 시작과 동시에 데이터 읽기 => window.onload 
        		// jquery/angularjs => 연동시에 주로 사용 
        		// $(function(){})
        		// useEffect()
        		this.dataRecv()
        	},
        	computed:{
        		price_convert(price){
        			return price.toLocaleString()
        		}
        	},
        	methods:{
        		prev(){
        			this.curpage=this.startPage-1
        			this.dataRecv()
        		},
        		next(){
        			this.curpage=this.endPage+1
        			this.dataRecv()
        		},
        		pageChange(page){
        			this.curpage=page
        			this.dataRecv()
        		},
        		range(start,end){
        			let arr=[]
        			let len=end-start
        			for(let i=0;i<=len;i++)
        			{
        				arr[i]=start
        				start++
        			}
        			return arr
        		},
        		dataRecv(){
        			axios.get('../air/list_vue.do', {
        		        params: {
        		          page: this.curpage,
        		          from: this.from,
        		          to: this.to,
        		          checkin: this.checkin,
        		          checkout: this.checkout,
        		          travellers: this.travellers
        		        }
            		}).then(res=>{
            			console.log(res.data)
            			this.list=res.data.list
            			this.curpage=res.data.curpage
            			this.totalpage=res.data.totalpage
            			this.startPage=res.data.startPage
            			this.endPage=res.data.endPage
            		}).catch(error=>{
            			console.log(error.response)
            		})
        		}
        	}
    	}).mount("#listApp")
    </script>
   
    <script>
      function openPage(pageName, elmnt, color) {
        // Hide all elements with class="tabcontent" by default */
        var i, tabcontent, tablinks;

        // Remove the background color of all tablinks/buttons
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].classList.remove("active");
        }

        // Show the specific tab content

        // Add the specific color to the button used to open the tab content
        elmnt.classList.add("active");
      }


    </script>
  </body>
</body>
</html>