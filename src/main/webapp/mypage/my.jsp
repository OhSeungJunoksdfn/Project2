<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    				<th width="20%" rowspan=2>주소</th>
    				<td width="80%"class="input-group mb-2">
		                <input
		                  type="text"
		                  class="r-12 pl-2"
		                  style="height: 52px; border: 1px solid #ced4da; width: 100px"
		                  placeholder="우편번호"
		                  name="post"
						  ref="post"
						  v-model="post"
						  readonly
		                />
		                <input
		                  type="button"
		                  class="ml-2 borer-0 btn btn-primary px-2 r-12"
		                   @click="daum('#addrErr')"
		                  value="주소찾기"
		                />
    				</td>
    			</tr>
    			<tr>
    				<td width="80%"class="input-group">
	    				<input
		                  type="text"
		                  class="form-control r-12 col-9"
		                  placeholder="주소"
		                  name="addr1"
		                  ref="addr1"
		                  v-model="addr1"
		                  readonly
		                />
		                <input
		                  type="text"
		                  class="form-control r-12 col-3"
		                  placeholder="상세주소"
		                  name="addr2"
		                  ref="addr2"
		                  v-model="addr2"
		                />
    				</td>
    			</tr >
    			<tr>
    				<th width="20%">전화번호</th>
    				<td width="80%">{{vo.phone}}</td>
    			</tr>
    			<tr>
    				<th class="text-center" colspan="2" >소개</th>
    			</tr>
    			<tr>
    				<td colspan="2" >
    				<textarea
    					v-model="content"
    					ref="content"
    					class="r-12 p-2"
    					style="width:100%; height:200px; resize:none; border:1px solid #ced4da; "
    				>{{vo.content }}</textarea>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    				 <input
		                type="button"
		                class="form-control btn btn-primary r-12"
		                style="height: 52px"
		                value="수정완료"
		                @click="update()"
		              />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
						 <input
			                type="button"
			                class="form-control btn btn-info r-12"
			                style="height: 52px;"
			                value="회원탈퇴"
			                @click="del()"
			              />
					</td>
    			</tr>
    			
    		</tbody>
    	</table>
</section>
<script>
	const myApp=Vue.createApp({
		data(){
			return{
				vo:{},
				post:"",
				addr1:"",
				addr2:"",
				content:""
			}
		},
		mounted(){
			axios.get("../mypage/my_vue.do")
			.then(res => {
				this.vo=res.data
				this.post=res.data.post
				this.addr1=res.data.addr1
				this.addr2=res.data.addr2
				this.content=res.data.content
			})
			.catch(err => {
				console.error(err)
			})
		},
		methods:{
			update(){
				axios.post("../mypage/update_vue.do",null,{
					params:{
						post:this.post,
						addr1:this.addr1,
						addr2:this.addr2,
						content:this.content
					}
				})
				.then((res) => {
					if(res.data==="y"){
						alert("수정이 완료되었습니다.")
						window.location.href="../mypage/main.do"
					}
					else{
						alert("실패하였습니다.")
					}
				})
				.catch(err => {
					console.error(err)
				})
			},
			del(){
				if(confirm("회원탈퇴를 하시겠습니까?")){
					axios.post("../member/Delete_vue.do")
					.then(res => {
						if(res.data==="y"){
							alert("회원탈퇴되었습니다.")
							window.location.href="../member/logout.do"
						}
					})
				}else{
					alert("취소하셨습니다.")
				}
			},
			daum(el){
				const _this = this
				new daum.Postcode({
			        oncomplete: function(data) {
			            console.log(data.address)
			            _this.post=data.zonecode
			            _this.addr1=data.address
			        }
			    }).open();
			},
		}
	}).mount("#myApp")
</script>
</body>
</html>