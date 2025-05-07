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
</head>
<body>
  <div id="listApp">
    <!-- 검색 폼 -->
    <section style="width:80%; margin:20px auto;">
      <form @submit.prevent="dataRecv" class="search-destination">
        <div class="row">
          <!-- 출발 공항 -->
          <div class="col-md">
            <label>출발</label>
            <select v-model="from" class="form-control">
              <option disabled value="">출발 공항 선택</option>
              <option value="GMP">김포 (GMP)</option>
              <option value="CJU">제주 (CJU)</option>
            </select>
          </div>
          <!-- 도착 공항 -->
          <div class="col-md">
            <label>도착</label>
            <select v-model="to" class="form-control">
              <option disabled value="">도착 공항 선택</option>
			  <option value="GMP">김포 (GMP)</option>
              <option value="CJU">제주 (CJU)</option>
            </select>
          </div>
          <!-- 출발시각 -->
          <div class="col-md">
            <label>출발시각</label>
            <input v-model="arrtime" type="date" class="form-control"/>
          </div>
          <!-- 도착시각 -->
          <div class="col-md">
            <label>도착시각</label>
            <input v-model="deptime" type="date" class="form-control"/>
          </div>
          <!-- 여행자 수 -->
          <div class="col-md">
            <label>Travelers</label>
            <select v-model.number="travellers" class="form-control">
              <option disabled value="">인원 수</option>
              <option v-for="n in 5" :key="n" :value="n">{{ n }}</option>
            </select>
          </div>
          <!-- 검색 버튼 -->
          <div class="col-md">
            <button type="submit" class="btn btn-primary form-control">Search</button>
          </div>
        </div>
      </form>
    </section>


	<!-- 결과 리스트: 데이터가 있을 때만 표시 -->
	<section v-if="list.length" class="ftco-section results text-center" style="margin:0; padding:20px;">
  <div class="container d-flex flex-column align-items-center">
    <ul class="result-list list-unstyled w-75">
      <li class="flight-item d-flex justify-content-between align-items-center mb-3" v-for="vo in list" :key="vo.flight_id">
        <div class="flight-info d-flex align-items-center">
          <span class="dep-time fw-bold">{{ vo.dep_time }}</span>
          <span class="duration mx-3 text-muted">{{ calculateDuration(vo.dep_time, vo.arr_time) }}</span>
          <span class="arr-time fw-bold">{{ vo.arr_time }}</span>
          <span class="airports mx-3 text-secondary">{{ vo.dep_airport_code }} → {{ vo.arr_airport_code }}</span>
        </div>
        <div class="price-select d-flex align-items-center">
          <span class="price fw-bold">{{ vo.economy_charge.toLocaleString() }}원</span>
          <button class="btn btn-primary ms-3 select-btn">선택</button>
        </div>
      </li>
    </ul>
  </div>
</section>

<!-- 페이징 -->
<div v-if="totalpage > 0" class="row mt-5 mb-5">
  <div class="col text-center">
    <div class="block-27">
      <ul>
        <li v-if="startPage > 1"><span @click="prev()">&lt;</span></li>
        <li
          v-for="i in range(startPage, endPage)"
          :key="i"
          :class="i === curpage ? 'page-item active' : 'page-item'"
        >
          <span @click="pageChange(i)">{{ i }}</span>
        </li>
        <li v-if="endPage < totalpage"><span @click="next()">&gt;</span></li>
      </ul>
    </div>
  </div>
</div>

  <!-- Vue 스크립트 -->
<script>
  Vue.createApp({
    data() {
      return {
        list: [],
        curpage: null,
        totalpage: 0,
        startPage: 0,
        endPage: 0,
        from: '',
        to: '',
        arrtime: '',
        deptime: '',
        travellers: null
      };
    },
    methods: {
      calculateDuration(dep, arr) {
        const d = new Date(dep);
        const a = new Date(arr);
        let diff = (a - d) / 1000 / 60; // 분 단위
        const hours = Math.floor(diff / 60);
        const mins  = Math.floor(diff % 60);

      },
      dataRecv() {
        if (!this.curpage) this.curpage = 1;
        axios.get('../air/list_vue.do', {
          params: {
            page: this.curpage,
            from: this.from,
            to: this.to,
            arrtime: this.arrtime,
            deptime: this.deptime,
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
      prev() {
        this.curpage = this.startPage - 1;
        this.dataRecv();
      },
      next() {
        this.curpage = this.endPage + 1;
        this.dataRecv();
      },
      pageChange(page) {
        this.curpage = page;
        this.dataRecv();
      },
      range(start, end) {
        const arr = [];
        for (let i = start; i <= end; i++) {
          arr.push(i);
        }
        return arr;
      }
    }
  }).mount('#listApp');
</script>	
</body>
</html>
