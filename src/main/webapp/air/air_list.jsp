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
  <!-- 검색 폼 컴포넌트 -->
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
  <div id="listApp" style="height:80vh; overflow-y:auto;">
    <!-- 검색 탭 -->
    <air-reserve-tab @search="handleSearch"></air-reserve-tab>

    <!-- 결과 테이블: list 배열이 있고, 길이가 있을 때만 렌더 -->
    <section v-if="list && list.length" class="ftco-section" style="margin:0; padding:20px;">
      <div class="container">
        <table class="table table-bordered text-center">
          <thead>
            <tr>
              <th>번호</th>
              <th>항공사</th>
              <th>편명</th>
              <th>출발공항 → 도착공항</th>
              <th>출발시간</th>
              <th>도착시간</th>
              <th>운임(1인기준/₩)</th>
              <th>선택</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="vo in list" :key="vo.flight_id">
              <!-- 1) airline_code 대신 mapper에서 조인한 airline_name prop 사용 -->
              <td>{{ vo.flight_id }}</td>
              <td>{{ vo.airline_code }}</td>

              <td>{{ vo.flight_number }}</td>

              <!-- 2) dep_airport_code/arr_airport_code 대신 dep_airport, arr_airport 사용 -->
              <td>{{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}</td>

              <td>{{ vo.dep_time }}</td>
              <td>{{ vo.arr_time }}</td>

              <td>
			     <span v-if="vo.economy_charge === 0">결항</span>
			     <span v-else>{{ vo.economy_charge.toLocaleString() }}</span>
			   </td>

              <td>
                <button :href="'../air/air_list_arr.do" class="btn btn-sm btn-success" @click="selectFlight(vo.flight_id)">왕복선택</button>
                <button class="btn btn-sm btn-warning" @click="selectFlight(vo.flight_id)">편도예약</button>
              </td>
            </tr>
          </tbody>
        </table>
        <div ref="sentinel" style="height:1px;"></div>
      </div>
    </section>
  </div>


<script>
Vue.createApp({
  data() {
    return {
      list: [],        
      curpage: 1,
      totalpage: 0,
      from: '',
      to: '',
      departureDate: '',
      returnDate: '',
      travellers: null
    };
  },
  methods: {
    handleSearch(filters) {
      this.curpage       = 1;
      this.list          = [];
      this.from          = filters.from;
      this.to            = filters.to;
      this.departureDate = filters.departureDate || '';
      this.returnDate    = filters.returnDate    || '';
      this.travellers    = filters.travellers;
      this.fetchPage();
    },
    fetchPage() {
      axios.get('../air/list_vue.do', {
        params: {
          page: this.curpage,
          from: this.from,
          to: this.to,
          date: this.departureDate,
          travellers: this.travellers
        }
      })
      .then(res => {
        const d = res.data;
        // 첫 페이지면 덮어쓰기, 이후면 이어붙이기
        if (this.curpage === 1) {
          this.list = Array.isArray(d.list) ? d.list : [];
        } else {
          this.list = this.list.concat(d.list || []);
        }
        this.totalpage = d.totalpage || 0;
      })
      .catch(err => {
        console.error('API 호출 중 오류:', err);
      });
    },
    selectFlight(id) {
      alert(`편번 ${id} 선택됨`);
    }
  },
  mounted() {
    // viewport 기준, threshold 1.0
    const io = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting && this.curpage < this.totalpage) {
        this.curpage++;
        this.fetchPage();
      }
    }, {
      root: null,         // 전체 창(viewport)
      rootMargin: '0px',
      threshold: 1.0      // sentinel이 완전히 보일 때만
    });
    // sentinel은 테이블 하단에 <div ref="sentinel"></div>로 배치해두세요
    io.observe(this.$refs.sentinel);
  }
})
.component('air-reserve-tab', window.air_reserve_tab)
.mount('#listApp');
</script>
</body>
</html>
