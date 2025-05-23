<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .html-content img {
    max-width: 100%;
    height: auto;    
    display: block;  
  }
  @media (max-width: 768px) {
    .responsive-wrapper {
      padding: 0 20px !important;
    }
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
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="w-100" id="qnaApp">
  <div style="padding: 0 50px; width: 100%; box-sizing: border-box;" class="responsive-wrapper">
    <div class="secb bg-white shadow-sm rounded-0">

      <div class="col-12 p-2">
        <h3>문의글</h3>
        <table class="table">
          <thead>
            <tr>
              <th width="60%" class="text-center">제목</th>
              <th width="20%" class="text-center">작성일</th>
              <th width="20%" class="text-center">답변</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(vo,key) in list" :key="key">
              <th width="60%" @click="qnaDetailData(vo.no)" class="cursor-pointer">[{{vo.type}}] {{vo.subject}}</th>
              <td width="20%" class="text-center">{{vo.dbday}}</td>
              <td width="20%" class="text-center">
                <a :href="'../admin/qna_insert.do?no='+vo.no" v-if="vo.isok==='n'" class="btn btn-primary r-12">답변하기</a>
                <input type="button" value="답변수정" v-if="vo.isok==='y'" class="btn btn-success r-12" />
              </td>
            </tr>
          </tbody>
        </table>

        <div class="col-12 text-center">
          <div class="block-27">
            <ul>
              <li @click="prev()" v-if="startPage>1"><a>&lt;</a></li>
              <li @click="pageChange(i)" v-for="i in range(startPage,endPage)" :class="i===page ? 'active cursor-pointer' : 'cursor-pointer'"><a>{{i}}</a></li>
              <li @click="next()" v-if="endPage<totalpage"><a>&gt;</a></li>
            </ul>
          </div>
        </div>
      </div>

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
  </div>
</section>
<script>
  const customerApp = Vue.createApp({
    data() {
      return {
        list: [],
        totalpage: 0,
        startPage: 0,
        endPage: 0,
        page: 1,
        dvo: {},
        modalVisible: false
      }
    },
    mounted() {
      this.renderData()
    },
    methods: {
      qnaDetailData(i) {
        axios.get("../admin/qna_detail_vue.do", {
          params: {
            no: i
          }
        })
          .then(res => {
            this.dvo = res.data
            this.showBox()
          })
          .catch(err => {
            console.log(err.response)
          })
      },
      hideBox() {
        this.modalVisible = false;
      },
      showBox() {
        this.modalVisible = true;
      },
      next() {
        this.page = this.endPage + 1
        this.renderData()
      },
      prev() {
        this.page = this.startPage - 1
        this.renderData()
      },
      pageChange(i) {
        this.page = i
        this.renderData()
      },
      range(start, end) {
        let arr = []
        let len = end - start
        for (let i = 0; i <= len; i++) {
          arr[i] = start
          start++
        }
        return arr
      },
      renderData() {
        axios.get("../admin/qna_list_vue.do", {
          params: {
            page: this.page
          }
        })
          .then(res => {
            this.list = res.data.list
            this.totalpage = res.data.totalpage
            this.startPage = res.data.startPage
            this.endPage = res.data.endPage
            console.log(res.data)
          })
          .catch(err => {
            console.error(err)
          })
      }
    }
  }).mount("#qnaApp")
</script>
</body>
</html>
