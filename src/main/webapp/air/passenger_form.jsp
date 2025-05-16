<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
      .errtext {
        font-size: 12px;
        color: red;
      }
      input::-webkit-inner-spin-button,
      input::-webkit-outer-spin-button {
        opacity: 0;
      }

      [type="radio"],
      span {
        vertical-align: middle;
      }

      [type="radio"] {
        appearance: none;
        border: max(2px, 0.1em) solid gray;
        border-radius: 50%;
        width: 1.25em;
        height: 1.25em;
        transition: border 0.5s ease-in-out;
      }

      [type="radio"]:checked {
        border: 0.4em solid #4eb8d1;
      }

      [type="radio"]:focus-visible {
        outline-offset: max(2px, 0.1em);
        outline: max(2px, 0.1em) dotted #4eb8d1;
      }

      [type="radio"]:hover {
        box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
        cursor: pointer;
      }
    </style>
</head>
<body>
	<section
      class="d-flex justify-content-center align-items-center"
      style="min-height: 100vh;margin: 50px 0;"
      id="registerApp"
    >
      <div class="container secb shadow py-2" style="max-width: 500px">
        <div class="row">
          <h3 class="pl-3" style="color: #78d5ef">회원가입</h3>
          <form ref="myform" method="post" action="../member/register_ok.do" >
          <div class="col-12">
            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                여권번호
              </p>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control r-12 col-9"
                  name="id"
                  ref="id"
                  v-model="id"
                  placeholder="여권번호"
                  readonly
                />
              </div>
              <p class="errtext ml-2" id="idErr"></p>
            </div>
            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                이메일
              </p>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control r-12"
                  name="email"
                  ref="email"
                  v-model="email"
                  placeholder="이메일"
                />
                <select
                  class="form-select"
                  name="emailPrefix"
                  style="border-radius: 0 12px 12px 0;border: 1px solid #ced4da;"
                >
                  <option value="@naver.com">@naver.com</option>
                  <option value="@daum.com">@daum.com</option>
                  <option value="@google.co.kr">@google.co.kr</option>
                </select>
              </div>
              <p class="errtext ml-2" id="emailErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                이름
              </p>
              <div class="input-group">
                <input type="text" class="form-control r-12" name="fname" ref="fname" v-model="fname"  placeholder="성"  @keydown="errclear('#nameErr')" />
                <input
                  type="text"
                  class="form-control r-12"
                  name="sname"
                  ref="sname"
                  v-model="sname"
                  placeholder="이름"
                   @keydown="errclear('#nameErr')"
                />
              </div>
              <p class="errtext ml-2" id="nameErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                비밀번호
              </p>
              <div class="input-group">
                <input
                  type="password"
                  class="form-control r-12 mb-2"
                  name="pwd"
                  ref="pwd"
                  v-model="pwd"
                   @keydown="errclear('#pwdErr')"
                  placeholder="비밀번호"
                />
              </div>
              <div class="input-group">
                <input
                  type="password"
                  class="form-control r-12"
                  name="check_pwd"
                  ref="check_pwd"
                  v-model="check_pwd"
                   @input="pwdCheck()"
                  placeholder="비밀번호 확인"
                />
              </div>
              <p class="errtext ml-2" id="pwdErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                생일
              </p>
              <div class="input-group">
                <input type="date" class="form-control r-12" name="birthday" ref="birthday"
                  v-model="birthday"  @click="errclear('#dayErr')" />
              </div>
              <p class="errtext ml-2" id="dayErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                휴대전화
              </p>
              <div class="input-group">
                <select
                  class="form-select"
                  name="phonePrefix"
                  style="border-radius: 12px 0 0 12px;border: 1px solid #ced4da;"
                >
                  <option value="010">010</option>
                  <option value="011">011</option>
                </select>
                <input
                  type="tel"
  				  maxlength="8"
                  class="form-control r-12"
                  name="phone"
                  ref="phone"
                  v-model="phone"
                  placeholder="숫자만 입력해주세요"
                  @input="onlyNumber"
                />
              </div>
              <p class="errtext ml-2" id="phoneErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                주소
              </p>
              <div class="input-group mb-2">
                <input
                  type="text"
                  class="r-12 pl-2"
                  style="height: 52px; border: 1px solid #ced4da; width: 100px"
                  placeholder="우편번호"
                  name="post"
				  ref="post"
				  v-model="post"
				  readonly
                />
                <input
                  type="button"
                  class="ml-2 borer-0 btn btn-primary px-2 r-12"
                   @click="daum('#addrErr')"
                  value="주소찾기"
                />
              </div>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control r-12 col-9"
                  placeholder="주소"
                  name="addr1"
                  ref="addr1"
                  v-model="addr1"
                  readonly
                />
                <input
                  type="text"
                  class="form-control r-12 col-3"
                  placeholder="상세주소"
                  name="addr2"
                  ref="addr2"
                  v-model="addr2"
                />
              </div>
              <p class="errtext ml-2" id="addrErr"></p>
            </div>

            <div class="mb-2">
              <p
                class="ml-2 mb-1"
                style="
                  font-size: 16px;
                  color: black;
                  font-weight: 500;
                  line-height: 16px;
                "
              >
                성별
              </p>
              <div class="input-group">
                <label> <input type="radio" name="sex" value="남자" checked />남자 </label>
                <label>
                  <input type="radio" name="sex" value="여자" class="ml-2" />여자
                </label>
              </div>
              <p class="errtext ml-2" id="sexErr"></p>
            </div>

            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control btn btn-primary r-12"
                style="height: 52px"
                value="등록"
                @click="join()"
              />
            </div>

            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control btn btn-info r-12"
                style="height: 52px"
                value="취소"
                @click="login()"
              />
            </div>
          </div>
          </form>
        </div>
      </div>
      
      
    <section
    	class="row justify-content-center align-items-center"
        style="
          background-color: rgba(0, 0, 0, 0.1);
          z-index: 999;
          width: 100vw;
          height: 100vh;
          position: fixed;
          left: 0;
          top: 0;
		  display:none;
        "
        id="check_idBox"
        @click="hideBox()"
      >
        <div
          class="container r-12"
          style="width: 400px; background-color: white;margin-bottom:300px"
          @click.stop
        >
          <div class="row justify-content-center">
            <p
              class="col-12 p-3 mb-2"
              style="
                font-size: 16px;
                color: white;
                font-weight: 500;
                line-height: 16px;
                background-color: #3f5277;
                
              "
            >
              여권번호중복 확인
            </p>
            
              <div class="input-group mb-2 mx-2">
                <input
                  type="text"
                  class="form-control col-9 r-12"
                  name="check_id"
                  ref="check_id"
                  v-model="check_id"
                  placeholder="아이디(최대 20자)"
                  maxlength="20"
                  @keydown="hideuseBtn()"
                />
                <input type="button" value="중복확인" class="col-3 form-control btn btn-primary r-12" @click="memberCheck()"/>
              </div>
                <p class="errtext ml-2" id="check_idErr"></p>
            
            <input
              type="button"
              value="사용하기"
              class="btn btn-primary r-12"
              id="useBtn"
              style="margin-bottom: 15px;display:none"
              @click="insertid()"
            />
          </div>
        </div>
      </section>
    </section>
    
