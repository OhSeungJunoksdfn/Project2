<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link
      href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css"
      rel="stylesheet"
    />
    <style>
      .ql-toolbar.ql-snow {
        border: none;
        border-bottom: 1px solid #ccc;
      }
    </style>
</head>
<body>
<section
      class="d-flex justify-content-center align-items-center"
      style="min-height: 100vh"
    >
      <form>
        <div class="container secb shadow py-2">
          <h3>글쓰기</h3>
          <div class="row p-3">
            <div class="input-group mb-2">
              <input
                type="text"
                class="col-9 form-control r-12"
                placeholder="제목"
              />
              <select
                class="col-3 form-select border text-center"
                style="border-radius: 0 12px 12px 0"
              >
                <option value="" selected disabled>
                  == 게시글 유형 선택 ==
                </option>
                <option value="자유글">자유글</option>
                <option value="관광지">관광지</option>
                <option value="호텔">호텔</option>
                <option value="맛집">맛집</option>
                <option value="렌트">렌트</option>
              </select>
            </div>
            <div
              class="border mt-2 mb-2 r-12 col-12"
              id="editor-container"
              style="min-height: 500px; overflow: hidden"
            >
              <div class="border-0" id="editor"></div>
            </div>
            <div class="col-12 text-right">
              <input
                type="button"
                class="btn btn-primary r-12"
                value="글쓰기"
              />
              <input
                type="button"
                class="btn btn-info bg-white text-dark r-12"
                value="취소"
              />
            </div>
          </div>
        </div>
      </form>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const toolbarOptions = [
          [{ size: ["small", false, "large", "huge"] }], // 글자 크기
          [{ header: [1, 2, 3, 4, 5, 6, false] }], // 제목 스타일
          ["bold", "italic", "underline", "strike"], // 기본 스타일

          [{ list: "ordered" }, { list: "bullet" }], // 리스트
          [{ script: "sub" }, { script: "super" }], // 위첨자/아래첨자

          [{ color: [] }, { background: [] }], // 글자색, 배경색
          [{ font: [] }], // 글꼴
          [{ align: [] }], // 정렬

          ["link", "image"], // 삽입
        ];

        const quill = new Quill("#editor", {
          theme: "snow",
          modules: {
            toolbar: toolbarOptions,
          },
        });
      });
    </script>
</body>
</html>