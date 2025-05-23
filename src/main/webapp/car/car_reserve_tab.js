

const car_reserve_tab = {
template:
`
	<div  >

	                <form action="#" class="search-destination" @submit.prevent="search()">
	                  <div class="row">
	                  	<div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Pick up date</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>

	                          <input ref="pickupdate" type="date" class="form-control" v-model="checkin" />
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
	                          <input ref="returndate" type="date" class="form-control" v-model="checkin" />
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
			
			const pudateSplit = pudate.split('-').map(Number)
			const putimeSplit = putime.split(':').map(Number)
			const puDateType = new Date(pudateSplit[0],
										pudateSplit[1]-1,
										pudateSplit[2],
										putimeSplit[0],
										putimeSplit[1])
			console.log(puDateType)
			const rdateSplit = rdate.split('-').map(Number)
			const rtimeSplit = rtime.split(':').map(Number)
			const rDateType = new Date(rdateSplit[0],
										rdateSplit[1]-1,
										rdateSplit[2],
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
				location.href='../car/car_search_list.do?
								pudate=${pudate}&putime=${putime}&
								rdate=${rdate}&rtime=${rtime}'
			}
		},
		generateTimeOptions() {
      		const options = []
      		const start = 9
      		const end = 22

	      	for (let i = start; i <= end; i++) {
	      		const hh = i.toString().padStart(2, '0')
	      		options.push(`${hh}:00`)
	      	}

      	return options
    }
	},
	mounted(){
		console.log(this.$refs.form)
		console.log("mountedddddd")
	}
}

