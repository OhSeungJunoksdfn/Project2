<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  img {
    max-width: 100%;
    height: auto;
  }
</style>
</head>
<body>

<section
      class="d-flex ftco-animate justify-content-center align-items-center my-5"
      style="min-height: 100vh"
      
    >
      <div class="container secb shadow py-2">
        <div class="row p-2" id="detailApp">
          <h3 class="col-12">${vo.subject }</h3>
          <p class="col-12" style="color: black; font-weight: 600">${vo.name }</p>
          <div class="col-12 d-flex justify-content-between border-bottom">
            <p>${vo.dbday }</p>
          </div>
          <div class="border-bottom w-100 mt-2 mb-2">
            <div
            class="px-3"
              style="
                width: 100%;
                min-height: 500px;
                border: none;
              "
              
            >${vo.content }</div>
          </div>
          <div class="col-12 text-right mx-0">
          <c:if test="${sessionScope.id==vo.id }">
          	 <a
              href="../board/update.do?no=${vo.no }"
              class="btn btn-outline-warning r-12  text-dark"

            >수정</a>
             <a
              @click="boardDel(no)"
              class="btn btn-outline-danger r-12 cursor-pointer text-dark ml-2"

            >삭제</a>
          </c:if>
          <c:if test="${minNo<vo.no }">
            <a
              href="../board/detail.do?no=${prev}"
              class="btn btn-info r-12 bg-white text-dark ml-2"

            >이전</a>
          </c:if>
          <c:if test="${maxNo>vo.no }">
            <a
              href="../board/detail.do?no=${next }"
              class="btn btn-info r-12 bg-white text-dark ml-2"

            >다음</a>
          </c:if>
            <a href="../board/list.do" class="btn btn-primary r-12 ml-2"  >목록</a>
          </div>
        </div>
          <jsp:include page="../component/replyComponent.jsp">
			  <jsp:param name="no"   value="${vo.no}" />
			  <jsp:param name="type" value="board"/>
			</jsp:include>
      </div>
    </section>
    <script>
    	const detailApp=Vue.createApp({
    		data(){
    			return{
    				no: ${vo.no}
    			}
    		},
    		
    		methods:{
    			boardDel(no){
    				console.log(no)
    				if(confirm("삭제하시겠습니까?")){
    				axios.post('../board/delete.do',null,{
    					params:{
    						no:this.no
    					}
    				})
    				.then(res => {
    					console.log(res.data)
    					if(res.data==="yes")
    					{
    					location.href="../board/list.do"	
    					}
    					else
    					{
    						alert("실패했습니다.")
    					}
    				})
    				.catch(err => {
    					console.log(err.response)
    				})
    				}
    				else{
    					alert("취소하였습니다!")
    				}
    			}
    		}
    	}).mount('#detailApp')
    </script>
</body>
</html>