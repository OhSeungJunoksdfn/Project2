window.air_reserve_tab={
template:
`
	<div style="width:100%;display:flex;justify-content:center;">
      <section class="ftco-section" style="width:80%;">
        <div class="container-wrap mx-auto">
          <div class="row no-gutters">
            <div class="col-md-12 shadow" style="border-radius:10px">
              <form @submit.prevent="onSubmit" class="search-destination p-4">
                <div class="row">
	              <!-- 출발 공항 -->
	              <div class="col-md-2 align-items-end">
	               <div class="form-group">
	                 <label>출발</label>
	                  <select v-model="from" class="form-control">
	                  <option disabled value="">출발 공항 선택</option>
	                  <option value="GMP">김포 (GMP)</option>
	                  <option value="CJU">제주 (CJU)</option>
	                </select>
		          </div>
		         </div> 
		          <!-- 도착 공항 -->
		          <div class="col-md align-items-end">
                    <div class="form-group">
		            <label>도착</label>
		            <select v-model="to" class="form-control">
		              <option disabled value="">도착 공항 선택</option>
					  <option value="GMP">김포 (GMP)</option>
		              <option value="CJU">제주 (CJU)</option>
		            </select>
		          </div>
		          </div>
		          <!-- 출발시각 -->
		          <div class="col-md align-items-end">
		          <div class="form-group">
		            <label>가는날</label>
		            <input v-model="arrtime" type="date" class="form-control"/>
		          </div>
		          </div>
		          <!-- 도착시각 -->
		          <div class="col-md align-items-end">
		          <div class="form-group">
		            <label>오는날</label>
		            <input v-model="deptime" type="date" class="form-control"/>
		          </div>
		          </div>

		          <!-- 여행자 수 -->
		           <div class="col-md align-items-end">
                    <div class="form-group">
                      <label>여행자</label>
                      <div style="display:flex; gap:2rem; align-items:center;">
                        <!-- 성인 카운터 -->
                        <div style="text-align:center">
                          <div>성인<br/><small>18세 이상</small></div>
                          <span style="margin:0 0.5rem">{{ adults }}</span>
                           <div class="btn-group btn-group-sm">
					      <button type="button"
					              @click="decrement('adults')"
					              :disabled="adults===0"
					              class="btn btn-light">−</button>
					      <button type="button"
					              @click="increment('adults')"
					              :disabled="adults === 8"
					              class="btn btn-light">+</button>
					    </div>
                        </div>
                        <!-- 유·소아 카운터 -->
                        <div style="text-align:center">
                          <div>유·소아<br/><small>0~17세</small></div>
                          <span style="margin:0 0.5rem">{{ children }}</span>
                           <div class="btn-group btn-group-sm">
					      <button type="button"
					              @click="decrement('children')"
					              :disabled="children===0"
					              class="btn btn-light">−</button>
					      <button type="button"
					              @click="increment('children')"
					              :disabled="children === 8"
					              class="btn btn-light">+</button>
					    </div>
                        </div>
                      </div>
                    </div>
                  </div>
		          <!-- 검색 버튼 -->
		          <div class="col-md align-self-end">
                      <div class="form-group">
                        <div class="form-field">
		                  <button 
		                  	type="submit" 
		                  	class="btn btn-primary form-control" 
		                  	:disabled="!from || !to || !arrtime">Search</button>
		          		</div>
			           </div>
				      </div>
				       </div>
		              </form>
		            </div>
		          </div>
		        </div>
		      </section>
		     </div>	
`,
  emits:['search'],
  data() {
    return {
      from: '',
      to: '',
      arrtime: '',
      deptime: '',
      adults: 1,
      children: 0,
      errorMsg: ''
    };
  },
  methods: {
   increment(type) {
      if (type === 'adults') this.adults++;
      else if (type === 'children') this.children++;
    },
    decrement(type) {
      if (type === 'adults' && this.adults > 0) this.adults--;
      else if (type === 'children' && this.children > 0) this.children--;
    },
    onSubmit() {
    	let msg = "";

    // 필수 입력 체크
    if (!this.from || !this.to || !this.arrtime) {
      msg = "출발지·도착지·가는날은 반드시 입력해야 합니다.";
    }
    // 돌아오는 날이 있으면, 같을 수 없음
    else if (this.deptime && this.arrtime === this.deptime) {
      msg = "출발일과 도착일은 같을 수 없습니다.";
    }
    // 모두 OK면 나이 경고문
    else {
      msg =
        "여행 시 탑승객의 나이는 예약 시 나이 카테고리(성인 또는 유/소아)와 일치해야 합니다. " +
        "항공사에는 만 18세 미만 승객의 단독 탑승에 대한 제한 규정이 있습니다.\n\n" +
        "유/소아 동반 여행 시 나이 제한과 정책은 항공사별로 다를 수 있으니 예약하기 전에 해당 항공사와 확인하시기 바랍니다.";
    }

    // 2) 한 번만 alert 띄우기
    alert(msg);

    // 3) 필수 입력 또는 날짜 에러면 더 진행하지 않고 리턴
    if (msg !== "" &&
        (msg.includes("반드시 입력") || msg.includes("같을 수 없습니다."))) {
      return;
    }
	  this.$emit('search', {
	    from:this.from,
	    to:this.to,
	    departureDate:this.arrtime,
	    returnDate:this.deptime || null,
	    ttravellers: this.adults + this.children
	  });
    }
  }
};