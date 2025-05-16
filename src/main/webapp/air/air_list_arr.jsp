<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flight Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <style>
    span:hover, a:hover { cursor: pointer; }
    /* optional: 스크롤바 살짝 얇게 */
    #listApp { scrollbar-width: thin; }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <!-- 검색 폼 컴포넌트 -->
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
  <div id="listApp"
       style="height:80vh; overflow-y:auto; border:1px solid #eee; padding:1rem;">
    <!-- 검색 폼 -->
    <air-reserve-tab @search="handleSearch"></air-reserve-tab>

    <!-- 결과 테이블 -->
    <section v-if="list.length" class="ftco-section" style="margin-top:1rem;">
      <div class="container">
        <table class="table table-bordered text-center">
          <thead>
            <tr>
              <th>번호</th>
              <th>항공사</th>
              <th>편명</th>
              <th>도착공항 → 출발공항</th>
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
              <td>{{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}</td>
              <td>{{ vo.dep_time }}</td>
              <td>{{ vo.arr_time }}</td>
              <td>{{ vo.economy_charge.toLocaleString() }}</td>
              <td>
                <button class="btn btn-sm btn-primary"
                        @click="selectFlight(vo.flight_id)">
                  선택
                </button>
              </td>
            </tr>
          </tbody>
        </table>
        <!-- 이 요소가 보이면 다음 페이지 로드 -->
        <div ref="sentinel" style="height:1px;"></div>
      </div>
    </section>

    <!-- 로딩 및 끝났을 때 메시지 -->
    <div v-if="loading" class="text-center mt-2">불러오는 중...</div>
    <div v-if="finished && !list.length" class="text-center mt-2">검색 결과가 없습니다.</div>
    <div v-else-if="finished" class="text-center mt-2">모든 데이터를 불러왔습니다.</div>
  </div>

  <script>
    Vue.createApp({
      data() {
        return {
          list: [],           // 항공편 리스트
          curpage: 1,         // 현재 페이지
          rowSize: 12,        // 한 번에 로드할 개수
          totalpage: 0,       // 서버에서 넘어온 전체 페이지 수
          loading: false,     // 로딩 중 플래그
          finished: false,    // 더 이상 로드할 페이지가 없을 때 true

          // 검색 필터
          from: '',
          to: '',
          departureDate: '',
          returnDate: '',
          travellers: null
        };
      },
      methods: {
        // 검색 폼에서 emit('search') 호출되면
        handleSearch(filters) {
          // 상태 초기화
          this.list = [];
          this.curpage = 1;
          this.finished = false;
          this.from = filters.from;
          this.to = filters.to;
          this.departureDate = filters.departureDate;
          this.returnDate = filters.returnDate;
          this.travellers = filters.travellers;
          // 첫 페이지 불러오기
          this.dataRecv();
        },
        // 실제 데이터 요청
        async dataRecv() {
          if (this.loading || this.finished) return;
          this.loading = true;
          try {
            const res = await axios.get('../air/list_vue.do', {
              params: {
                page: this.curpage,
                rowSize: this.rowSize,
                from: this.from,
                to: this.to,
                arrtime: this.departureDate,
                deptime: this.returnDate,
                travellers: this.travellers
              }
            });
            const d = res.data;
            const newList = Array.isArray(d.list) ? d.list : [];

            // 기존 리스트에 이어붙이기
            this.list.push(...newList);

            // 전체 페이지 수 갱신
            this.totalpage = d.totalpage;

            // 다음 페이지 준비 혹은 종료
            if (this.curpage >= d.totalpage) {
              this.finished = true;
            } else {
              this.curpage++;
            }
          } catch (err) {
            console.error('API 호출 중 오류:', err);
          } finally {
            this.loading = false;
          }
        },
        selectFlight(id) {
          alert(`편번 ${id} 선택됨`);
        }
      },
      mounted() {
        // infinite scroll: sentinel 요소가 보이면 dataRecv() 호출
        const io = new IntersectionObserver(entries => {
          if (entries[0].isIntersecting) {
            this.dataRecv();
          }
        }, {
          root: this.$el,
          rootMargin: '200px'
        });
        io.observe(this.$refs.sentinel);
      },
      components: {
        'air-reserve-tab': window.air_reserve_tab
      }
    }).mount('#listApp');
  </script>
</body>
</html>