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
      <div class="container secb shadow py-2">
        <div class="row p-2">
          <h3 class="col-12">제목</h3>
          <p class="col-12" style="color: black; font-weight: 600">이름</p>
          <div class="col-12 d-flex justify-content-between border-bottom">
            <p>날짜</p>
            <div class="d-flex">
              <p class="pr-2">좋아요</p>
              <p>댓글 10</p>
            </div>
          </div>
          <div class="border-bottom w-100 mb-2">
            <textarea
              style="
                width: 100%;
                min-height: 500px;
                border: none;
                resize: none;
                outline: none;
              "
              readonly
            ></textarea>
          </div>
          <div class="col-12 text-right">
            <input
              type="button"
              class="btn btn-info r-12 bg-white text-dark"
              value="이전"
            />
            <input
              type="button"
              class="btn btn-info r-12 bg-white text-dark"
              value="다음"
            />
            <input type="button" class="btn btn-primary r-12" value="목록" />
          </div>

          <h3 class="col-12 mb-5">6 Comments</h3>
          <div class="col-12">
            <ul class="comment-list">
              <li class="comment">
                <div class="vcard bio">
                  <img src="images/person_1.jpg" alt="Image placeholder" />
                </div>
                <div class="comment-body">
                  <h3>John Doe</h3>
                  <div class="meta">October 03, 2018 at 2:21pm</div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Pariatur quidem laborum necessitatibus, ipsam impedit vitae
                    autem, eum officia, fugiat saepe enim sapiente iste iure!
                    Quam voluptas earum impedit necessitatibus, nihil?
                  </p>
                  <p><a href="#" class="reply">Reply</a></p>
                </div>
              </li>
            </ul>
          </div>
          <h3 class="ml-3">댓글입력</h3>
          <div class="container input-group mb-3">
            <textarea
              class="form-control"
              placeholder="Recipient's username"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
              style="
                resize: none;
                height: 100px !important;
                border-radius: 12px 0 0 12px;
              "
            ></textarea>
            <button
              class="replyBtn cursor-pointer"
              style="border-radius: 0 12px 12px 0"
            >
              댓글
            </button>
          </div>
        </div>
      </div>
    </section>
</body>
</html>