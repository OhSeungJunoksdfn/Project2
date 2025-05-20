<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
 <section
      class="d-flex justify-content-center align-items-center"
      style="min-height: 100vh"
      id="findApp"
    >
      <div class="container secb shadow py-2" style="max-width: 600px">
        <div class="row">
          <h3 class="pl-3" style="color: #78d5ef">아이디/비밀번호 찾기</h3>

        <div class="col-12">
	        <ul class="nav nav-pills">
	          <li class="nav-item col-6">
	            <a :class="findCheck===1? 'nav-link active text-center':'nav-link text-center'" @click="changeFind(1)" href="#">아이디 찾기</a>
	          </li>
	          <li class="nav-item col-6 ">
	            <a :class="findCheck===2? 'nav-link active text-center':'nav-link text-center'" @click="changeFind(2)" href="#">비밀번호 찾기</a>
	          </li>
	        </ul>
	    </div>
	    
	    <div v-if="findCheck===1" class="col-12 mt-3" >
	    	<p>이메일을 입력해주세요</p>
	    	 <div class="input-group mb-2">
                <input
                  type="text"
                  class="form-control r-12"
                  ref="email"
                  v-model="email"
                  placeholder="이메일"
                />
                <select
                  class="form-select"
                  v-model="emailPrefix"
                  style="border-radius: 0 12px 12px 0;border: 1px solid #ced4da;"
                >
                  <option value="@naver.com">@naver.com</option>
                  <option value="@daum.com">@daum.net</option>
                  <option value="@google.co.kr">@google.co.kr</option>
                </select>
              </div>
              <p style="font-size:9px;color:red" >{{result}}</p>
            <div class="input-group mb-2">
              <input
                type="button"
                value="아이디 찾기"
                class="form-control r-12 btn btn-primary r-12"
                @click="onClickIdFind()"
              />
            </div>
	    </div>
	    
	    <div v-if="findCheck===2" class="col-12 mt-3">
	    
	    	<p>아이디를 입력해주세요</p>
	    	 <div class="input-group mb-2">
              <input
                type="text"
                class="form-control r-12"
                placeholder="아이디"
                ref="id" v-model="id" name="id"
              />
            </div>
	    	
	    	<p>휴대폰 번호를 입력해주세요</p>
	    	 <div class="input-group mb-2">
                <select
                  class="form-select"
                  v-model="phonePrefix"
                  style="border-radius: 12px 0 0 12px;border: 1px solid #ced4da;"
                >
                  <option value="010">010</option>
                  <option value="011">011</option>
                </select>
                <input
                  type="tel"
  				  maxlength="8"
                  class="form-control r-12"
                  ref="phone"
                  v-model="phone"
                  placeholder="숫자만 입력해주세요"
                  @input="onlyNumber"
                />
              </div>
              <p style="font-size:9px;color:red" >{{result}}</p>
            <div class="input-group mb-2">
              <input
                type="submit"
                value="비밀번호 찾기"
                class="form-control r-12 btn btn-primary r-12"
                @click="onClickPwdFind()"
              />
            </div>
	    </div>
	    
        </div>
      </div>
    </section>
    <script>
    	const findApp = Vue.createApp({
    		data(){
    			return{
    				email:"",
    				emailPrefix:"@naver.com",
    				phone:"",
    				phonePrefix:"010",
    				id:"",
    				findCheck:1,
    				result:""
    				
    			}
    		},
    		methods:{
    			changeFind(i){
    				if(this.findCheck!==i)
    					{
    					this.findCheck=i
						this.result=""    					
    					}
    					
    			},
    			onlyNumber() {
    			    this.phone = this.phone.replace(/[^0-9]/g, '');
    			  },
    			onClickIdFind(){
    				  if(this.email==="")
    					{
    						this.$refs.email.focus()
    						
    						$("#emailErr").text("이메일을 입력해주세요")
    						return
    					}
    				  axios.get("../member/idfind_vue.do",{
    					  params:{
    						  email:this.email+this.emailPrefix
    						  
    					  }
    				  })
    				  .then(res => {
    					  if(res.data==="")
    					  {
    						this.result="일치하는 회원 정보가 없습니다."  
    				      }
    					  else{
    						  window.location.href="../member/findid.do?id="+res.data
    					  }
    				  })
    			  },
    			  onClickPwdFind(){
    				  
    				  if(this.id==="")
    					{
    						this.$refs.id.focus()
    						$("#idErr").text("아이디를 입력해주세요")
    						return
    					}
    				  if(this.phone==="" || this.phone.length!==8)
    					{
    						this.$refs.phone.focus()
    						$("#phoneErr").text("번호를 8자리까지 입력해주세요")
    						return
    					}
    				  axios.get("../member/pwdfind_vue.do",{
    					  params:{
    						  id:this.id,
    						  phone:this.phone,
    						  phonePrefix:this.phonePrefix
    					  }
    				  })
    				  .then(res => {
    					if(res.data===1)
    					{
    						window.location.href="../member/findpwd.do?id="+this.id  
    					}
    					else{
    						this.result="일치하는 회원 정보가 없습니다."
    					}
    				  })
    			  }
    		}
    	}).mount("#findApp")
    </script>
</body>
</html>