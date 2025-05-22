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
</style>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="w-100" id="boardListApp">
  <div style="padding: 0 50px; width: 100%; box-sizing: border-box;" class="responsive-wrapper">
    <div class="secb bg-white shadow-sm rounded-0">
      <div class="col-12 p-2">
        <h3>게시글 관리</h3>
        <table class="table">
          <thead>
            <tr class="text-center">
              <th width="10%">전체 <input type="checkbox" @change="toggleAll($event)" :checked="selected.length === list.length && list.length > 0"></th>
              <th width="40%" colspan="2">제목</th>
              <th width="20%">작성자</th>
              <th width="20%">작성일</th>
              <th width="10%">
                <input type="button" value="선택삭제" class="btn btn-danger rounded-0" @click="deleteSelected()">
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(vo,key) in list" :key="key">
              <td width="10%" class="text-center">
                <input type="checkbox" v-model="selected" :value="vo.no">
              </td>
              <td width="10%" class="text-center">{{vo.no }}</td>
              <td width="30%">
                <a @click="boardDetailData(vo.no)" class="cursor-pointer" style="font-weight:700;color:black;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
                  [{{vo.type}}] {{vo.subject }}
                </a>
              </td>
              <td width="20%" class="text-center">{{vo.name }}</td>
              <td width="20%" class="text-center">{{vo.dbday }}</td>
              <td width="10%" class="text-center">
                <input @click="boardDel(vo.no)" type="button" value="삭제" class="btn btn-danger rounded-0">
              </td>
            </tr>
          </tbody>
        </table>

        <div class="col-12 text-center">
          <div class="block-27">
            <ul>
              <li @click="prev()" v-if="startPage>1"><a>&lt;</a></li>
              <li @click="pageChange(i)" v-for="i in range(startPage,endPage)" :class="i===page? 'active cursor-pointer':'cursor-pointer'"><a>{{i}}</a></li>
              <li @click="next()" v-if="endPage<totalpage"><a>&gt;</a></li>
            </ul>
          </div>
        </div>
      </div>

      <section
        class="row justify-content-center align-items-center"
        style="background-color: rgba(0, 0, 0, 0.1); z-index: 999; width: 100vw; height: 100vh; position: fixed; left: 0; top: 0; display:none;"
        id="showBox"
        @click="hideBox()">
        <div class="container rounded-0" style="width: 960px; background-color: white;" @click.stop>
          <div class="row justify-content-center">
            <p class="col-12 p-3 mb-2" style="font-size: 16px; color: white; font-weight: 500; line-height: 16px; background-color: #3f5277;">
              {{dvo.subject}}
            </p>
          </div>
          <div width="100%">
            <div style="min-height:300px; max-height:500px; width:100%; overflow:auto; white-space:pre-wrap; word-wrap:break-word;" v-html="dvo.content" class="html-content">
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</section>
<script>
const boardListApp = Vue.createApp({
  data() {
    return {
      type: 1,
      page: 1,
      list: [],
      totalpage: 0,
      startPage: 0,
      endPage: 0,
      fd: 'subject',
      ss: '',
      selected: [],
      dvo: {}
    }
  },
  mounted() {
    this.renderData()
  },
  methods: {
    boardDetailData(i) {
      axios.get("../admin/board_detail_vue.do", {
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
      $("#showBox").hide();
    },
    showBox() {
      $("#showBox").show();
    },
    deleteSelected() {
      if (this.selected.length === 0) {
        return alert("삭제할 항목을 선택하세요")
      }
      axios.post("../board/deleteMultiple.do", this.selected)
        .then(res => {
          this.selected = []
          this.renderData();
        })
        .catch(err => {
          console.error(err)
        })
    },
    toggleAll(e) {
      if (e.target.checked) {
        this.selected = this.list.map(vo => vo.no)
      } else {
        this.selected = []
      }
    },
    boardDel(no) {
      axios.post("../board/delete.do", null, {
        params: {
          no: no
        }
      })
        .then(res => {
          this.renderData()
        })
        .catch(err => {
          console.log(err)
        })
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
      axios.get("../admin/board_list_vue.do", {
        params: {
          type: this.type,
          page: this.page,
          ss: this.ss,
          fd: this.fd
        }
      })
        .then(res => {
          console.log(res.data)
          this.list = res.data.list
          this.totalpage = res.data.totalpage
          this.startPage = res.data.startPage
          this.endPage = res.data.endPage
        })
        .catch(err => {
          console.log(err.response)
        })
    }
  }
}).mount("#boardListApp")
</script>
</body>
</html>
