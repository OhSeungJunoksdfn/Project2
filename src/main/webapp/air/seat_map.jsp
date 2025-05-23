<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>좌석 선택</title>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
    }

    /* 전체 배경으로 비행기 좌석 이미지 */
    #seatMapContainer {
      position: relative;
      width: 800px;      /* 실제 이미지 크기에 맞춰 조정하세요 */
      height: 600px;     /* 실제 이미지 크기에 맞춰 조정하세요 */
      margin: 20px auto;
      background: url('${pageContext.request.contextPath}/images/seat.jpg') no-repeat center;
      background-size: contain;
    }

    /* 좌석 그리드: 이미지 위에 투명 그리드 레이어 */
    #seatGrid {
      position: absolute;
      /* inset: top right bottom left */
      inset: 60px  290px  29px  273px;
      0px;  /* 예시: 배경 이미지의 좌석 영역에 딱 맞추세요 */
      display: grid;
      gap: 8px;
	  
	  /* 3좌석 / 통로 / 3좌석 → 7열 */
	  grid-template-columns: 
	    40px  /* A열 */
	    40px  /* B열 */
	    40px  /* C열 */
	    60px  /* 통로 폭 */
	    40px  /* D열 */
	    40px  /* E열 */
	    40px; /* F열 */
	  
	  /* 행 높이는 좌석 정사각형을 위해 40px 고정 */
  	  grid-auto-rows: 40px;
	  
      /* A. 균등 분할: 6열 × 14행 */
      grid-template-columns: repeat(7, 1fr);
      grid-template-rows:    repeat(14, 1fr);

      /* ▶ B. 고정 크기 행을 쓰고 싶다면 아래 두 줄로 대체
      grid-template-columns: repeat(6, 1fr);
      grid-auto-rows: 40px;
      */
    }

    .seat {
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.8rem;
      border: 1px solid #ccc;
      user-select: none;
      transition: transform 0.2s, border-color 0.2s, background-color 0.2s;

      /* 수정: 애니메이션 효과를 위한 transition 추가 */
      transition: transform 0.2s, border-color 0.2s, background-color 0.2s;
    }
    .seat.available {
      /* 수정: 클릭 가능한 좌석임을 표시 */
      background: rgba(0, 128, 0, 0.2);
      cursor: pointer;
    }
    .seat.booked {
      /* 기존: 예약 불가 좌석 */
      background: rgba(255, 0, 0, 0.2);
      cursor: not-allowed;
    }
    .seat.selected-adult {
    background: rgba(0, 0, 255, 0.3);
    border-color: #00f;
    transform: scale(1.1);
  }
  .seat.selected-child {
    background: rgba(255, 223, 0, 0.5);
    border-color: #fc0;
    transform: scale(1.1);
  }

    /* 버튼은 투명하게, 클릭 영역만 남김 */
    .seat button {
      width: 100%;
      height: 100%;
      background: transparent;
      border: none;
      color: inherit;
      font-size: inherit;
      cursor: inherit;
    }
    
    /* 범례 박스 공통 스타일 */
.seat-legend .legend-box {
  display: inline-block;
  width: 16px;
  height: 16px;
  margin: 0 8px 0 4px;
  vertical-align: middle;
  border: 1px solid #aaa;
  text-align: center;  
}

/* 성인 선택 시 파란색 박스 */
.seat-legend .legend-box.adult {
  background-color: #8777ed;
}

/* 소아 선택 시 주황색 박스 */
.seat-legend .legend-box.child {
  background-color: #fc0;
}
  </style>
</head>
<body>

  <!-- 선택된 파라미터 표시 
  <div style="width:800px; margin:0 auto 20px; font-size:1.1rem;">
    <p>선택하신 항공편: <strong>${flightId}</strong></p>
    <p>성인: <strong>${adults}</strong>명, 소아: <strong>${children}</strong>명</p> </div> 
    -->
<!-- 좌석 색상 범례 -->
<div style="width:800px; margin:10px auto 20px; font-size:1.1rem; text-align:center;">
<div class="seat-legend">
  <span class="legend-box adult"></span> 성인 선택 좌석
  <span class="legend-box child"></span> 소아 선택 좌석
