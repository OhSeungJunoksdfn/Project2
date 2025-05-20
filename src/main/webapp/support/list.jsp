<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w-100 shadow r-12 secb ml-3 p-3" style="min-height:300px" id="customerApp">
	<h3>내 문의</h3>
	<table class="table">
		<thead>
			<tr>
				<th width="60%" class="text-center">제목</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="20%" class="text-center">답변</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="(vo,key) in list" :key="key" >
				<th width="80%"  ><a :href="'../customer/detail.do?no='+vo.no">[{{vo.type}}] {{vo.subject}}</a></th>
				<td width="20%" class="text-center">{{vo.dbday}} </td>
				<td width="20%" class="text-center"  >
					<input type="button" value="답변대기" v-if="vo.isok==='n'" class="btn btn-danger r-12" style="cursor:default;" />
					<input type="button" value="답변대기" v-if="vo.isok==='y'" class="btn btn-danger r-12" style="cursor:default;" />
				</td>
			</tr>
		</tbody>
	</table>
<script>
	const customerApp=Vue.createApp({
		data(){
			return{
				list:[],
				totalpage:0,
				startPage:0,
				endPage:0,
				page:1
			}
		},
		mounted(){
			this.renderData()
		},
		methods:{
			
			renderData(){
				axios.get("../customer/list_vue.do",{
					params:{
						page:this.page
					}
				})
				.then(res => {
					this.list=res.data.list
					this.totalpage=res.data.totalpage
					this.startPage=res.data.startPage
					this.endPage=res.data.endPage
				})
				.catch(err => {
					console.error(err)
				})
			}
		}
	}).mount("#customerApp")
</script>
</div>
</body>
</html>