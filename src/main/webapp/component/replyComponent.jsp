<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="bno"  value="${param.no}"  />
<c:set var="type" value="${param.type}"/>
          <div class="col-12" id="replyApp">
 <h3 class="col-12 mb-5">{{replycount}} Comments</h3>
            <ul class="comment-list">
              <li v-for="(vo,key) in list"  :key="key" class="comment">
                <div :class="vo.group_tab===1?'comment-body pl-5':'comment-body'" style="float:left; width:100%">
                  <h3>{{vo.name}}</h3>
                  <div class="meta">{{vo.dbday}}</div>
                  <div>
                   <pre v-if="vo.editing===false">{{vo.msg}}</pre>
                   <div v-if="vo.editing===true" class="input-group" >
                   <input type=text v-model="tempMsg" class="form-control"  />
                   <input @click="replyUpdate(vo.no)" type="button" class="btn btn-primary rounded-0" value="수정" />
                   </div>
                  </div>
                  <p class="text-right">
                  <c:if test="${sessionScope.id!=null }">
                  <a v-if="vo.group_tab===0" @click="toggleReplyInput(key)" class="reply mr-1 cursor-pointer">댓글</a>
                  <a v-if="seid===vo.id" @click="toggleEditing(key)" class="reply-primary mr-1 cursor-pointer">{{vo.editText}}</a>
                  <a v-if="seid===vo.id" @click="replyDelete(vo.no)" class="reply-danger cursor-pointer">삭제</a>
                  </c:if>
                  </p>
                </div>
                <div class="container pt-2 px-0 input-group mb-3 insert" v-show="replyOpenIndex === key" >
		            <textarea
		              class="form-control"
		              placeholder="댓글입력"
		              aria-describedby="button-addon2"
		              style="
		                resize: none;
		                height: 100px !important;
		                border-radius: 12px 0 0 12px;
		              "
		              v-model="replyMsg"
		              ref="replyMsg"
		            ></textarea>
		            <button
		              class="replyBtn cursor-pointer"
		              style="border-radius: 0 12px 12px 0; height:100px"
		              @click="replyReplyInsert(vo.no)"
		            >
		              댓글
		            </button>
          		</div>
              </li>
            </ul>
          <c:if test="${sessionScope.id!=null }">
          
          <h3 class="ml-3">댓글입력</h3>
          <div class="container input-group mb-3">
            <textarea
              class="form-control"
              placeholder="댓글입력"
              aria-describedby="button-addon2"
              style="
                resize: none;
                height: 100px !important;
                border-radius: 12px 0 0 12px;
              "
              v-model="msg"
              ref="msg"
            ></textarea>
            <button
              class="replyBtn cursor-pointer"
              style="border-radius: 0 12px 12px 0; height:100px"
              @click="replySubmit()"
            >
              댓글
            </button>
          </div>
          </c:if>
          </div>
          
      <script>
      if (document.getElementById("replyApp")) {
    	const replyApp=Vue.createApp({
    		data(){
    			return{
    				no: Number(${bno}),
    				list:[],
    				msg:'',
    				replycount:${vo.replycount},
    				tempMsg:"",
    				replyMsg:"",
    				editingIndex: null, 
    				replyOpenIndex: null,
    				type:'${type}',
    				seid:'${sessionScope.id}'
    				
    			}
    		},
    		mounted(){
    			axios.get("../boardreply/list.do",{
    				params:{
    					type:this.type,
    					bno:this.no
    				}
    			})
    			.then(res => {
    				this.list = res.data
    			})
    			.catch(err => {
    				console.log(err.response)
    			})
    		},
    		methods:{
    			replyReplyInsert(no){
	    			axios.post("../boardreply/replyinsert.do",null,{
	    				params:{
	    					pno:no,
	    					msg:this.replyMsg,
	    					bno:this.no,
	    					type:this.type
	    				}
	    			})
	    			.then(res => {
	    				this.list=res.data.list
	    				this.replycount=res.data.replycount
	    				this.replyOpenIndex=null;
	    				this.replyMsg='';
	    			})
	    			.catch(err => {
	    				console.log(err.response)
	    			})
	    			
    			},
    			toggleReplyInput(index) {
    		        if (this.replyOpenIndex === index) {
    		            this.replyOpenIndex = null;
    		            this.replyMsg = '';
    		        } else {
    		            this.replyOpenIndex = index;
    		            this.replyMsg = '';
    		        }
    		    },
    			replyUpdate(no){
    				if(confirm("댓글을 수정하시겠습니까?")){
    				axios.post("../boardreply/update.do",null,{
    					params:{
    						no:no,
    						msg:this.tempMsg,
    						bno:this.no,
    						type:this.type
    					}
    				})
    				.then(res => {
    					this.list=res.data.list
    					this.replycount=res.data.replycount
    				})
    				.catch(err => {
    					console.log(err.response)
    				})
    				}
    				
    			},
    			toggleEditing(index) {
    			      // 모든 댓글의 isEditing을 false로 초기화
    			      this.list.forEach((item, i) => {
    			        if (i === index) {
    			          item.editing = !item.editing;
    			          item.editText = item.editing ? '취소' : '수정';
    			          
    			          // 수정 모드 진입 시 현재 메시지를 tempMsg에 저장
    			          if (item.editing) {
    			            this.tempMsg = item.msg;
    			          } else {
    			            this.tempMsg = '';
    			          }
    			        } else {
    			          item.editing = false;
    			          item.editText = '수정';
    			        }
    			      });
    			    },
    			replyDelete(no){
    				if(confirm("댓글을 삭제하시겠습니까?")){
    					axios.post("../boardreply/delete.do",null,{
    						params:{
    							no:no,
    							bno:this.no,
    							type:this.type
    						}
    					})
    					.then(res => {
    						this.list=res.data.list
        					this.replycount=res.data.replycount
    					})
    					.catch(err => {
    						console.log(err.response)
    					})
    				}
    			},
    			replySubmit(){
    				if(this.msg==="")
    				{
    					this.$refs.msg.focus()
    					return
    				}
    				axios.post("../boardreply/insert.do",null,{
    					params:{
    						msg:this.msg,
    						bno:this.no,
    						type:this.type
    					}
    				})
    				.then(res => {
    					this.list=res.data.list
    					this.replycount=res.data.replycount
    					this.msg=""
    				})
    				.catch(err => {
    					console.log(err.response)
    				})
    			},
    			boardDel(no){
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
    	}).mount('#replyApp')
      }
    </script>
</body>
</html>