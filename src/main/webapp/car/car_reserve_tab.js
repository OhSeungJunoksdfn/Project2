

const car_reserve_tab = {
template:
`
	<div style="display: flex;justify-content: center;" >
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
	                <form action="#" class="search-destination" @submit.prevent="search()">
	                  <div class="row">
	                  	<div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Pick up date</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>
	                          <input
	                          	ref="pickupdate"
	                            type="text"
	                            class="form-control checkin_date"
	                            placeholder="Pick up"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Pick up time</label>
	                        <div class="form-field">
	                          <div class="select-wrap">
	                            <div class="icon">
	                              <span class="ion-ios-arrow-down"></span>
	                            </div>
	                            <select name="" id="" class="form-control" ref="pickuptime">
	                            	<option v-for="(time) in timeOptions" :value="time">
							    		{{ time }}
							    	</option>
	                            </select>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                    
	                  	<div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Return date</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>
	                          <input
	                          	ref="returndate"
	                            type="text"
	                            class="form-control checkin_date"
	                            placeholder="Return"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Return time</label>
	                        <div class="form-field">
	                          <div class="select-wrap">
	                            <div class="icon">
	                              <span class="ion-ios-arrow-down"></span>
	                            </div>
	                            <select name="" id="" class="form-control" ref="returntime">
	                            	<option v-for="(time) in timeOptions" :value="time">
							    		{{ time }}
							    	</option>
	                            </select>
	                          </div>
	                        </div>
	                      </div>
	                    </div>

	                    <div class="col-md align-self-end">
	                      <div class="form-group">
	                        <div class="form-field">
	                          <input
	                            type="submit"
	                            value="Search"
	                            class="form-control btn btn-primary"
	                          />
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
`,
	props: {
	    onclickhandler: {
	      type: Function,
	      required: true
	    }
	},
	data(){
		return{
			timeOptions: this.generateTimeOptions()
		}
		
	},
	methods:{
		test(){
			console.log(this.$refs.pickuptime.value)
		},
		search(){
			const pudate=this.$refs.pickupdate.value
			const putime=this.$refs.pickuptime.value
			const rdate=this.$refs.returndate.value
			const rtime=this.$refs.returntime.value
			
			
			search_data={
				pickup_date:pudate,
				pickup_time:putime,
				return_date:rdate,
				return_time:rtime
			}
			
			const pudateSplit = pudate.split('/').map(Number)
			const putimeSplit = putime.split(':').map(Number)
			const puDateType = new Date(pudateSplit[2],
										pudateSplit[0]-1,
										pudateSplit[1],
										putimeSplit[0],
										putimeSplit[1])
										
			const rdateSplit = rdate.split('/').map(Number)
			const rtimeSplit = rtime.split(':').map(Number)
			const rDateType = new Date(rdateSplit[2],
										rdateSplit[0]-1,
										rdateSplit[1],
										rtimeSplit[0],
										rtimeSplit[1])

			console.log(puDateType)
			console.log(rDateType)
			
			
			if(pudate.length===0 || rdate.length===0){
				alert("날짜를 입력해주세요")
			}
			else if(puDateType>=rDateType)
			{
				alert("날짜나 시간이 올바르지 않습니다.")
			}else{
				location.href=`../car/car_search_list.do?
								pudate=${pudate}&putime=${putime}&
								rdate=${rdate}&rtime=${rtime}`
			}
		},
		generateTimeOptions() {
      		const options = []
      		const start = 9
      		const end = 22

	      	for (let i = start; i <= end; i++) {
	        	for (let j = 0; j < 60; j += 30) {
		          	if (i === end && j > 0) break
		          	const hh = i.toString().padStart(2, '0')
		          	const mm = j.toString().padStart(2, '0')
		          	options.push(`${hh}:${mm}`)
	        	}
	      	}

      	return options
    }
	},
	mounted(){
		console.log(this.$refs.form)
		console.log("mountedddddd")
	}
}

