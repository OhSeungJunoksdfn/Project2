<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
<section
	  class="w-100"
      id="dashApp"
    >
      <div class="container secb rounded-0 shadow py-2 bg-white" style="max-width:1280px; width:100%">
		
		<div class="row">
			<div class="col-md-6 mb-4">
               <div class="card border-left-primary shadow h-100 py-2">
                   <div class="card-body">
                       <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                   금일 게시글</div>
                               <div class="h5 mb-0 font-weight-bold text-gray-800">{{board}}</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas  fa-clipboard fa-2x text-gray-300"></i>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
		 <!-- Earnings (Annual) Card Example -->
            <div class="col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    항공 예매 매출</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{sales}} 원</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-won-sign fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tasks Card Example -->
            <div class="col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                    회원수</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{member}}</div>
                            </div>
                            <div class="col-auto">
                                 <i class="fas fa-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    새 문의</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{qna}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		

		<div class="card mb-4">
           <div class="card-header">
               <i class="fas fa-chart-area me-1"></i>
               월별 회원 가입수
           </div>
           <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
           
       </div>

       </div>
       
</section>


<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>

<script>
	const dashApp=Vue.createApp({
		data(){
			return{
				months:[],
				cnts:[],
				member:0,
				qna:0,
				sales:"",
				board:0,
				max:0
			}
		},
		mounted(){
			this.render()
			
		},
		methods:{
			render(){
				axios.get("../admin/main_vue.do")
				.then(res => {
					this.months=res.data.months
					this.cnts=res.data.cnts
					this.member=res.data.member
					this.qna=res.data.qna
					this.board=res.data.board
					this.sales=res.data.sales.toLocaleString()
					this.max=res.data.max
					
					this.area()
				})
				.catch(err => {
					console.error(err)
				})
				
			},
			area(){
				var ctx = document.getElementById("myAreaChart");
				var myLineChart = new Chart(ctx, {
				  type: 'line',
				  data: {
				    labels: this.months,
				    datasets: [{
				      label: "가입자",
				      lineTension: 0.3,
				      backgroundColor: "rgba(78, 184, 209,0.2)",
				      borderColor: "rgba(78, 184, 209)",
				      pointRadius: 5,
				      pointBackgroundColor: "rgba(120, 213, 239)",
				      pointBorderColor: "rgba(255,255,255,0.8)",
				      pointHoverRadius: 5,
				      pointHoverBackgroundColor: "rgba(120, 213, 239,1)",
				      pointHitRadius: 50,
				      pointBorderWidth: 2,
				      data: this.cnts,
				    }],
				  },
				  options: {
				    scales: {
				      xAxes: [{
				        time: {
				          unit: 'date'
				        },
				        gridLines: {
				          display: false
				        },
				        ticks: {
				          maxTicksLimit: 7
				        }
				      }],
				      yAxes: [{
				        ticks: {
				          min: 0,
				          max: this.max,
				          maxTicksLimit: 5
				        },
				        gridLines: {
				          color: "rgba(0, 0, 0, .125)",
				        }
				      }],
				    },
				    legend: {
				      display: false
				    }
				  }
				});
			}
			
		}
	}).mount("#dashApp")
</script>



</body>
</html>