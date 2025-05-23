<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="outboundId" value="${param.outboundFlightId}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Round-Trip Return Flights</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <style> span:hover, a:hover { cursor: pointer; } </style>
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
  <div id="listApp" style="height:80vh; overflow-y:auto;">
    <!-- 검색 탭 (handleSearch → 편도/왕복 공용) -->
    <air-reserve-tab @search="handleSearch"
                     :initial-from="'${from}'"
                     :initial-to="'${to}'"
                     :initial-arrtime="'${returnDate}'"
                     :initial-deptime="'${departureDate}'"
                     :initial-adults  ="${adults}"
					 :initial-children="${children}"
    ></air-reserve-tab>

    <!-- 결과 테이블: list가 있을 때만 렌더 -->
    <section class="ftco-section" style="margin:0; padding:20px;">
      <div class="container" v-if="list.length" >
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
              <td>
				  <span v-if="!isInbound">
				    {{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}
				  </span>
				  <span v-else>
				    {{ vo.arr_airport_code }} → {{ vo.dep_airport_code }}
				  </span>
			  </td>
              <td>{{ vo.arr_time }}</td>
              <td>{{ vo.dep_time }}</td>
              <td>
                <span v-if="vo.economy_charge===0">결항</span>
                <span v-else>{{ vo.economy_charge.toLocaleString() }}</span>
              </td>
              <td>
                <!-- 왕복 모드이므로 isInbound=true, 왕복선택 버튼 숨김 -->
			 <a class="btn btn-sm btn-warning"
			        v-bind:href="
			          '../air/seat_map.do?flightId=' + vo.flight_id
			          + '&adults=' + adults
			          + '&children=' + children
			        ">
			   왕복 좌석선택
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
      from: '${from}', 
      to: '${to}',
      departureDate: '${returnDate}', 
      returnDate: '${departureDate}',
      adults:   Number('${adults}'),
      children: Number('${children}'),
      outboundFlightId: Number('${outboundId}'),
      inboundFlightId:  null,   
      isInbound: true   // 왕복(오는 편) 모드
    };
  },
  methods: {
    // 검색 시 편도/왕복 모두 지원 (여기서는 다시 왕복으로 처리)
    handleSearch(filters) {
      this.isInbound      = !!filters.returnDate;
      this.curpage        = 1;
      this.list           = [];
      this.from           = filters.from;
      this.to             = filters.to;
      this.departureDate  = filters.departureDate;
      this.returnDate     = filters.returnDate;
      this.adults         = filters.adults;
      this.children		  = filters.children;
      if (this.isInbound) this.fetchInboundPage();
      else               this.fetchPage();
    },

    // 편도 API (필요 시 사용)
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
        this.list = this.curpage===1
                    ? (d.list||[])
                    : this.list.concat(d.list||[]);
        this.totalpage = d.totalpage;
      })
      .catch(console.error);
    },

    // 왕복(오는 편) API
    fetchInboundPage() {
      axios.get('../air/air_list_arr_vue.do', {
        params:{
          page:this.curpage,
          from:this.from,
          to:this.to,
          returnDate:this.returnDate,
          adults:     this.adults,
          children:   this.children
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

    goToPassengerForm(id) {
    	const params = new URLSearchParams({
    	      outboundFlightId: this.outboundFlightId,
    	      inboundFlightId:  this.inboundFlightId
    	    });
      window.location.href = `../air/passenger_info.do?flightId=${id}`;
    }
  },
  mounted() {
    // 첫 로드 시 바로 오는 편 페이지를 가져옴
    this.fetchInboundPage();

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