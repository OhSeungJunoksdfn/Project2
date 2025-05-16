<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<section
      class="d-flex ftco-animate justify-content-center  "
      style="color:black"
      id="boardListApp"
    >
      <div class="container secb shadow py-2 bg-white" style="max-width:960px">
        <div class="row p-2">
        <div class="col-12 d-flex justify-content-between align-items-center">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a :class="type===1?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('1')" >전체</a>
            </li>
            <li class="nav-item">
              <a :class="type===2?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('2')">공지사항</a>
            </li>
            <li class="nav-item">
              <a :class="type===3?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('3')">자유글</a>
            </li>
            <li class="nav-item">
              <a :class="type===4?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('4')">호텔</a>
            </li>
            <li class="nav-item">
              <a :class="type===5?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('5')">관광지</a>
            </li>
            <li class="nav-item">
              <a :class="type===6?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('6')">맛집</a>
            </li>
            <li class="nav-item">
              <a :class="type===7?'tablink nav-link cursor-pointer active':'tablink nav-link cursor-pointer'" @click="changeType('7')" >렌트</a>
            </li>
          </ul>
          <a href="../admin/board_insert.do" class="btn btn-primary r-12" >글쓰기</a>
          </div>
          <table class="table">
            <thead>
              <tr class="text-center">
                <th width="50%" colspan="2">제목</th>
                <th width="30%">작성자</th>
                <th width="20%">작성일</th>
                
              </tr>
            </thead>
            <tbody>
              <tr v-for="(vo,key) in list" :key="key">
                <td width="10%" class="text-center">{{vo.no }}</td>
                <td width="40%">[{{vo.type}}] {{vo.subject }}</td>
                <td width="30%" class="text-center">{{vo.name }}</td>
                <td width="20%" class="text-center">{{vo.dbday }}</td>
              </tr>
            </tbody>
          </table>

          <div class="col-12 text-center">
            <div class="block-27">
              <ul>
                <li v-if="startPage>1" >&lt;</li>
                <li ></li>
                <li v-if="endPage<totalpage">&gt;</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
     
    </section>
<script>
const boardListApp=Vue.createApp({
	data(){
		return{
			type:1,
			page:1,
			list:[],
			totalpage:0,
			startPage:0,
			endPage:0,
			fd:'subject',
			ss:''
		}
	},
	mounted(){
		this.renderData()
	},
	methods:{
		range(){
			
		},
		renderData(){
			axios.get("../admin/board_list_vue.do",{
				params:{
					type:this.type,
					page:this.page,
					ss:this.ss,
					fd:this.fd
				}
			})
			.then(res => {
				console.log(res.data)
				this.list=res.data.list
				this.totalpage=res.data.totalpage
				this.startPage=res.data.startPage
				this.endPage=res.data.endPage
			})
			.catch(err => {
				console.log(err.response)
			})
			
		},
		
	}
}).mount("#boardListApp")
</script>
</body>
</html>