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
  <div id="listApp">
    <!-- 검색 탭 -->
    <air-reserve-tab @search="handleSearch"></air-reserve-tab>

    <!-- 결과 테이블: list 배열이 있고, 길이가 있을 때만 렌더 -->
    <section v-if="list && list.length"
             class="ftco-section"
             style="margin:0; padding:20px;">
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
              <th>운임(₩)</th>
              <th>선택</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="vo in list" :key="vo.flight_id">
              <!-- 1) airline_code 대신 mapper에서 조인한 airline_name prop 사용 -->
              <td>{{ vo.flight_id }}</td>
              <td>{{ vo.airline_name }}</td>

              <td>{{ vo.flight_number }}</td>

              <!-- 2) dep_airport_code/arr_airport_code 대신 dep_airport, arr_airport 사용 -->
              <td>{{ vo.dep_airport }} → {{ vo.arr_airport }}</td>

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
      </div>
    </section>
  </div>

  <script src="./air_reserve_tab.js">
  import { AirReserveTab } from './air_reserve_tab.js';
  Vue.createApp({
      data() {
        return {
          list: [],        
          curpage: 1,
          totalpage: 0,
          startPage: 1,
          endPage: 1,
          from: '',
          to: '',
          arrtime: '',
          deptime: '',
          travellers: null
        };
      },
      methods: {
        handleSearch(filters) {
          this.curpage     = 1;
          this.from        = filters.from;
          this.to          = filters.to;
          this.arrtime     = filters.arrtime;
          this.deptime     = filters.deptime;
          this.travellers  = filters.travellers;
          this.dataRecv();
        },
        dataRecv() {
          axios.get('../air/list_vue.do', {
            params: {
              page: this.curpage,
              from: this.from,
              to: this.to,
              arrtime: this.arrtime,
              deptime: this.deptime,
              travellers: this.travellers
            }
          })
          .then(res => {
            const d = res.data;
            this.list      = Array.isArray(d.list) ? d.list : [];
            this.curpage   = d.curpage   || 1;
            this.totalpage = d.totalpage || 0;
            this.startPage = d.startPage || 1;
            this.endPage   = d.endPage   || 1;
          })
          .catch(err => {
            console.error('API 호출 중 오류:', err);
            this.list = [];
          });
        },
        selectFlight(id) {
          alert(`편번 ${id} 선택됨`);
        },
        prev()    { if(this.startPage>1)      { this.curpage=this.startPage-1; this.dataRecv(); } },
        next()    { if(this.endPage< this.totalpage) { this.curpage=this.endPage+1;   this.dataRecv(); } },
        pageChange(p) { this.curpage = p; this.dataRecv(); }
      },
      components: {
        'air-reserve-tab': air_reserve_tab
      }
    }).mount('#listApp');
  </script>
</body>
</html>
