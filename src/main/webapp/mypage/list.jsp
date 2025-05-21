<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w-100 shadow r-12 secb ml-3 p-3" style="min-height:300px" id="boardApp">
	<h3>작성글</h3>
	<table class="table">
		<thead>
			<tr>
				<th width="60%" class="text-center">제목</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="20%" class="text-center">댓글수</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="(vo,key) in list" :key="key" >
				<th width="60%"  ><a :href="'../board/detail.do?no='+vo.no">[{{vo.type}}] {{vo.subject}}</a></th>
				<td width="20%" class="text-center">{{vo.dbday}} </td>
				<td width="20%" class="text-center"  >{{vo.replycount}}</td>
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
				axios.get("../mypage/list_vue.do",{
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
	}).mount("#boardApp")
</script>
</body>
</html>