</div>
</div>
  <div id="seatMapContainer">
    <div id="seatGrid">
  <c:forEach var="row" begin="1" end="14">
    <!-- 왼쪽 A·B·C -->
    <c:forTokens items="A,B,C" delims="," var="col">
      <div class="seat
           ${empty statusMap[row][col] ? 'available' : fn:toLowerCase(statusMap[row][col])}">
        <!-- 버튼에 data-seat-id 심기 -->
        <button type="button"
                data-seat-id="${row}${col}"
                <c:if test="${statusMap[row][col]=='BOOKED'}">disabled</c:if>>
          ${col}${row}
        </button>
      </div>
    </c:forTokens>

    <!-- 가운데 통로 -->
    <div></div>

    <!-- 오른쪽 D·E·F -->
    <c:forTokens items="D,E,F" delims="," var="col">
      <div class="seat
           ${empty statusMap[row][col] ? 'available' : fn:toLowerCase(statusMap[row][col])}">
        <button type="button"
                data-seat-id="${row}${col}"
                <c:if test="${statusMap[row][col]=='BOOKED'}">disabled</c:if>>
          ${col}${row}
        </button>
      </div>
    </c:forTokens>
  </c:forEach>
    </div>
  </div>

    <!-- 예약 확정 버튼: 오른쪽 하단에 배치 -->
		<div style="width: 100%; display: flex; justify-content: flex-end; justify-content: center;">
		  <button id="confirmBooking"
		          style="padding: 12px 24px; font-size: 16px; background-color: #007bff; color: white; border: none; border-radius: 8px; cursor: pointer;">
		    좌석 확정
		  </button>
		</div>


  <!-- 수정: 클릭 시 좌석 하이라이트 및 선택 처리를 위한 스크립트 -->	
 
	<script>
	document.addEventListener('DOMContentLoaded', () => {
    // JSP 변수로 넘어온 성인·소아 수
    const flightId = ${flightId};
    const ADULT_MAX   = ${empty adults ? 0 : adults};
	const CHILD_MAX   = ${empty children ? 0 : children};
    let adultCount    = 0;
    let childCount    = 0;

    const grid = document.getElementById('seatGrid');
    grid.addEventListener('click', e => {
    	e.preventDefault();
      const seat = e.target.closest('.seat.available');
      if (!seat) return;

      // 이미 선택된 좌석을 다시 클릭하면 선택 해제
      if (seat.dataset.selectedType) {
        if (seat.dataset.selectedType === 'adult')  adultCount--;
        else                                         childCount--;
        seat.classList.remove('selected-adult', 'selected-child');
        delete seat.dataset.selectedType;
        return;
      }

      // 아직 성인 자리가 남아 있으면 우선 성인으로 선택
      if (adultCount < ADULT_MAX) {
        seat.classList.add('selected-adult');
        seat.dataset.selectedType = 'adult';
        adultCount++;
        return;
      }
      // 성인 자리가 다 찼으면 소아로
      if (childCount < CHILD_MAX) {
        seat.classList.add('selected-child');
        seat.dataset.selectedType = 'child';
        childCount++;
        return;
      }

      // 둘 다 꽉 찼다면 더 이상 선택 불가
      alert('모든 승객의 좌석을 선택했습니다.');
    });
    document.getElementById('confirmBooking').addEventListener('click', () => {
       // ▶ 성인/소아별로 나눠서 수집
       const adultButtons  = document.querySelectorAll('.seat[data-selected-type="adult"] button');
       const childButtons  = document.querySelectorAll('.seat[data-selected-type="child"] button');
       const adultSeats    = Array.from(adultButtons).map(btn => btn.dataset.seatId);
       const childSeats    = Array.from(childButtons).map(btn => btn.dataset.seatId);

       if (adultSeats.length + childSeats.length === 0) {
             alert("예약할 좌석을 선택해주세요.");
             return;
           }


      // ▶ 성인/소아 좌석을 구분해서 URL에 전달
      const params = new URLSearchParams({
        flightId: flightId,
        adults:   ADULT_MAX,
        children: CHILD_MAX
      });
      if (adultSeats.length) params.append('adultSeats', adultSeats.join(','));
      if (childSeats.length) params.append('childSeats', childSeats.join(','));
      
      window.location.href = '../air/passengers_info.do?' + params.toString();
      });
    });
  </script>
</body>
</html>