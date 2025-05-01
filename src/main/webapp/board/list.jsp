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
      class="d-flex justify-content-center m-5 "
      id="boardListApp"
    >
      <div class="container secb shadow py-2">
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
          <input type="button" value="글쓰기" class="btn btn-primary r-12" >
          </div>
          <table class="table">
            <thead>
              <tr class="text-center">
                <th width="50%" colspan="2">제목</th>
                <th width="20%">작성자</th>
                <th width="10%">작성일</th>
                <th width="10%">조회수</th>
                
              </tr>
            </thead>
            <tbody>
            <c:forEach var="vo" items="${list }">
              <tr>
                <td width="10%">${vo.no }</td>
                <td width="40%">
                  <a class="cursor-pointer" style="color: black">[${vo.type}] ${vo.subject }</a>
                </td>
                <td width="20%" class="text-center">${vo.name }</td>
                <td width="10%" class="text-center">${vo.dbday }</td>
                <td width="10%" class="text-center">${vo.hit }</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

          <div class="col-12 text-center">
            <div class="block-27">
              <ul>
              <c:if test="${startPage>1 }">
                <li><a href="#">&lt;</a></li>
              </c:if>
              
              	<c:forEach var="i" begin="${startPage }" end="${endPage }" >
                <li class="${i==curpage? 'active':'' }"><span>${i }</span></li>
              	</c:forEach>
                
                <c:if test="${endPage<totalpage }">
                <li><a href="#">&gt;</a></li>
                </c:if>
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
			type:${type}
		}
	},
	mounted(){
		console.log(this.type)
	},
	methods:{
		changeType(type){
			location.href="../board/list.do?type="+type
			console.log(this.type)
		}
	}
}).mount("#boardListApp")
</script>
</body>
</html>