<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
  <style>
    .ql-toolbar.ql-snow {
      border: none;
      border-bottom: 1px solid #ccc;
    }
  </style>
</head>
<body>
<section class="d-flex justify-content-center align-items-center" style="min-height: 100vh">
  <form id="postForm" method="post" action="/board/insert" enctype="multipart/form-data">
    <div class="container secb shadow py-2">
      <h3>글쓰기</h3>
      <div class="row p-3">
        <div class="input-group mb-2">
          <input
            type="text"
            class="col-9 form-control r-12"
            name="subject"
            placeholder="제목"
          />
          <select
            class="col-3 form-select border text-center"
            style="border-radius: 0 12px 12px 0"
            name="type"
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

        <div class="border mt-2 mb-2 r-12 col-12" id="editor-container" style="min-height: 500px; overflow hidden">
          <div class="border-0" id="editor"></div>
        </div>
        
        <!-- 글 내용 전달용 hidden input -->
        <input type="hidden" name="content" id="content" />

        <div class="col-12 text-right">
          <button type="submit" class="btn btn-primary r-12">글쓰기</button>
          <a href="../board/list.do" class="btn btn-info bg-white text-dark r-12">취소</a>
        </div>
      </div>
    </div>
  </form>
</section>

<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.min.js"></script>
<script>
  let quill;
  document.addEventListener("DOMContentLoaded", function () {
    const toolbarOptions = [
      [{ size: ["small", false, "large", "huge"] }],
      [{ header: [1, 2, 3, 4, 5, 6, false] }],
      ["bold", "italic", "underline", "strike"],
      [{ list: "ordered" }, { list: "bullet" }],
      [{ script: "sub" }, { script: "super" }],
      [{ color: [] }, { background: [] }],
      [{ font: [] }],
      [{ align: [] }],
      ["link", "image"]
    ];

    quill = new Quill("#editor", {
      theme: "snow",
      modules: {
        toolbar: {
          container: toolbarOptions,
          handlers: {
            image: function () {
              const input = document.createElement("input");
              input.setAttribute("type", "file");
              input.setAttribute("accept", "image/*");
              input.click();

              input.onchange = async function () {
                const file = input.files[0];
                const formData = new FormData();
                formData.append("file", file);

                const res = await fetch("../board/uploadImage.do", {
                  method: "POST",
                  body: formData
                });

                const data = await res.json();
                console.log(data)
                const range = quill.getSelection();
                quill.insertEmbed(range.index, "image", data.url);
              };
            }
          }
        }
      }
    });

    // 글쓰기 제출 시 에디터 내용 전달
    document.getElementById("postForm").onsubmit = function () {
      document.getElementById("content").value = quill.root.innerHTML;
    };
  });
</script>
</body>
</html>
