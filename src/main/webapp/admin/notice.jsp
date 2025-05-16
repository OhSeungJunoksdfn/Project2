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
<div class="container" id="noticeApp" style="position:relative" id="noticeApp">
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
			<tr v-for="(vo,key) in list" :key="key">
				<td class="text-center align-middle" class="text-center">{{vo.no}}</td>
				<td class="text-center align-middle cursor-pointer" @click="noticeDetailData(vo.no)">{{vo.subject }}</td>
				<td class="text-center align-middle" class="text-center">{{vo.dbday }}</td>
				<td class="text-center align-middle">
					<input type="button" class="btn btn-warning rounded-0 mr-1" @click="routerUpdate(vo.no)"  value="수정"/>
					<input type="button" class="btn btn-danger rounded-0" @click="noticeDelete(vo.no)"  value="삭제"/>
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
          style="width: 960px; background-color: white;"
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
              {{dvo.subject}}
            </p>
          </div>
          <div width="100%">
          <pre  style="min-height:300px;max-height:500px; width:100%; 
          overflow:auto; white-space:pre-wrap; word-wrap:break-word; "
          >{{dvo.content}}
          </pre>
          </div>
        </div>
      </section>
</div>
<script>
	const noticeApp = Vue.createApp({
		data(){
			return{
				list:[],
				page:1,
				totalpage:0,
				dvo:{}
			}
		},
		mounted(){
			this.renderData()
		},
		methods:{
			routerUpdate(no){
				location.href="../admin/notice_update.do?no="+no;
				
			},
			noticeDelete(no){
				if(confirm("삭제하시겠습니까?")){
				axios.post("../admin/notice_delete.do",null,{
					params:{
						no
					}
				})
				.then((res) => {
					this.page=1
					this.renderData()
				})
				.catch(err => {
					console.log(err.response)
				})
				}
			},
			noticeDetailData(i){
				axios.get("../admin/notice_detail_vue.do",{
					params:{
						no:i
					}
				})
				.then(res => {
					this.dvo=res.data
					this.showBox()
				})
				.catch(err => {
					console.log(err.response)
				})
				
			},
			hideBox(){
				$("#showBox").hide();
			},
			showBox(){
				$("#showBox").show();
			},
			next(){
				this.page=this.page+1
				this.renderData()
			},
			prev(){
				this.page=this.page-1
				this.renderData()
			},
			renderData(){
				axios.get("../notice/list.do",{
					params:{
						page:this.page
					}
				})
				.then(res =>{
					this.list=res.data.list
					this.totalpage=res.data.totalpage
				})
			}
		}
	}).mount("#noticeApp")
</script>
</body>
</html>