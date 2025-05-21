<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Calendar Test</title>
  <link
      href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Abril+Fatface"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search"
    />

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css" />
    <link rel="stylesheet" href="../css/animate.css" />

    <link rel="stylesheet" href="../css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="../css/magnific-popup.css" />

    <link rel="stylesheet" href="../css/aos.css" />

    <link rel="stylesheet" href="../css/ionicons.min.css" />

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="../css/jquery.timepicker.css" />

    <link rel="stylesheet" href="../css/flaticon.css" />
    <link rel="stylesheet" href="../css/icomoon.css" />
    <link rel="stylesheet" href="../css/style.css" />
  <style type="text/css">
	
	.calendar {
      max-width: 400px;
      margin: 50px auto;
      font-family: sans-serif;
    }
    .calendar-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }
    .calendar-header button {
      background: none;
      border: 1px solid #666;
      padding: 5px 10px;
      cursor: pointer;
    }
    .calendar-header h2 {
      margin: 0;
      font-size: 1.2rem;
    }
    .weekdays, .days {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
    }
    .weekdays div, .days div {
      text-align: center;
      padding: 8px 0;
    }
    .disabled-day {
    color: gray !important;
    pointer-events: none; /* 클릭 시 동작 막기 */
  }
   .days div {
    color: black;       /* 평일 기본 검정 */
  }
  .weekend {            
    color: #e33;        /* 주말(일·토)만 빨간 */
  }
  .other-month {       
    color: gray !important;  
  }
  .today {
    background: #4285f4;
    color: #fff;
    border-radius: 50%;
  }
  .disabled-day {
    pointer-events: none;
  }
 	.weekdays .sunday { color: red; }
  .weekdays .saturday { color: blue; }

  /* 날짜 셀 */
  .days .sunday { color: red; }
  .days .saturday { color: blue; }

  /* 이전/다음 달, 비활성, 오늘 등 기존 스타일 */
  .other-month { color: gray !important; }
  .disabled-day { color: gray !important; pointer-events: none; }
  .today { background: #4285f4; color: #fff; border-radius: 50%; }
  
    .weekdays div { font-weight: bold; }
    .days div { border: 1px solid #eee; }
    .other-month { color: #bbb; }
    .today { background: #4285f4; color: #fff; border-radius: 50%; }
    .weekend { color: #e33; }
    
    </style>
</head>
<body>
 <!-- 달력 -->
  <div class="calendar">
    <div class="calendar-header">
      <button id="prevBtn">&lt;</button>
      <h2 id="yearMonth"></h2>
      <button id="nextBtn">&gt;</button>
    </div>
    <div class="weekdays" id="weekdays"></div>
    <div class="days" id="days"></div>
  </div>

    <script>
    (function(){
    	  console.log('🏁 달력 스크립트 시작');
    	  const $ = s => document.querySelector(s);
    	  const WEEKDAYS = ['일','월','화','수','목','금','토'];
    	  let current = new Date();

    	  function initWeekdays(){
    	    $('#weekdays').innerHTML = WEEKDAYS
    	      .map((d,i) => {
    	        const cls = i === 0
    	          ? 'sunday'
    	          : i === 6
    	            ? 'saturday'
    	            : '';
    	        return `<div class="${cls}">${d}</div>`;
    	      })
    	      .join('');
    	  }

    	  function render(){
    	    const year     = current.getFullYear();
    	    const month    = current.getMonth();
    	    const today    = new Date();
    	    today.setHours(0,0,0,0);

    	    $('#yearMonth').textContent = `${year}년 ${month+1}월`;

    	    const firstDay = new Date(year, month, 1).getDay();
    	    const lastDate = new Date(year, month+1, 0).getDate();
    	    const prevLast = new Date(year, month, 0).getDate();
    	    
    	    console.log({ year, month, firstDay, lastDate, prevLast });

    	    const cells = [];
    	    // 이전달 꼬리
    	    for(let i = firstDay - 1; i >= 0; i--){
    	      cells.push({ num: prevLast - i, other: true });
    	    }
    	    // 이번달 본문
    	    for(let d = 1; d <= lastDate; d++){
    	      cells.push({ num: d, other: false });
    	    }
    	    // 다음달 머리
    	    while(cells.length % 7){
    	      cells.push({ num: cells.length - firstDay - lastDate + 1, other: true });
    	    }
    	    
    	    console.log('▶ cells.length =', cells.length);

    	    $('#days').innerHTML = cells.map((c, idx) => {
    	      const classes = [];
    	      if(c.other){
    	        // 이전/다음 달 날짜는 weekend 색 제외
    	        classes.push('other-month','disabled-day');
    	      } else {
    	        const cellDate = new Date(year, month, c.num);
    	        if(cellDate < today)                     classes.push('disabled-day');
    	        if(cellDate.getTime() === today.getTime()) classes.push('today');
    	        // 이번달만 Sunday/Saturday 스타일
    	        if(idx % 7 === 0)      classes.push('sunday');
    	        else if(idx % 7 === 6) classes.push('saturday');
    	      }
    	      return `<div class="${classes.join(' ')}">${c.num}</div>`;
    	    }).join('');
    	  }

    	  $('#prevBtn').addEventListener('click', ()=>{
    		console.log('prevBtn:', $('#prevBtn'));
    	    current.setMonth(current.getMonth() - 1);
    	    render();
    	  });
    	  $('#nextBtn').addEventListener('click', ()=>{
    		console.log('nextBtn:', $('#nextBtn'));
    	    current.setMonth(current.getMonth() + 1);
    	    render();
    	  });
    	  
    	  initWeekdays();
    	  render();
    	  
    	})();

      //달력 자바스크립트
    </script>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.waypoints.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script src="../js/scrollax.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>