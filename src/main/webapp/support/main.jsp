<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <h3 class="heading mb-4">고객센터</h3>
              <div class="input-group mb-2">
              <input
                type="button"
                class="form-control r-12 cursor-pointer"
                value="공지사항"
                @click="changeSup('../customer/main.do')"
              />
            </div>
            <c:if test="${sessionScope.id!=null }">
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
             </c:if>
            </div>
          </div>
          <!-- END-->
          <div class="col-lg-9 ftco-animate">
            <div class="row parent">
            <jsp:include page="${support_jsp }"></jsp:include>
            </div>
          </div>
       </div>
    </div>
   </section>
   <script>
   	const app = Vue.createApp({
   		methods:{
   			changeSup(url){
   				location.href=url
   			}
   		}
   	
   	}).mount('#sidebar')
   </script>
</body>
</html>