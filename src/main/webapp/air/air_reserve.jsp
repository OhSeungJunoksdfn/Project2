<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>항공권 예약하기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
  />
  <style>
    .secb { background: #fff; border-radius: 8px; }
    .bb-3 { border-bottom: 3px solid #e9e9e9; }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="./air_reserve_tab.js"></script> <!-- 검색 폼 컴포넌트 -->
    <!-- 1. Vue는 HEAD나 BODY 상단에서 한 번만 로드 -->
  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <section class="ftco-section ftco-degree-bg py-5">
    <div class="container">
      <div class="row secb shadow p-4">
        <div class="col-12 mb-4 bb-3 d-flex justify-content-between align-items-center">
          <h3>항공권 예약하기</h3>
        </div>

        <!-- 예약 정보 영역(Vue 컴포넌트에서 선택된 편 정보 바인딩) -->
       <!-- 2. detailApp: 서버에서 주입된 flight 정보를 보여줄 영역 -->
  <div id="detailApp" class="container mb-4">
    <h4>선택 항공편 정보</h4>
    <table class="table table-bordered">
      <tr>
        <th>항공사</th><td>{{ selected.airline_code }}</td>
        <th>편명</th><td>{{ selected.flight_number }}</td>
      </tr>
      <tr>
        <th>출발</th><td>{{ selected.dep_airport_code }} ({{ selected.dep_time }})</td>
        <th>도착</th><td>{{ selected.arr_airport_code }} ({{ selected.arr_time }})</td>
      </tr>
      <tr>
        <th>운임</th><td>{{ selected.economy_charge.toLocaleString() }}원</td>
      </tr>
    </table>
  </div>

  <!-- 3. 서버에서 주입된 flight VO를 JS 객체로 초기화 -->
  <script>
    const initialSelected = {
      airline_code:     '${flight.airline_code}',
      flight_number:    '${flight.flight_number}',
      dep_airport_code: '${flight.dep_airport_code}',
      dep_time:         '${flight.dep_time}',
      arr_airport_code: '${flight.arr_airport_code}',
      arr_time:         '${flight.arr_time}',
      economy_charge:   ${flight.economy_charge}
    };
       // 3-1. adult/child 카운트도 주입
       const adultCount   = ${adults};
  </script>

  <!-- 4. detailApp 전용 Vue 인스턴스 마운트 -->
  <script>
     Vue.createApp({
	       data() {
	         return {
	           selected: initialSelected,
	           adults:   adultCount,
	         };
	       },
	       computed: {
	    	      // 성인 수에 따른 총 운임 (소아 제외)
	    	      totalFare() {
	    	        return this.selected.economy_charge * this.adults;
	    	      },
	    	      formattedTotalFare() {
	    	        return this.totalFare.toLocaleString();
	    	      }
	    	    }
	     }).mount('#detailApp');
  </script>

  <!-- 5. registerApp: 기존에 쓰시던 승객 정보 입력 폼 -->
  <section id="registerApp" class="d-flex justify-content-center align-items-center">
    <!-- … 여기 안에 <form ref="myform"> … </form> 포함 … -->
  </section>

          <!-- 할인/포인트 (예시) -->
          <h4 class="mt-4">할인/포인트</h4>
          <table class="table table-bordered">
            <tbody>
              <tr>
                <th class="bg-light">쿠폰 할인</th>
                <td>
                  <input type="text" class="form-control d-inline-block w-auto" v-model="coupon" />
                  <button class="btn btn-primary ml-2">적용</button>
                </td>
              </tr>
              <tr>
                <th class="bg-light">포인트 사용</th>
                <td>
                  <input type="text" class="form-control d-inline-block w-auto" v-model="points" />
                  <button class="btn btn-primary ml-2">모두 사용</button>
                </td>
              </tr>
            </tbody>
          </table>

          <!-- 결제 정보 -->
          <h4 class="mt-4">결제 정보</h4>
          <table class="table table-bordered">
            <tbody>
              <tr>
                <th class="bg-light">기본 운임</th>
                <td>{{ formattedTotalFare }}원</td>
              </tr>
              <tr>
		       <th class="bg-light">총 결제금액</th>
		       <td class="font-weight-bold">{{ formattedTotalFare }}원</td>
		     </tr>
            </tbody>
          </table>
			
            <div class="col-12 mb-3">
            <div style="font-size:16px;">
              선택 좌석:
              <strong>${param.adultSeats}</strong> (성인),
              <strong>${param.childSeats}</strong> (소아)
            </div>
          </div>
          <!-- 예약자 정보 폼 -->
          <h4 class="mt-4">예약자 정보</h4>
          <form @submit.prevent="onReserve">
            <div class="form-row">
              <div class="form-group col-md-4">
                <label>예약자명</label>
                <input type="text" class="form-control" v-model="customerName" required/>
              </div>
              <div class="form-group col-md-4">
                <label>이메일</label>
                <input type="email" class="form-control" v-model="customerEmail" required/>
              </div>
              <div class="form-group col-md-4">
                <label>휴대폰 번호</label>
                <input type="text" class="form-control" v-model="customerPhone" required/>
              </div>
            </div>
            
             <div class="form-row">
              <div class="form-group col-md-4">
                <label>생일</label>
                <input type="date" class="form-control" v-model="customerBirthday" required/>
              </div>
            </div>
            
            <div class="text-center mt-4">
              <button type="submit" class="btn btn-lg btn-primary mx-2">결제하기</button>
              <button type="button" class="btn btn-lg btn-secondary mx-2" @click="reset()">취소</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </section>

  <script>
  Vue.createApp({
    data() {
      return {
        // 검색 파라미터 전달용
        searchParams: null,
        // 선택된 편 정보
        selected: null,
        // 고객 정보
        customerName: '',
        customerEmail: '',
        customerPhone: '',
        customerBirthday: '',
        // 할인/포인트
        coupon: 0,
        points: 0
      };
    },
    computed: {
      formattedFare() {
        return this.selected?.economy_charge?.toLocaleString() || '0';
      },
      formattedDiscount() {
        const c = Number(this.coupon) || 0;
        const p = Number(this.points) || 0;
        return (c + p).toLocaleString();
      },
      formattedTotal() {
        return (this.selected.economy_charge - (Number(this.coupon)||0) - (Number(this.points)||0))
          .toLocaleString();
      }
    },
    methods: {
      // 검색 컴포넌트가 emit('search', filters)를 호출하면
      onSearch(filters) {
        this.searchParams = filters;
        // Vue router나 Axios로 목록 요청 → 여기서는 간단히 다음 화면으로
        // 예시: 목록 컴포넌트를 띄우고 '선택' 버튼에서 this.selectFlight(id) 호출
        window.location.href = '../air/air_reserve_ok.jsp';
      },
      // 사용자가 테이블에서 “선택” 누르면
      selectFlight(flight) {
        this.selected = flight;
      },
      // 결제하기
      onReserve() {
        const payload = {
          ...this.selected,
          customerName: this.customerName,
          customerEmail: this.customerEmail,
          customerPhone: this.customerPhone,
          customerBirthday: this.customerBirthday,
          coupon: Number(this.coupon),
          points: Number(this.points),
        };
        axios.post('../air/reserve.do', payload)
          .then(() => alert('예약이 완료되었습니다.'))
          .catch(err => console.error(err));
      },
      reset() {
        this.selected = null;
        this.customerName = '';
        this.customerEmail = '';
        this.customerPhone = '';
        this.coupon = 0;
        this.points = 0;
      }
    }
  })
  .component('air-reserve-tab', window.air_reserve_tab)
  .mount('#searchApp');

  // 별도로 상세 영역을 같은 Vue 인스턴스로 제어하려면
  Vue.createApp({ /* detailApp 위의 코드 재사용 가능 */ })
     .mount('#list.App');
  </script>
</body>
</html>
