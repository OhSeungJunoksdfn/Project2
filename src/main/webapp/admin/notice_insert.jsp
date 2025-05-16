<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 작성</title>
</head>
<body>
<section class="d-flex ftco-animate justify-content-center align-items-center " >
  <form id="postForm"
        method="post"
        action="../admin/notice_insert_ok.do"
        enctype="multipart/form-data"
        class="w-100"
        >

    <div class="container secb rounded-0 shadow py-2 " style="background-color:#fefefe">
      <h3 class="mb-0" >공지사항 작성</h3>
      <div class="row p-3">
        <!-- 제목, 유형 -->
        <div class="input-group mb-2">
          <input type="text" class="col-12 form-control" name="subject" placeholder="제목" required/>
        </div>
		<div class="col-12 px-0">
			<textarea style="width:100%; margin:0; padding:0; height: 500px; resize:none" name="content"></textarea>
		</div>
    
        <!-- 버튼 -->
        <div class="col-12 text-right px-0">
          <button type="submit" class="btn btn-primary rounded-0">글쓰기</button>
          <a href="../admin/notice.do"
             class="btn btn-info bg-white text-dark rounded-0">취소</a>
        </div>
      </div>
    </div>
  </form>
</section>


</body>
</html>
