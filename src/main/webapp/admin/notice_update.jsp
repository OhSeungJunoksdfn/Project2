<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="d-flex ftco-animate justify-content-center align-items-center " id="noticeApp" >
  	<form action="../admin/notice_update_ok.do" ></form>
    <div class="container secb rounded-0 shadow py-2 " style="background-color:#fefefe">
      <h3 class="mb-0" >공지사항 수정</h3>
      <div class="row p-3">
        <!-- 제목, 유형 -->
        <div class="input-group mb-2">
          <input type="text" class="col-12 form-control" v-model="subject"   required/>
        </div>
		<div class="col-12 px-0">
			<textarea style="width:100%; height: 500px;  resize:none" v-model="content"></textarea>
		</div>
    
        <!-- 버튼 -->
        <div class="col-12 text-right px-0">
          <button type="button" @click="updateOk()" class="btn btn-primary rounded-0">수정하기</button>
          <a href="../admin/notice.do"
             class="btn btn-info bg-white text-dark rounded-0">취소</a>
        </div>
      </div>
    </div>
  
</section>
<script>
	const noticeApp=Vue.createApp({
		data(){
			return{
				subject:`${vo.subject}`,
				content:`${vo.content}`,
				no:${vo.no}
			}
		},
		methods:{
			updateOk(){
				axios.post("../admin/notice_update_ok.do",null,{
					params:{
						subject:this.subject,
						content:this.content,
						no:this.no
					}
				})
				.then(res => {
					location.href="../admin/notice.do"
				})
				.catch(err => {
					console.log(err.response)
				})
			}
		}
	}).mount("#noticeApp")
	
</script>
</body>
</html>