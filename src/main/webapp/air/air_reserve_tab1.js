window.air_reserve_tab1={
props: {
    initialFrom:        { type: String, default: '' },
    initialTo:          { type: String, default: '' },
    initialArrtime:     { type: String, default: '' },
    initialDeptime:     { type: String, default: '' },
    initialAdults:    	{ type: Number, default: 1 },
    initialChildren:  	{ type: Number, default: 0 }, 
  },
template:
`
              <form @submit.prevent="onSubmit" class="search-destination" style="padding=10px;">
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
                          <div>성인</div>
                          
                           <div class="btn-group btn-group-sm">
					      <button type="button"
					              @click="decrement('adults')"
					              :disabled="adults===0"
					              class="btn btn-light">−</button>
					              <span style="margin:0 0.5rem">{{ adults }}</span>
					      <button type="button"
					              @click="increment('adults')"
					              :disabled="adults === 8"
					              class="btn btn-light">+</button>
					    </div>
                        </div>
                        <!-- 유·소아 카운터 -->
                        <div style="text-align:center">
                          <div>유·소아</div>
                          
                           <div class="btn-group btn-group-sm">
					      <button type="button"
					              @click="decrement('children')"
					              :disabled="children===0"
					              class="btn btn-light">−</button>
					              <span style="margin:0 0.5rem">{{ children }}</span>
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
`,
  emits:['search'],
  data() {
        return {
      // 부모로부터 받은 초기값을 v-model 에 바인딩
      from:      this.initialFrom,
      to:        this.initialTo,
     arrtime:   this.initialArrtime,
      deptime:   this.initialDeptime,
     adults:   this.initialAdults,
     children: this.initialChildren,
     errorMsg:  ''
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
 fetchPage() {
      const params = new URLSearchParams({
       from: this.from,
        to: this.to,
        departureDate: this.arrtime,
        returnDate: this.deptime || '',
        adults: String(this.adults),
        children: String(this.children)
      });
      return params.toString();
    },

    // ✅ 변경: onSubmit 에서 쿼리스트링 생성 후 바로 페이지 이동
    onSubmit() {
      let msg = '';

      if (!this.from || !this.to || !this.arrtime) {
        msg = '출발지·도착지·가는날은 반드시 입력해야 합니다.';
      } else if (this.deptime && this.arrtime === this.deptime) {
        msg = '출발일과 도착일은 같을 수 없습니다.';
      }

      if (msg) {
        alert(msg);
        return;
      }

      const query = this.fetchPage();
      window.location.href = 'http://localhost:8080/air/air_list.do?' + query;
    }
  }
};