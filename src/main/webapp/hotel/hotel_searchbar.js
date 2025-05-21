const hotel_searchbar = {
  name: 'SearchBar',
  data() {
    return {
      checkin: '',
      checkout: '',
      person: 2
    };
  },
  template: `
    <section class="ftco-section justify-content-end">
      <div class="container-wrap mx-auto">
        <div class="row no-gutters">
          <div class="col-md-12 tab-wrap rt-12 shadow">
            <div class="tab-content p-4 px-5">
              <div class="search-destination">
                <div class="row">
                  <div class="col-md align-items-end">
                    <div class="form-group">
                      <label>Check In</label>
                      <div class="form-field">
                        <input type="date" class="form-control" v-model="checkin" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md align-items-end">
                    <div class="form-group">
                      <label>Check Out</label>
                      <div class="form-field">
                        <input type="date" class="form-control" v-model="checkout" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md align-items-end">
                    <div class="form-group">
                      <label>Guest</label>
                      <div class="form-field">
                        <input type="number" class="form-control" v-model.number="person" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md align-self-end">
                    <div class="form-group">
                      <button class="form-control btn btn-primary" @click="onSearch">Search</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  `,
  methods: {
    onSearch() {
      if (!this.checkin || !this.checkout) {
        alert('체크인·체크아웃을 모두 선택해주세요.');
        return;
      }
      if (new Date(this.checkin) < new Date()) {
        alert('체크인은 오늘 이후여야 합니다.');
        return;
      }
      if (new Date(this.checkin) >= new Date(this.checkout)) {
        alert('체크아웃은 체크인 이후여야 합니다.');
        return;
      }
      // 부모 컴포넌트에 검색 조건 전달
      this.$emit('search', {
        checkin: this.checkin,
        checkout: this.checkout,
        person: this.person
      });
    }
  }
};
