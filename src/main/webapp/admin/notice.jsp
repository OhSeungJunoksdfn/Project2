<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container .table tr td{
		color:black !important
	}
	.container .table tr th{
		color:black !important
	}
</style>
</head>
<body>
<div class="container" id="noticeApp" style="position:relative">
	<div class="col-12 px-0 text-right my-2">
		<a href="../admin/notice_insert.do" type="button" class="btn btn-primary rounded-0">글쓰기</a>
	</div>
		<table class="table col-12 p-3">
		<thead class="bg-white">
		<tr class="text-black" style="color:black">
			<th width=10% class="text-center">번호</th>
			<th width=50% class="text-center" style="color:black" >제목</th>
			<th width="20%" class="text-center" style="color:black">작성일</th>
			<th width="20%"></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }" >
			<tr>
				<td class="text-center align-middle" class="text-center">${vo.no }</td>
				<td class="text-center align-middle cursor-pointer" @click="showBox()">${vo.subject }</td>
				<td class="text-center align-middle" class="text-center">${vo.dbday }</td>
				<td class="text-center align-middle">
					<input type="button" class="btn btn-warning rounded-0 mr-1"  value="수정"/>
					<input type="button" class="btn btn-danger rounded-0"  value="삭제"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	 <section
    	class="row justify-content-center align-items-center"
        style="
          background-color: rgba(0, 0, 0, 0.1);
          z-index: 999;
          width: 100vw;
          height: 100vh;
          position: fixed;
          left: 0;
          top: 0;
		  display:none;
        "
        id="showBox"
        @click="hideBox()"
      >
        <div
          class="container rounded-0"
          style="width: 800px; background-color: white;margin-bottom:300px"
          @click.stop
        >
          <div class="row justify-content-center">
            <p
              class="col-12 p-3 mb-2"
              style="
                font-size: 16px;
                color: white;
                font-weight: 500;
                line-height: 16px;
                background-color: #3f5277;
                
              "
            >
              제목
            </p>
          </div>
          <div width="100%">
          <div class="text-black" style="color:black;min-height:300px;">내용</div>
          </div>
        </div>
      </section>
</div>
<script>
	const noticeApp = Vue.createApp({
		data(){
			return{
			}	
		},
		methods:{
			hideBox(){
				$("#showBox").hide();
			},
			showBox(){
				$("#showBox").show();
			}
		}
	}).mount("#noticeApp")
</script>
</body>
</html>