<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.html-content img {
  max-width: 100%;
  height: auto;    
  display: block;  
}
</style>
</head>
<body>
<section
	  class="w-100"
      id="qnaApp"
    >
      <div class="container secb rounded-0 shadow py-2 bg-white" style="max-width:960px; width:100%">
        <div class="col-12 p-2">
     	  <h3>문의글</h3>
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
				<th width="60%" @click="qnaDetailData(vo.no)" class="cursor-pointer" >[{{vo.type}}] {{vo.subject}}</th>
				<td width="20%" class="text-center">{{vo.dbday}}</td>
				<td width="20%" class="text-center" >
					<a  :href="'../admin/qna_insert.do?no='+vo.no" v-if="vo.isok==='n'" class="btn btn-primary r-12"  >답변하기</a>
					<input type="button" value="답변수정" v-if="vo	.isok==='y'" class="btn btn-success r-12 "  />
				</td>
			</tr>
		</tbody>
	</table>
	<div class="col-12 text-center">
            <div class="block-27">
              <ul>
                <li @click="prev()" v-if="startPage>1" ><a>&lt;</a></li>
                <li @click="pageChange(i)" v-for="i in range(startPage,endPage)"  :class="i===page? 'active cursor-pointer':'cursor-pointer'"><a>{{i}}</a></li>
                <li @click="next()" v-if="endPage<totalpage"><a>&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
       </div>
       
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
    </section>
<script>
	const customerApp=Vue.createApp({
		data(){
			return{
				list:[],
				totalpage:0,
				startPage:0,
				endPage:0,
				page:1,
				dvo:{}
			}
		},
		mounted(){
			this.renderData()
		},
		methods:{
			qnaDetailData(i){
				axios.get("../admin/qna_detail_vue.do",{
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
				this.page=this.endPage+1
				this.renderData()
			},
			prev(){
				this.page=this.startPage-1
				this.renderData()
			},
			pageChange(i){
				this.page=i
				this.renderData()
			},
			range(start,end){
				let arr=[]
				let len=end-start
				for(let i = 0; i<=len; i++)
				{
					arr[i]=start
					start++
				}
				return arr
			},
			renderData(){
				axios.get("../admin/qna_list_vue.do",{
					params:{
						page:this.page
					}
				})
				.then(res => {
					this.list=res.data.list
					this.totalpage=res.data.totalpage
					this.startPage=res.data.startPage
					this.endPage=res.data.endPage
					console.log(res.data)
				})
				.catch(err => {
					console.error(err)
				})
			}
		}
	}).mount("#qnaApp")
</script>
</body>
</html>