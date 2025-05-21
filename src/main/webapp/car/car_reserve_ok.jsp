<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
  <div  style="margin-top: 50px;">
    <div 
    	style="
    	margin: 0px auto;
		width: 960px;
		display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 200px; 
    	"
    >
      <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 24 24" fill="#ff5e5e">
  		<circle cx="12" cy="12" r="10" fill="#4eb8d1"/>
  		<path fill="white" d="M10.0 14.5l-2.5-2.5L6 13.5l4 4 8-8-1.5-1.5z"/>
	  </svg>
    </div>
    <div></div>
    <div>
      <h3 class="text-center">예약이 완료 되었습니다.</h3>
    </div>
  </div>
  <div class="text-center my-5" id="app">
    <div class="row justify-content-center">
       <div class="form-group m-2">
          <div class="form-field">
             <input type="button" value="예약 상세보기" class="form-control r-12 btn btn-primary" @click="reserveDetail()"/>
          </div>
       </div>
       <div class="form-group m-2">
          <div class="form-field">
             <input type="button" value="홈으로" class="form-control r-12 btn btn-info" @click="home()"/>
          </div>
       </div>
    </div>
  </div>
  
  <script>
  let listApp=Vue.createApp({
		data(){
			return {
				  no:'${no}',
			}
		},
		mounted(){
			console.log(this.no)
		},
		computed:{
			
		},
		methods:{
			reserveDetail(){
				const form = document.createElement("form");
				form.method = "POST";
				form.action = "../car/car_reserve_detail.do";
	
				const inputReservationNo = document.createElement("input");
				inputReservationNo.type = "hidden";
				inputReservationNo.name = "reservation_no";
				inputReservationNo.value = this.no;
	
				form.appendChild(inputReservationNo);
				document.body.appendChild(form);
				
				form.submit();
			},
			home(){
				location.href="../main/main.do"
			}
		},
		components:{
		}
	}).mount("#app")
  </script>
</body>
</html>