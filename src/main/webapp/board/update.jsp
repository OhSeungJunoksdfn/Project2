<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글쓰기</title>
  <!-- Quill 스타일시트 -->
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
    /* 1) 에디터 외부 컨테이너 고정 */
    #editor,
    .ql-container {
      width: 100% !important;
      max-width: 100% !important;
    }

    /* 2) 에디터 내부 콘텐츠도 강제 줄바꿈 */
    .ql-editor {
      word-break: break-word;
      white-space: normal; /* pre-wrap 대신 normal로 바꿔도 됩니다 */
      overflow-wrap: break-word;
    }

    /* 3) 이미지가 컨테이너 너비를 넘지 않도록 */
    .ql-editor img {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
<section class="d-flex ftco-animate justify-content-center align-items-center" style="min-height: 100vh">
  <form id="postForm"
        method="post"
        action="/board/update_ok.do"
        enctype="multipart/form-data"
        class="w-100"
        >

    <div class="container secb shadow py-2">
      <h3>글쓰기</h3>
      <div class="row p-3">
        <!-- 제목, 유형 -->
        <div class="input-group mb-2">
          <input type="text" class="col-9 form-control r-12" value="${vo.subject }" name="subject" placeholder="제목" required/>
          <input type="hidden" name="no" value="${vo.no}" />
          <select class="col-3 form-select border text-center"
                  style="border-radius: 0 12px 12px 0"
                  name="type" required>
            <option value="자유글" ${vo.type=='자유글'? 'selected':'' } >자유글</option>
            <option value="관광지" ${vo.type=='관광지'? 'selected':'' }>관광지</option>
            <option value="호텔" ${vo.type=='호텔'? 'selected':'' }>호텔</option>
            <option value="맛집" ${vo.type=='맛집'? 'selected':'' }>맛집</option>
            <option value="렌트" ${vo.type=='렌트'? 'selected':'' }>렌트</option>
          </select>
        </div>

        <!-- Quill 툴바 & 에디터 -->
        <div class="col-12 w-100 px-0 mb-3">
          <div id="toolbar">
            <span class="ql-formats">
              <button class="ql-bold"></button>
              <button class="ql-italic"></button>
              <button class="ql-underline"></button>
            </span>
            <span class="ql-formats">
              <button class="ql-link"></button>
              <button class="ql-image"></button>
            </span>
          </div>
          <div id="editor" class="border mb-3" style="height:500px;">${vo.content }</div>
          <!-- 전송용 hidden -->
          <input type="hidden" name="content" id="contentInput"/>
        </div>

        <!-- 버튼 -->
        <div class="col-12 text-right">
          <button type="submit" class="btn btn-primary r-12">수정</button>
          <a href="../board/detail.do?no=${vo.no }"
             class="btn btn-info bg-white text-dark r-12">취소</a>
        </div>
      </div>
    </div>
  </form>
</section>

<!-- Quill JS -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
  // 이미지 업로드 처리 핸들러
  function imageHandler() {
    const input = document.createElement('input');
    input.setAttribute('type','file');
    input.setAttribute('accept','image/*');
    input.click();
    input.onchange = () => {
      const file = input.files[0];
      const form = new FormData();
      form.append('image', file);
      // 업로드 엔드포인트 경로는 실제 매핑에 맞게 조정
      fetch('../board/uploadImage.do', {
        method: 'POST',
        body: form
      })
      .then(res => res.json())
      .then(data => {
        const range = quill.getSelection(true);
        quill.insertEmbed(range.index, 'image', data.url);
        quill.setSelection(range.index + 1);
      })
      .catch(console.error);
    };
  }

  // Quill 에디터 초기화 (한 번만!)
  const quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: {
        container: '#toolbar',
        handlers: {
          'image': imageHandler
        }
      }
    }
  });

  // 폼 제출 시 에디터 HTML을 hidden input 에 복사
  document.getElementById('postForm').addEventListener('submit', () => {
    document.getElementById('contentInput').value = quill.root.innerHTML;
  });
</script>
</body>
</html>
