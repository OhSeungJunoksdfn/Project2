
const air_reserve_tab={
template:
`
	<div style="width:100%;display: flex;justify-content: center;">
		<section class="ftco-section justify-content-end " style="width:80%;">
      <div class="container-wrap mx-auto">
        <div class="row no-gutters">
          <div class="col-md-12 tab-wrap rt-12 shadow" style="border-radius:10px">
            <div class="tab-content p-4 px-5" id="v-pills-tabContent">
             <div
                class="tab-pane fade show active"
                id="v-pills-1"
                role="tabpanel"
                aria-labelledby="v-pills-nextgen-tab"
              >
               <form @submit.prevent="dataRecv" class="search-destination">
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
		            <label>출발시각</label>
		            <input v-model="arrtime" type="date" class="form-control"/>
		          </div>
		          </div>
		          <!-- 도착시각 -->
		          <div class="col-md align-items-end">
		          <div class="form-group">
		            <label>도착시각</label>
		            <input v-model="deptime" type="date" class="form-control"/>
		          </div>
		          </div>
		          <!-- 여행자 수 -->
		          <div class="col-md align-items-end">
		          <div class="form-group">
		            <label>Travelers</label>
		            <select v-model.number="travellers" class="form-control">
		              <option disabled value="">인원 수</option>
		              <option v-for="n in 5" :key="n" :value="n">{{ n }}</option>
		            </select>
		          </div>
		          </div>
		          <!-- 검색 버튼 -->
		          <div class="col-md align-self-end">
                      <div class="form-group">
                        <div class="form-field">
		                  <button type="submit" class="btn btn-primary form-control">Search</button>
		          		</div>
			           </div>
				      </div>
				     </div>
				    </form>
				   </div>
				  </div>
				 </div>
				</div>
			   </div>
			  </section>
		     </div>	
`
}