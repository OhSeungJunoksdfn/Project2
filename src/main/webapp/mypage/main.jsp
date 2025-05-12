<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="ftco-section">
      <div class="container">
        <div class="row">
          <!--사이드바-->
          <div class="col-lg-3 sidebar ftco-animate shadow pt-3" id="sidebar">
            <div class="sidebar-wrap ftco-animate">
              <h3 class="heading mb-4">마이페이지</h3>
              <div class="input-group mb-2">
              <input
                type="button"
                class="form-control r-12 cursor-pointer"
                value="공지사항"
                @click="changeSup('../customer/main.do')"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control r-12 cursor-pointer"
                value="문의하기"
                 @click="changeSup('../customer/insert.do')"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control r-12 cursor-pointer"
                value="내 문의"
                 @click="changeSup('../customer/list.do')"
              />
            </div>
            
            </div>
          </div>
          <!-- END-->
          <div class="col-lg-9 ftco-animate">
            <div class="row parent">
            <jsp:include page="${mypage_jsp }"></jsp:include>
            </div>
          </div>
       </div>
    </div>
   </section>
   <script>
   	const app = Vue.createApp({
   		data(){
   			
   		},
   		methods:{
   			changeSup(url){
   				location.href=url
   			}
   		}
   	
   	}).mount('#sidebar')
   </script>
</body>
</html>