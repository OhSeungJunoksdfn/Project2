<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
  <section class="ftco-section ftco-degree-bg py-5">
    <div class="container">
      <div class="row secb shadow p-4">
        <div class="col-12 mb-4 bb-3 d-flex justify-content-between align-items-center">
          <h3>항공권 편도예약하기</h3>
          <small>
            <span class="font-weight-bold">1. 검색</span> &gt;
            <span>2. 예약정보</span> &gt;
            <span>3. 결제완료</span>
          </small>
        </div>

        <!-- 검색 탭(Vue 컴포넌트) -->
        <div class="col-12 mb-4">
          <div id="searchApp">
            <air-reserve-tab @search="onSearch"></air-reserve-tab>
          </div>
        </div>

        <!-- 예약 정보 영역(Vue 컴포넌트에서 선택된 편 정보 바인딩) -->
        <div id="detailApp" class="col-12" v-if="selected">
          <h4 class="mb-3">선택 항공편 정보</h4>
          <table class="table table-bordered">
            <tbody>
              <tr>
                <th class="bg-light">항공사</th>
                <td>{{ selected.airline_code }}</td>
                <th class="bg-light">편명</th>
                <td>{{ selected.flight_number }}</td>
              </tr>
              <tr>
                <th class="bg-light">출발</th>
                <td>{{ selected.dep_airport_code }} ({{ selected.dep_time }})</td>
                <th class="bg-light">도착</th>
                <td>{{ selected.arr_airport_code }} ({{ selected.arr_time }})</td>
              </tr>
              <tr>
                <th class="bg-light">운임</th>
                <td colspan="3">
                  <span v-if="selected.economy_charge===0">결항</span>
                  <span v-else>{{ selected.economy_charge.toLocaleString() }}원</span>
                </td>
              </tr>
            </tbody>
          </table>

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
                <td>{{ formattedFare }}원</td>
              </tr>
              <tr>
                <th class="bg-light">할인 금액</th>
                <td>-{{ formattedDiscount }}원</td>
              </tr>
              <tr>
                <th class="bg-light">총 결제금액</th>
                <td class="font-weight-bold">{{ formattedTotal }}원</td>
              </tr>
            </tbody>
          </table>

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
        // 할인/포인트
        coupon: 0,
        points: 0,
        // 고객 정보
        customerName: '',
        customerEmail: '',
        customerPhone: ''
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
