<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#sub:hover{
		text-decoration:underline
	}
</style>
</head>
<body>
	<div class="w-100 shadow r-12 secb ml-3 p-3" style="min-height:300px" id="noticeApp">
	<h3>공지사항</h3>
	<table class="table">
		<thead>
			<tr>
				<th width="70%">제목</th>
				<th width="30%" class="text-center">작성일</th>
			</tr>
		</thead>
		<tbody>
		<tr v-for="(vo,key) in list" :key="key">
			<td width="60%" @click="router(vo.no)" class="py-4 cursor-pointer" id="sub" style="color:black; font-weight:700">{{vo.subject}}</td>
			<td width="20%" class="text-center py-4">{{vo.dbday }}</td>
		</tr>
		</tbody>
	</table>
	<div class="text-center">
	<input v-if="page>1" type="button" @click="prev()" class="btn btn-primary r-12" value="이전"/>
	{{page}} page / {{totalpage}} pages
	<input v-if="page<totalpage" type="button" @click="next()" class="btn btn-primary r-12" value="다음"/>
	</div>
	</div>
<script>
	const noticeApp = Vue.createApp({
		data(){
			return{
				list:[],
				page:1,
				totalpage:0
			}
		},
		mounted(){
			this.renderData()
		},
		methods:{
			router(i){
				location.href="../customer/notice_detail.do?no="+i
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