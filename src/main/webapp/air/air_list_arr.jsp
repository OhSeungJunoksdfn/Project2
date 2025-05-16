<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Return Flights</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!-- Bootstrap (선택) -->
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    crossorigin="anonymous"
  />

  <style>
    #arrReturnApp { padding:20px; }
    span:hover, a:hover { cursor: pointer; }
  </style>

  <!-- Vue / Axios -->
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <!-- 검색 폼용 커스텀 컴포넌트 -->
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
  <div id="arrReturnApp">
    <!-- 1) 검색 폼: 이전에 선택했던 값으로 초기화 -->
    <air-reserve-tab
      :init-from="'${from}'"
      :init-to="'${to}'"
      :init-departure-date="'${departureDate}'"
      :init-return-date="'${returnDate}'"
      :init-travellers="${travellers}"
      @search="handleSearch"
    ></air-reserve-tab>

    <!-- 2) 결과 테이블: list가 있을 때만 렌더 -->
    <section v-if="list.length" class="mt-4">
      <table class="table table-bordered text-center">
        <thead class="thead-light">
          <tr>
            <th>번호</th>
            <th>항공사</th>
            <th>편명</th>
            <th>출발 → 도착</th>
            <th>출발시간</th>
            <th>도착시간</th>
            <th>운임(₩)</th>
            <th>선택</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="vo in list" :key="vo.flight_id">
            <td>{{ vo.flight_id }}</td>
            <td>{{ vo.airline_name }}</td>
            <td>{{ vo.flight_number }}</td>
            <td>{{ vo.dep_airport }} → {{ vo.arr_airport }}</td>
            <td>{{ vo.dep_time }}</td>
            <td>{{ vo.arr_time }}</td>
            <td>{{ vo.economy_charge.toLocaleString() }}</td>
            <td>
              <!-- 편도 예약 or 좌석 선택 -->
              <button
                class="btn btn-sm btn-warning"
                @click="goToPassengerForm(vo.flight_id)"
              >
                편도예약
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <!-- 무한 스크롤 sentinel -->
      <div ref="sentinel" style="height:1px;"></div>
    </section>

    <!-- 로딩·끝났을 때 메시지 -->
    <div v-if="loading" class="text-center">불러오는 중…</div>
    <div v-else-if="finished && !list.length" class="text-center">검색 결과가 없습니다.</div>
    <div v-else-if="finished" class="text-center">모든 데이터를 불러왔습니다.</div>
  </div>

  <script>
  Vue.createApp({
    data() {
      return {
        // 검색 결과
        list: [],
        curpage: 1,
        totalpage: 0,
        loading: false,
        finished: false,

        // 폼 초기값
        from: '',
        to: '',
        departureDate: '',
        returnDate: '',
        travellers: 1
      };
    },
    methods: {
      // 검색 폼에서 “검색” 눌렀을 때
      handleSearch(filters) {
        this.from          = filters.from;
        this.to            = filters.to;
        this.departureDate = filters.departureDate;
        this.returnDate    = filters.returnDate;
        this.travellers    = filters.travellers;
        this.list          = [];
        this.curpage       = 1;
        this.finished      = false;
        this.loadMore();
      },
      // REST 호출
      async loadMore() {
        if (this.loading || this.finished) return;
        this.loading = true;
        try {
          const res = await axios.get('../air/air.list_arr_vue.do', {
            params: {
              page:       this.curpage,
              from:       this.from,
              to:         this.to,
              returnDate: this.returnDate,
              travellers: this.travellers
            }
          });
          const d = res.data;
          const newItems = Array.isArray(d.list) ? d.list : [];
          this.list.push(...newItems);
          this.totalpage = d.totalpage;
          if (this.curpage >= d.totalpage) {
            this.finished = true;
          } else {
            this.curpage++;
          }
        } catch (err) {
          console.error(err);
        } finally {
          this.loading = false;
        }
      },
      goToPassengerForm(id) {
        window.location.href = `/air/passenger_info.do?flightId=${id}`;
      }
    },
    mounted() {
      // 무한 스크롤: sentinel이 보이면 loadMore()
      const io = new IntersectionObserver(entries => {
        if (entries[0].isIntersecting) {
          this.loadMore();
        }
      }, { root: this.$el, rootMargin: '200px' });
      io.observe(this.$refs.sentinel);
      // 최초 진입 시 바로 로드
      this.loadMore();
    },
    components: {
      'air-reserve-tab': window.air_reserve_tab
    }
  }).mount('#arrReturnApp');
  </script>
</body>
</html>
