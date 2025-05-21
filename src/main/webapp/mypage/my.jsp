<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="container fecb shadow ml-2 py-2 r-12" id="myApp">
    	<h3>내 정보</h3>
    	<table class="table">
    		<tbody>
    			<tr>
    				<th width="20%">이름</th>
    				<td width="80%">{{vo.name}}</td>
    			</tr>
    			<tr>
    				<th width="20%">ID</th>
    				<td width="80%">{{vo.id}}</td>
    			</tr>
    			<tr>
    				<th width="20%">성별</th>
    				<td width="80%">{{vo.sex}}</td>
    			</tr>
    			<tr>
    				<th width="20%">생일</th>
    				<td width="80%">{{vo.birthday}}</td>
    			</tr>
    			<tr>
    				<th width="20%">우편번호</th>
    				<td width="80%">{{vo.post}}</td>
    			</tr>
    			<tr>
    				<th width="20%">주소</th>
    				<td width="80%">{{vo.addr1}}</td>
    			</tr>
    			<tr>
    				<th width="20%">상세주소</th>
    				<td width="80%">{{vo.addr2}}</td>
    			</tr>
    			<tr>
    				<th width="20%">전화번호</th>
    				<td width="80%">{{vo.phone}}</td>
    			</tr>
    			<tr>
    				<th class="text-center" colspan="2" >소개</th>
    			</tr>
    			<tr>
    				<td colspan="2" >
    				<pre>{{vo.content}}</pre>
    				</td>
    			</tr>
    		</tbody>
    	</table>
</section>
<script>
	const myApp=Vue.createApp({
		data(){
			return{
				vo:{}
			}
		},
		mounted(){
			axios.get("../mypage/my_vue.do")
			.then(res => {
				this.vo=res.data
			})
			.catch(err => {
				console.error(err)
			})
		},
		methods:{
			
		}
	}).mount("#myApp")
</script>
</body>
</html>