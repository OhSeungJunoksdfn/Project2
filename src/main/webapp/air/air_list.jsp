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
  </style>
  <!-- Vue.js & Axios -->
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="./air_reserve_tab.js"></script>
</head>
<body>
    <!-- 검색 폼 -->
    <div id="listApp">
    
    <air-reserve-tab></air-reserve-tab>	
   
	<section v-if="list.length" class="ftco-section" style="margin:0; padding:20px;">
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
            <!-- flightListData() 에서 내려주는 list 를 반복 -->
            <tr v-for="vo in list" :key="vo.flight_id">
              <td>{{ vo.flight_id }}</td>
              <td>{{ vo.airline_code }}</td>
              <td>{{ vo.flight_number }}</td>
              <td>{{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}</td>
              <!-- 이미 Mapper 에서 'YY/MM/DD HH24:MI' 포맷으로 문자열로 내려오기 때문에 slice 없이 그대로 -->
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

  <script>
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
      mounted() {
        // 처음 로딩 시에는 리스트를 빈 상태로 두고, 검색 버튼을 눌러야 불러오도록 하려면
        // 여기서는 호출하지 않습니다.
        // this.dataRecv();
      },
      methods: {
        dataRecv() {
          axios.get('../air/list_vue.do', {
            params: {
              page: this.curpage,
              from: this.from,
              to: this.to,
              checkin: this.arrtime,
              checkout: this.deptime,
              travellers: this.travellers
            }
          }).then(res => {
            const d = res.data;
            this.list      = d.list;
            this.curpage   = d.curpage;
            this.totalpage = d.totalpage;
            this.startPage = d.startPage;
            this.endPage   = d.endPage;
          });
        },
        selectFlight(id) {
          // 선택 버튼 클릭 시 처리할 로직
          alert(`편번 ${id} 선택됨`);
        },
        prev() { /* … */ },
        next() { /* … */ },
        pageChange(p) { /* … */ }
      },
      components:{
  		'air-reserve-tab':air_reserve_tab
  	}
    }).mount('#listApp');
  </script>
</body>
</html>
	



