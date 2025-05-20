<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.container {
	text-align: center;
	min-width: 1400px;
}
</style>
</head>
<body>
<div class="container" id="hotelReserveApp">
  <div class="tab">
    <ul class="mainTab_nav">
      <li class="mainTab"><a href="#">항공권 예약 조회</a></li>
      <li class="mainTab"><a href="#">렌트카 예약 조회</a></li>
      <li class="mainTab" ><a href="../admin/hotel_reserve_list.do">호텔 예약 조회</a></li>
    </ul>
  </div>
   <br>
    <div class="row">
      <table class="table">
        <thead>
          <tr>
            <th>호텔명</th>
            <th>객실명</th>
            <th>계정</th>
            <th>예약자명</th>
            <th>예약자 이메일</th>
            <th>예약자 전화번호</th>
            <th>예약 인원</th>
            <th>총 금액</th>
            <th>예약일</th>
            <th>예약 상태</th>
            <th></th>
          </tr>
        </thead>
        <tbody v-for="vo in list">
          <tr>
            <td>{{vo.hotel_title}}</td>
            <td>{{vo.room_title}}</td>
            <td>{{vo.member_id}}</td>
            <td>{{vo.username}}</td>
            <td>{{vo.useremail}}</td>
            <td>{{vo.userphone}}</td>
            <td>{{vo.person}}</td>
            <td>{{vo.total_price}}</td>
            <td>{{vo.bookingDateStr}}</td>
            <td>{{vo.status}}</td>
            <td v-if="vo.status === '예약 진행 중'" style="padding: 8px;">
              <button type="button" class="btn btn-primary r-12" @click="confHotel(vo.no)">예약 확정</button>
            </td>
            <td v-if="vo.status === '예약 확정'" style="padding: 8px;">
              <a class="btn btn-default r-12" style="cursor: default;">확정 완료</a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="row mt-5">
       <div class="col text-center">
          <div class="block-27">
             <ul>
                <li class="cursor-pointer" v-if="startPage > 1"><span @click="prev()">&lt;</span></li>
                <li class="cursor-pointer" v-for="i in range(startPage, endPage)" :class="i === curpage?'active':''"><span @click="pageChange(i)">{{i}}</span></li>
                <li class="cursor-pointer" v-if="endPage < totalpage"><span @click="next()">&gt;</span></li>
              </ul>
          </div>
       </div>
    </div>
</div>
<script>
  let reserveApp=Vue.createApp({
	  data() {
		  return {
			  list: [],
			  curpage: 1,
			  startPage: 0,
			  endPage: 0,
			  totalpage: 0,
			  status: {},
		  	  no: 0
		  }
	  },
	  mounted() {
		  this.dataRecv()
	  },
	  methods: {
		  confHotel(no) {
			  console.log(no)
			  if(confirm("예약 확정 처리를 진행 하시겠습니까?") == true) 
			  {
				  axios.post('http://localhost:8080/admin/hotel_reserve_update_vue.do', null, {
					  params: {
						  no
					  }
				  }).then(res => {
					  alert("예약이 확정 되었습니다.")
					  this.curpage = page
  			  		  this.dataRecv()
				  }).catch(err => {
					  console.log(err.response)
				  })
			  }
			  else
			  {
				  return;
			  }
		  },
		  range(start, end) {
    			let arr = []
    			let len = end-start
    			for(let i=0; i<=len; i++)
    			{
    				arr[i] = start
    				start++
    			}
    			return arr
    	  },
		  pageChange(page) {
    			this.curpage = page
    			this.dataRecv()
    	  },
		  prev() {
				this.curpage = this.startPage-1
				this.dataRecv()
		  },
		  next() {
				this.curpage = this.endPage+1
				this.dataRecv()
		  },
		  dataRecv() {
			  axios.get('http://localhost:8080/admin/hotel_reserve_list_vue.do', {
				  params: {
					  page: this.curpage
				  }
			  }).then(res => {
				  console.log(res.data)
				  this.list = res.data.list
				  this.curpage = res.data.curpage
				  this.startPage = res.data.startPage
    			  this.endPage = res.data.endPage
			  }).catch(error => {
				  console.log(error.response)
			  })
		  }
	  }
  }).mount('#hotelReserveApp')
</script>
</body>
</html>