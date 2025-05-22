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
<section class="w-100" id="userListApp">
  <div style="padding: 0 50px; width: 100%; box-sizing: border-box;" class="responsive-wrapper">
    <div class="secb bg-white rounded-0 shadow-sm">

      <div class="col-12 p-2">
        <div class="d-flex justify-content-between align-items-end">
          <h3>회원 관리</h3>
          <p>전체 {{count}} 명</p>
        </div>

        <table class="table">
          <thead>
            <tr class="text-center">
              <th>유저 ID</th>
              <th>이름</th>
              <th>성별</th>
              <th>이메일</th>
              <th>회원가입일</th>
              <th>상태</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(vo,key) in list" :key="key">
              <td class="text-center">{{vo.id }}</td>
              <td>
                <a @click="userDetailData(vo.id)" class="cursor-pointer text-center"
                   style="font-weight:700;color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                  {{vo.name}}
                </a>
              </td>
              <td class="text-center">{{vo.sex }}</td>
              <td class="text-center">{{vo.email }}</td>
              <td class="text-center">{{vo.mday }}</td>
              <td class="text-center">{{vo.sdata }}</td>
              <td class="text-center">
                <input @click="memberSuspended(vo.id)" type="button" value="정지" class="btn btn-danger rounded-0">
                <input @click="memberActivate(vo.id)" type="button" value="해제" class="btn btn-success rounded-0">
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

    </div>
  </div>

  <section class="row justify-content-center align-items-center"
           style="background-color: rgba(0, 0, 0, 0.1); z-index: 999; width: 100vw; height: 100vh; position: fixed; left: 0; top: 0; display:none;"
           id="showBox"
           @click="hideBox()">
    <div class="container rounded-0" style="max-width: 960px; background-color: white;" @click.stop>
      <div class="row justify-content-center">
        <p class="col-12 p-3 mb-2" style="font-size: 16px; color: white; font-weight: 500; line-height: 16px; background-color: #3f5277;">
          {{dvo.subject}}
        </p>
      </div>
      <div width="100%">
        <div style="min-height:300px; max-height:500px; width:100%; overflow:auto; white-space:pre-wrap; word-wrap:break-word;"
             v-html="dvo.content"
             class="html-content">
        </div>
      </div>
    </div>
  </section>
</section>

<script>
const userListApp = Vue.createApp({
  data() {
    return {
      type: 1,
      page: 1,
      list: [],
      totalpage: 0,
      startPage: 0,
      endPage: 0,
      selected: [],
      dvo: {},
      count: 0
    }
  },
  mounted() {
    this.renderData()
  },
  methods: {
    memberActivate(id) {
      axios.post("../admin/member_Activate.do", null, { params: { id: id } })
        .then(() => {
          this.renderData()
        }).catch(err => console.error(err))
    },
    memberSuspended(id) {
      axios.post("../admin/member_Suspended.do", null, { params: { id: id } })
        .then(() => {
          this.renderData()
        }).catch(err => console.error(err))
    },
    userDetailData(i) {
      axios.get("../admin/member_detail_vue.do", { params: { no: i } })
        .then(res => {
          this.dvo = res.data
          this.showBox()
        })
        .catch(err => console.error(err.response))
    },
    hideBox() {
      $("#showBox").hide();
    },
    showBox() {
      $("#showBox").show();
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
      let arr = [], len = end - start
      for (let i = 0; i <= len; i++) arr[i] = start++
      return arr
    },
    renderData() {
      axios.get("../admin/user_list_vue.do", { params: { page: this.page } })
        .then(res => {
          this.list = res.data.list
          this.totalpage = res.data.totalpage
          this.startPage = res.data.startPage
          this.endPage = res.data.endPage
          this.count = res.data.count
        })
        .catch(err => console.error(err.response))
    }
  }
}).mount("#userListApp")
</script>
</body>
</html>
