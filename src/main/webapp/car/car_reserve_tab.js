

const car_reserve_tab = {
template:
`
	<div style="display: flex;justify-content: center;" @click="onclickhandler">
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
	                <form action="#" class="search-destination">
	                  <div class="row">
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">From</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-my_location"></span>
	                          </div>
	                          <input
	                            type="text"
	                            class="form-control"
	                            placeholder="From"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Where</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>
	                          <input
	                            type="text"
	                            class="form-control"
	                            placeholder="Where"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Check In</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>
	                          <input
	                            type="text"
	                            class="form-control checkin_date"
	                            placeholder="Check In"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Check Out</label>
	                        <div class="form-field">
	                          <div class="icon">
	                            <span class="icon-map-marker"></span>
	                          </div>
	                          <input
	                            type="text"
	                            class="form-control checkout_date"
	                            placeholder="From"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md align-items-end">
	                      <div class="form-group">
	                        <label for="#">Travelers</label>
	                        <div class="form-field">
	                          <div class="select-wrap">
	                            <div class="icon">
	                              <span class="ion-ios-arrow-down"></span>
	                            </div>
	                            <select name="" id="" class="form-control">
	                              <option value="">1</option>
	                              <option value="">2</option>
	                              <option value="">3</option>
	                              <option value="">4</option>
	                              <option value="">5</option>
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
  }
  
}

