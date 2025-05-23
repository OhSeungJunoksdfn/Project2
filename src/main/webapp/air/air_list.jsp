<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flight Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <style> span:hover, a:hover { cursor: pointer; } </style>
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
  <div id="listApp" style="height:80vh; overflow-y:auto;">
    <!-- 검색 탭 (handleSearch → 편도 모드) -->
    <air-reserve-tab @search="handleSearch"></air-reserve-tab>
	
	    <!-- 2단계 디버그: list 전체 찍어 보기 -->
	<!--  <pre style="background:#f8f8f8; padding:8px; margin:16px 0;">
      {{ JSON.stringify(list, null, 2) }}
    </pre> -->
	
    <!-- 결과 테이블: list가 있을 때만 렌더 -->
    <section class="ftco-section" style="margin:0; padding:20px;">
      <div class="container" v-if="list.length">
        <table class="table table-bordered text-center">
          <thead>
            <tr>
              <th>번호</th>
              <th>항공사</th>
              <th>편명</th>
              <th>출발공항 → 도착공항</th>
              <th>출발시간</th>
              <th>도착시간</th>
              <th>운임(₩)</th>
              <th>선택</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="vo in list" :key="vo.flight_id">
              <td>{{ vo.flight_id }}</td>
              <td>{{ vo.airline_code }}</td>
              <td>{{ vo.flight_number }}</td>
              <!-- 편도/왕복 공통: data/state 에 따라 변경 -->
              <td>{{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}</td>
              <td>{{ vo.dep_time }}</td>
              <td>{{ vo.arr_time }}</td>
              
              <td>
                <span v-if="vo.economy_charge===0">결항</span>
                <span v-else>{{ vo.economy_charge.toLocaleString() }}</span>
              </td>
              <td>
                <!-- 편도 vs 왕복 구분 -->
                  <button v-if="!isInbound"
                        class="btn btn-sm btn-success"
                        @click="goToReturn(vo.flight_id)">
                  왕복선택
                </button>
      			<a
			        class="btn btn-sm btn-warning"
			        v-bind:href="
			          '../air/seat_map.do?flightId=' + vo.flight_id
			          + '&adults=' + adults
			          + '&children=' + children
			        ">
			        편도 좌석선택
			      </a>
			    </td>
            </tr>
          </tbody>
        </table>
      </div>
     <div ref="sentinel" style="height:1px;"></div>
    </section>
  </div>

<script>
Vue.createApp({
  data() {
    return {
      list: [], 
      curpage: 1, 
      totalpage: 0,
      from:'', 
      to:'', 
      departureDate:'', 
      returnDate:'', 
      adults: 1,
      children: 0,
      isInbound: false   // ← 편도(false) vs 왕복(true)
    };
  },
  methods: {
    // 1) 검색(편도 모드)
    handleSearch(filters) {
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

    // 2) 편도 API
    fetchPage() {
      axios.get('../air/list_vue.do', {
        params:{
          page:this.curpage,
          from:this.from,
          to:this.to,
          date:this.departureDate,
          adults:   this.adults,
          children: this.children
        }
      })
      .then(res=>{
        const d = res.data;
        // 첫 페이지면 덮어쓰기, else 이어붙이기
        this.list = this.curpage===1
                    ? (d.list||[])
                    : this.list.concat(d.list||[]);
        this.totalpage = d.totalpage;
      })
      .catch(console.error);
    },

   // 3) 왕복 선택 시 별도 JSP 페이지로 이동
   goToReturn(outboundFlightId) {
     // from/to 뒤집기
     const totalAdults  = this.adults;
  	 const totalChildren = this.children;
	 const params = new URLSearchParams({
	   from:          this.to,
	   to:            this.from,
	   departureDate: this.returnDate,  // 컨트롤러가 기대하는 키
	   returnDate:    this.departureDate,
	   adults:        totalAdults,
	   children:      totalChildren,
	   outboundFlightId: outboundFlightId
	 });
     // 전체 페이지 리다이렉트
     
	  // 2) (디버깅용) 콘솔
	  console.log('redirect params:', params.toString());
	  //    => from=GMP&to=CJU&departureDate=…&returnDate=…&travellers=…

	  // 3) 완성된 쿼리스트링을 한 번에 붙여 리다이렉트
	  window.location.href = '../air/air_list_arr.do?' + params.toString();
   },

    // 4) 왕복 API
    fetchInboundPage() {
      axios.get('../air/air_list_arr_vue.do', {
        params:{
          page:this.curpage,
          from:this.from,
          to:this.to,
          returnDate:this.returnDate,
          adults:        this.adults,
   	      children:      this.children
        }
      })
      .then(res=>{
        const d = res.data;
        this.list = this.curpage===1
                    ? (d.list||[])
                    : this.list.concat(d.list||[]);
        this.totalpage = d.totalpage;
      })
      .catch(console.error);
    	},
    },
  mounted() {
    // 무한 스크롤: 편도/왕복 모드에 따라 분기
    const io = new IntersectionObserver(entries=>{
      if(!entries[0].isIntersecting) return;
      if(this.curpage >= this.totalpage) return;
      this.curpage++;
      if(this.isInbound) this.fetchInboundPage();
      else               this.fetchPage();
    },{ root:null, rootMargin:'200px', threshold:1.0 });
    io.observe(this.$refs.sentinel);
  }
})
.component('air-reserve-tab', window.air_reserve_tab)
.mount('#listApp');
</script>
</body>
</html>
