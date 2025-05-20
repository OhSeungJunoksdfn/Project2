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
      <div class="container secb shadow py-2" style="max-width: 500px">
      	<div class="row">
      		<div class="col-12">
      			<div class="input-group">
                <input
                  type="password"
                  class="form-control r-12 mb-2"
                  ref="pwd"
                  v-model="pwd"
                   @keydown="errclear('#pwdErr')"
                  placeholder="비밀번호"
                />
              </div>
              <div class="input-group mb-2">
                <input
                  type="password"
                  class="form-control r-12"
                  ref="check_pwd"
                  v-model="check_pwd"
                   @input="pwdCheck()"
                  placeholder="비밀번호 확인"
                />
              </div>
              <p class="errtext ml-2 mb-2" style="color:red;font-size:9px" id="pwdErr"></p>
              <div class="input-group mb-2">
              <input
                type="button"
                value="비밀번호 변경"
                class="form-control r-12 btn btn-primary r-12"
                @click="changetPwd()"
              />
            </div>
            </div>
      		</div>
      	</div>
    </section>
<script>
	const findApp= Vue.createApp({
		data(){
			return{
				id:"${id}",
				pwd:"",
				check_pwd:"",
				pwdErr:""
			}
		},
		methods:{
			errclear(el){
				$(el).text("")
			},
			pwdCheck(){
				if(this.pwd===this.check_pwd)
				{
					this.pwdOk=true
					$("#pwdErr").text("")	
					return
				}
				this.pwdOk=false
				$("#pwdErr").text("비밀번호가 일치하지 않습니다.")
			},
			changetPwd(){
				console.log(this.id)
				if(this.pwd==="")
				{
					this.$refs.pwd.focus()
					$("#pwdErr").text("비밀번호를 입력해주세요")
					return
				}
				if(this.check_pwd==="")
				{
					this.$refs.check_pwd.focus()
					$("#pwdErr").text("비밀번호를 입력해주세요")
					return
				}
				if(this.pwdOk===false)
				{
				this.$refs.pwd.focus()
				return
				}
				
				axios.post("../member/pwdUpdate_vue.do",null,{
					params:{
						id:this.id,
						pwd:this.pwd
					}
				})
				.then(res => {
					if(res.data==='y')
						{
						alert("비밀번호를 변경하였습니다.")
						window.location.href="../main/main.do"
						}
					else{
						alert("비밀번호 변경을 실패했습니다.")
					}
				})
			}
		}
	}).mount("#findApp")
</script>
</body>
</html>