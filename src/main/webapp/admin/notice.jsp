<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
  .html-content img {
    max-width: 100%;
    height: auto;
    display: block;
  }
  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.4);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  }
  .modal-content {
    background-color: white;
    width: 100%;
    max-width: 960px;
    max-height: 80vh;
    overflow-y: auto;
    padding: 24px;
    border-radius: 4px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    position: relative;
  }
  .modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ddd;
    padding-bottom: 8px;
    margin-bottom: 16px;
  }
  .modal-header h5 {
    margin: 0;
    color: #007bff;
    font-weight: bold;
  }
</style>
<script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="noticeApp">
<section class="w-100" id="noticeApp">
  <div style="padding: 0 50px; width: 100%; box-sizing: border-box;" class="responsive-wrapper">
    <div class="secb bg-white shadow-sm p-2 rounded-0">

      <div class="col-12 px-0 text-right my-2">
        <a href="../admin/notice_insert.do" type="button" class="btn btn-primary rounded-0">글쓰기</a>
      </div>

      <table class="table col-12 p-3">
        <thead class="bg-white">
          <tr class="text-black" style="color:black">
            <th width=10% class="text-center">번호</th>
            <th width=50% class="text-center">제목</th>
            <th width="20%" class="text-center">작성일</th>
            <th width="20%"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(vo,key) in list" :key="key">
            <td class="text-center align-middle">{{vo.no}}</td>
            <td class="text-center align-middle cursor-pointer" @click="noticeDetailData(vo.no)">{{vo.subject }}</td>
            <td class="text-center align-middle">{{vo.dbday }}</td>
            <td class="text-center align-middle">
              <input type="button" class="btn btn-warning rounded-0 mr-1" @click="routerUpdate(vo.no)" value="수정"/>
              <input type="button" class="btn btn-danger rounded-0" @click="noticeDelete(vo.no)" value="삭제"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="text-center">
              <input v-if="page>1" type="button" @click="prev()" value="이전"/>
              {{page}} page / {{totalpage}} pages
              <input v-if="page<totalpage" type="button" @click="next()" value="다음"/>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
  </section>

  <div v-if="modalVisible" class="modal-overlay" @click="hideBox">
    <div class="modal-content" @click.stop>
      <div class="modal-header">
        <h5>{{ dvo.subject }}</h5>
        <button type="button" class="btn-close" aria-label="Close" @click="hideBox"></button>
      </div>
      <pre style="white-space: pre-wrap; word-wrap: break-word; font-size: 1rem; line-height: 1.6;">
{{ dvo.content }}
      </pre>
    </div>
  </div>
</div>

<script>
const noticeApp = Vue.createApp({
  data() {
    return {
      list: [],
      page: 1,
      totalpage: 0,
      dvo: {},
      modalVisible: false
    }
  },
  mounted() {
    this.renderData();
  },
  methods: {
    routerUpdate(no) {
      location.href = "../admin/notice_update.do?no=" + no;
    },
    noticeDelete(no) {
      if (confirm("삭제하시겠습니까?")) {
        axios.post("../admin/notice_delete.do", null, { params: { no } })
          .then(() => {
            this.page = 1;
            this.renderData();
          })
          .catch(err => {
            console.log(err.response);
          });
      }
    },
    noticeDetailData(no) {
      axios.get("../admin/notice_detail_vue.do", { params: { no } })
        .then(res => {
          this.dvo = res.data;
          this.showBox();
        })
        .catch(err => {
          console.log(err.response);
        });
    },
    hideBox() {
      this.modalVisible = false;
    },
    showBox() {
      this.modalVisible = true;
    },
    next() {
      this.page++;
      this.renderData();
    },
    prev() {
      this.page--;
      this.renderData();
    },
    renderData() {
      axios.get("../notice/list.do", { params: { page: this.page } })
        .then(res => {
          this.list = res.data.list;
          this.totalpage = res.data.totalpage;
        });
    }
  }
}).mount("#noticeApp");
</script>
</body>
</html>