<script>
	const registerApp=Vue.createApp({
		data(){
			return{
				id:"",
				fname:"",
				sname:"",
				phone:"",
				post:"",
				addr1:"",
				addr2:"",
				birthday:"",
				email:"",
				check_id:"",

			}	
		},
		methods:{
			hideuseBtn(){
				$("#useBtn").hide()
				this.errclear('#nameErr')
			},
			insertid(){
				this.id=this.check_id
				this.hideBox()
			},
			memberCheck(){
				$("#check_idErr").text("")
				$("#useBtn").hide()
				if(this.check_id==="")
				{
					this.$refs.check_id.focus()
					$("#check_idErr").text("여권번호를 입력해주세요")
					return
				}
				axios.get("../member/idCheck_vue.do",{
					params:{
					id:this.check_id
					}
				})
				.then(res => {
					if(res.data!='YES')
					{
						$("#check_idErr").text("중복여권이있습니다.")
						return
					}
					$("#useBtn").show()
				})
				.catch(err => {
					console.log(err.response)
				})
			},
			hideBox(){
				$("#check_idBox").hide();
				$("#useBtn").hide()
			},
			showBox(){
				this.check_id=""
				$("#check_idBox").show();
				this.errclear("#idErr")
			},
			onlyNumber() {
			    
			    this.phone = this.phone.replace(/[^0-9]/g, '');
			  },
			daum(el){
				this.errclear(el)
				const _this = this
				new daum.Postcode({
			        oncomplete: function(data) {
			            console.log(data.address)
			            _this.post=data.zonecode
			            _this.addr1=data.address
			        }
			    }).open();
			},
			errclear(el){
				$(el).text("")
			},

			},
			join(){
				if(this.email==="")
				{
					this.$refs.email.focus()
					
					$("#emailErr").text("이메일을 입력해주세요")
					return
				}
				if(this.fname==="")
				{
					this.$refs.fname.focus()
					$("#nameErr").text("성을 입력해주세요")
					return
				}
				if(this.sname==="")
				{
					this.$refs.sname.focus()
					$("#nameErr").text("이름을 입력해주세요")
					return
				}

				if(this.pwdOk===false)
					{
					this.$refs.pwd.focus()
					return
					}
				if(this.birthday==="")
				{
					this.$refs.pwd.focus()
					$("#dayErr").text("생년월일을 입력해주세요")
					return
				}
				
				if(this.post==="")
				{
					this.$refs.post.focus()
					$("#addrErr").text("주소를 입력해주세요")
					return
				}
			
				this.$refs.myform.submit();
				
			}
		}
	}).mount("#registerApp")