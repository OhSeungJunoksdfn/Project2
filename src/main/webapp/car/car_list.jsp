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
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
function login(){
	Shadowbox.open({
		content:'../car/car_list.do',
		player:'iframe',
		width:300,
		height:260,
		title:'로그인'
	})
}
</script>
<script src="./car_reserve_tab.js"></script>
</head>
<body>
	<div id="listApp">
	
	<car-reserve-tab :onclickhandler="test"></car-reserve-tab>
	
    <section class="ftco-section ftco-degree-bg" style="margin:0px;padding:20px">
      <div class="container">
        <div class="row">
          <ul class="col-12 nav nav-tabs">
          	<li class="nav-item">
              <a
                class="tablink nav-link cursor-pointer"
                :class="{active:tabVal==='전체'}"
                @click="tabSwitch('전체')"
                aria-current="page"
                >전체</a
              >
            </li>
            <li class="nav-item">
              <a
                class="tablink nav-link cursor-pointer"
                :class="{active:tabVal==='전기차'}"
                @click="tabSwitch('전기차')"
                aria-current="page"
                >전기차</a
              >
            </li>
            <li class="nav-item">
              <a
                class="tablink nav-link cursor-pointer"
                :class="{active:tabVal==='SUV'}"
                @click="tabSwitch('SUV')"
                >SUV</a
              >
            </li>
            <li class="nav-item">
              <a
                class="tablink nav-link cursor-pointer"
                :class="{active:tabVal==='승합차'}"
                @click="tabSwitch('승합차')"
                >승합차</a
              >
            </li>
            <li class="nav-item">
              <a
                class="tablink nav-link cursor-pointer"
                :class="{active:tabVal==='수입차'}"
                @click="tabSwitch('수입차')"
                >수입차</a
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
              <!-- <a href="blog-single.html" class="block-20 r-12" :style="{'background-image': 'url('+ vo.poster +')',width:'300px' }">
              </a> -->
              <a href="blog-single.html" class="block-20 r-12">
              	<img class="block-20 r-12" :src="vo.poster" style="width:300px">
              </a>
              
              <div class="text" style="margin-bottom:0px">
                <h3 class="heading" style="margin-bottom:0px"><a href="#">{{vo.name}}</a></h3>
                <div class="meta">
                  <div style="margin-bottom:0px"><a href="#">{{vo.car_class}}ㆍ{{vo.seat}}인승ㆍ{{vo.fuel}}ㆍ금연</a></div>
                </div>
                <hr style="margin:0px"/>
                <h3 class="heading" style="margin-bottom:0px;float:left"><a href="#">
                	{{vo.premium_ins_price.toLocaleString()}}원
                </a></h3>
                <span style="margin-bottom:0px;margin-left:6px;position:relative;top:4px;font-size:12px"><a href="#">/ 24시간</a></span>
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
        			endPage:0,
        			tabVal:'전체'
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
        		test(){
        			console.log("testtttt")
        		},
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
        		tabSwitch(val) {
        	        this.tabVal = val
        	        this.curpage=1,
        	        this.dataRecv()
        	    },
        		dataRecv(){
        			axios.get('../car/list_vue.do',{
            			params:{
            				page:this.curpage,
            				tabVal:this.tabVal
            			}
            		}).then(res=>{
            			console.log(res.data)
            			this.list=res.data.list
            			this.curpage=res.data.curpage
            			this.totalpage=res.data.totalpage
            			this.startPage=res.data.startPage
            			this.endPage=res.data.endPage
            			this.$nextTick(() => {
                            contentWayPoint()
                       })
            		}).catch(error=>{
            			console.log(error.response)
            		})
        		}
        		
        	},
        	components:{
        		'car-reserve-tab':car_reserve_tab
        	}
    	}).mount("#listApp")
    	
    </script>
  </body>
</body>
</html>