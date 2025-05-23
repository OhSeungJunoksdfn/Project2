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
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.4);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}
.modal-content {
  background-color: white;
  width: 100%;
  max-width: 960px;
  max-height: 80vh;
  overflow-y: auto;
  padding: 24px;
  border-radius: 4px;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
  position: relative;
}
.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #ddd;
  padding-bottom: 8px;
  margin-bottom: 16px;
}
.modal-header h5 {
  margin: 0;
  color: #007bff;
  font-weight: bold;
}
</style>
</head>
<body>
<section
	  class="w-100"
      id="boardListApp"
    >
      <div class="container secb rounded-0 shadow py-2 bg-white" style="max-width:960px; width:100%">
        <div class="col-12 p-2">
      	  <h3>게시글 관리</h3>   
          <table class="table">
            <thead>
              <tr class="text-center">
                <th width="10%">전체 <input type="checkbox" @change="toggleAll($event)" :checked="selected.length === list.length && list.length > 0"></th>
                <th width="40%" colspan="2">제목</th>
                <th width="20%">작성자</th>
                <th width="20%">작성일</th>
                <th width="10%">
                <input type="button" value="선택삭제" class="btn btn-danger rounded-0"  @click="deleteSelected()">
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(vo,key) in list" :key="key">
                <td width="10%" class="text-center">
                <input type="checkbox" v-model="selected" :value="vo.no" >
                </td>
                <td width="10%" class="text-center">{{vo.no }}</td>
                <td width="30%"><a @click="boardDetailData(vo.no)" class="cursor-pointer" 
                    style="font-weight:700;color:black;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;" 
                    >[{{vo.type}}] {{vo.subject }}</a></td>
                <td width="20%" class="text-center">{{vo.name }}</td>
                <td width="20%" class="text-center">{{vo.dbday }}</td>
                <td width="10%" class="text-center">
                <input @click="boardDel(vo.no)" type="button" value="삭제" class="btn btn-danger rounded-0">
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
      <div v-if="modalVisible" class="modal-overlay" @click="hideBox">
        <div class="modal-content" @click.stop>
          <div class="modal-header">
            <h5>{{ dvo.subject }}</h5>
            <button type="button" class="btn-close" aria-label="Close" @click="hideBox"></button>
          </div>
          <div v-html="dvo.content" class="html-content"></div>
        </div>
      </div>
    </section>
<script>
const boardListApp=Vue.createApp({
	data(){
		return{
			type:1,
			page:1,
			list:[],
			totalpage:0,
			startPage:0,
			endPage:0,
			fd:'subject',
			ss:'',
			selected: [],
			dvo:{},
      modalVisible: false
		}
	},
	mounted(){
		this.renderData()
	},
	methods:{
		boardDetailData(i){
			axios.get("../admin/board_detail_vue.do",{
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
			this.modalVisible = false;
		},
		showBox(){
			this.modalVisible = true;
		},
		deleteSelected() {
			if(this.selected.length===0){
				return alert("삭제할 항목을 선택하세요")
			}
			axios.post("../board/deleteMultiple.do",this.selected)
			.then(res => {
				this.selected = [];
				this.renderData();
			})
			.catch(err => {
				console.error(err)
			})
		},
		toggleAll(e){
			if(e.target.checked){
				this.selected = this.list.map(vo => vo.no)
			}
			else {
				this.selected= []
			}
		},
		boardDel(no){
			axios.post("../board/delete.do",null,{
				params:{
					no:no
				}
			})
			.then(res => {
				this.renderData()
			})
			.catch(err => {
				console.log(err)
			})
		},
		next(){
			this.page=endPage+1
			this.renderData()
		},
		prev(){
			this.page=startPage-1
			this.renderData()
		},
		pageChange(i){
			this.page=i
			this.renderData()
		},
		range(start,end){
			arr=[]
			len=end-start
			for(let i = 0; i<=len; i++)
			{
				arr[i]=start
				start++
			}
			return arr
		},
		renderData(){
			axios.get("../admin/board_list_vue.do",{
				params:{
					type:this.type,
					page:this.page,
					ss:this.ss,
					fd:this.fd
				}
			})
			.then(res => {
				console.log(res.data)
				this.list=res.data.list
				this.totalpage=res.data.totalpage
				this.startPage=res.data.startPage
				this.endPage=res.data.endPage
			})
			.catch(err => {
				console.log(err.response)
			})
		},
	}
}).mount("#boardListApp")
</script>
</body>
</html>
