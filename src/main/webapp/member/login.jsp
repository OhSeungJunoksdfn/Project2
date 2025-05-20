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
      id="loginApp"
      style="min-height: 100vh"
    >
    <form method="post" action="../member/login.do" id="frm" >
      <div class="container secb shadow py-2" style="max-width: 400px">
        <div class="row">
          <h3 class="pl-3" style="color: #78d5ef"><a href="../main/main.do"><</a>로그인</h3>
          <div class="col-12">
            <div class="input-group mb-2">
              <input
                type="text"
                class="form-control r-12"
                placeholder="아이디"
                ref="id" v-model="id" name="id"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="password"
                class="form-control r-12"
                placeholder="비밀번호"
                ref="pwd" v-model="pwd" name="pwd"
              />
            </div>
            <div class="input-group">
            <label style="margin:0">
            	<input type="checkbox" name="remember-me">자동 로그인
            </label>
            </div>
            <p class="text-center" style="color:red;">${message }</p>
            <div class="input-group mb-2">
              <input
                type="button"
                id="login"
                class="form-control btn btn-primary r-12"
                style="height: 52px"
                value="로그인"
                @click="login()"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control btn btn-info r-12"
                style="height: 52px"
                value="회원가입"
                @click="register()"
              />
            </div>
          </div>
          <div class="col-12">
            <p class="text-right cursor-pointer"><a href="../member/find.do">아이디/비밀번호 찾기</a></p>
          </div>
          
        </div>
      </div>
      </form>
    </section>
    
<script>
	const loginApp = Vue.createApp({
		data(){
			return{
				id:"",
				pwd:""
			}
		},
		methods:{
			login(){
				if(this.id==="")
				{
					this.$refs.id.focus()
					return
				}
				if(this.pwd==="")
				{
					this.$refs.pwd.focus()
					return
				}
				$("#frm").submit()
			},
			register(){
				location.href="../member/register.do"
			}
		}
	}).mount("#loginApp")
</script>
</body>
</html>