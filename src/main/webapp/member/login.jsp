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
      <div class="container secb shadow py-2" style="max-width: 400px">
        <div class="row">
          <h3 class="pl-3" style="color: #78d5ef"><a href="../main/main.do"><</a>로그인</h3>
          <div class="col-12">
            <div class="input-group mb-2">
              <input
                type="text"
                class="form-control r-12"
                placeholder="아이디"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="password"
                class="form-control r-12"
                placeholder="비밀번호"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control btn btn-primary r-12"
                style="height: 52px"
                value="로그인"
              />
            </div>
            <div class="input-group mb-2">
              <input
                type="button"
                class="form-control btn btn-info r-12"
                style="height: 52px"
                value="회원가입"
              />
            </div>
          </div>
          <div class="col-6">
            <p class="text-center cursor-pointer">아이디 찾기</p>
          </div>
          <div class="col-6">
            <p class="text-center cursor-pointer" style="cursor: pointer">
              비밀번호 찾기
            </p>
          </div>
        </div>
      </div>
    </section>
</body>
</html>