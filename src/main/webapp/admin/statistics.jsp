<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
  @media (max-width: 768px) {
    .responsive-wrapper {
      padding: 0 20px !important;
    }
  }
</style>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<section class="w-100" id="statApp">
  <div style="padding: 0 50px; width: 100%; box-sizing: border-box;" class="responsive-wrapper">
    <div class="secb bg-white shadow-sm">

      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-area me-1"></i>
          월별 회원 가입수
        </div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
              <i class="fas fa-chart-pie me-1"></i>
              회원 성비
            </div>
            <div class="card-body">
              <canvas id="myPieChart" width="100%" height="50"></canvas>
            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
              <i class="fas fa-chart-bar me-1"></i>
              월 게시글 방문자 수
            </div>
            <div class="card-body">
              <canvas id="myBarChart" width="100%" height="50"></canvas>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script>
const dashApp = Vue.createApp({
  data() {
    return {
      months: [],
      cnts: [],
      max: 0,
      vo: {},
    }
  },
  mounted() {
    axios.get("../admin/statistics_vue.do")
      .then(res => {
        this.months = res.data.months
        this.cnts = res.data.cnts
        this.max = res.data.max
        this.vo = res.data.vo

        this.pie()
        this.area()
        this.bar()
      })
      .catch(err => {
        console.error(err)
      })
  },
  methods: {
    bar() {
      var ctx = document.getElementById("myBarChart");
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["자유글", "호텔", "관광지", "맛집", "렌트"],
          datasets: [{
            label: "방문자 수",
            backgroundColor: "#4eb8d1",
            borderColor: "#4eb8d1",
            data: [this.vo.free, this.vo.hotel, this.vo.travel, this.vo.food, this.vo.rental],
          }],
        },
        options: {
          scales: {
            xAxes: [{
              time: { unit: 'month' },
              gridLines: { display: false },
              ticks: { maxTicksLimit: 6 }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: this.vo.bMax,
                maxTicksLimit: 5
              },
              gridLines: { display: true }
            }],
          },
          legend: { display: false }
        }
      });
    },
    area() {
      var ctx = document.getElementById("myAreaChart");
      new Chart(ctx, {
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
              time: { unit: 'date' },
              gridLines: { display: false },
              ticks: { maxTicksLimit: 7 }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: this.max,
                maxTicksLimit: 5
              },
              gridLines: {
                color: "rgba(0, 0, 0, .125)"
              }
            }],
          },
          legend: { display: false }
        }
      });
    },
    pie() {
      var ctx = document.getElementById("myPieChart");
      new Chart(ctx, {
        type: 'pie',
        data: {
          labels: ["남성", "여성"],
          datasets: [{
            data: [this.vo.man, this.vo.woman],
            backgroundColor: ['#007bff', '#dc3545']
          }],
        }
      });
    }
  }
}).mount("#statApp")
</script>
</body>
</html>
