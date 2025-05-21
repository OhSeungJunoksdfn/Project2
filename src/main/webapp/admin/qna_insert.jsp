<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="d-flex ftco-animate justify-content-center align-items-center " id="qnaApp">
  <form id="postForm"
        method="post"
        action="../admin/qna_insert_ok.do"
        enctype="multipart/form-data"
        class="w-100"
        >
    <div class="container secb rounded-0 shadow py-2 " style="background-color:#fefefe">
      <h3 class="mb-0" >문의 답변하기</h3>
      <div class="row p-3">
        <!-- 제목, 유형 -->
        <table>
        	<tbody>
        		<tr>
        			<th>문의 제목</th>
        			<td>{{vo.content}}</td>
        		</tr>
        		<tr>
        			<th colspan="2">문의 내용</th>
        		</tr>
        		<tr>
        			<td colspan="2">
						<pre>{{vo.content}}</pre>
					</td>
        		</tr>
        	</tbody>
        </table>
		<div class="col-12 px-0">
			<textarea style="width:100%; margin:0; padding:0; height: 500px; resize:none" name="answer"></textarea>
		</div>
    	<input type="hidden" name="no" :value="no" > 
        <!-- 버튼 -->
        <div class="col-12 text-right px-0">
          <button type="submit" class="btn btn-primary rounded-0">글쓰기</button>
          <a href="../admin/qna.do"
             class="btn btn-info bg-white text-dark rounded-0">취소</a>
        </div>
      </div>
    </div>
  </form>
</section>
<script>
	const qnaApp=Vue.createApp({
		data(){
			return{
				vo:{},
				no:${no}
			}
		},
		mounted():{
			axios.get("../admin/qna_detail_vue.do",{
				params:{
					no:this.no
				}
			})
			.then(res => {
				this.vo=res.data
			})
			.catch(err => {
				console.log(err.response)
			})
		}
	}).mount("#qnaApp")
</script>
</body>
</html>