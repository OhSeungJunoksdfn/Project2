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
    >
      <div class="container secb shadow py-2" style="max-width: 500px">
      
      	<div class="col-12">
      		<h3 class="text-center">아이디 </h3>
      		<p class="text-center my-2">${id }</p>
      		<div class="input-group mb-2">
              <a href="../member/login.do" class=" form-control d-flex justify-content-center align-items-center r-12 btn btn-primary r-12">로그인하러 가기</a>
            </div>
      		<div class="input-group mb-2">
              <a href="../member/find.do" class="form-control d-flex justify-content-center align-items-center r-12 btn btn-info r-12">비밀번호 찾기</a>
            </div>
      	</div>
      </div>
     </section>
</body>
</html>