<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
	<section class="ftco-section ftco-degree-bg" id="app" style="margin-left: 20px;width:800px">
      <div class="container">
        <div class="row shadow r-12 secb py-3 px-3">
          <div class="col-lg-12">
            <!---->
            <div
              class="row mb-5 justify-content-between align-items-center bb-3"
            >
              <h3>예약하기</h3>
              <div>
                <span style="font-weight: 700">예약정보</span> > 예약완료
              </div>
            </div>
            <!---->
            <!--테이블 시작-->
            <div class="row mb-3">
              <h4 class="col-12">예약정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      예약구분
                    </th>
                    <td width="80%" style="color: red">[렌터카] 확정예약</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      차량명
                    </th>
                    <td width="80%">${cvo.name}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      차량정보
                    </th>
                    <td width="80%">${cvo.car_class}ㆍ${cvo.seat}인승ㆍ${cvo.fuel}ㆍ자동</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      기간
                    </th>
                    <td width="80%">
                    	<fmt:formatDate value="${crvo.pickup_date}" pattern="yyyy-MM-dd HH:mm" /> ~ 
                    	<fmt:formatDate value="${crvo.return_date}" pattern="yyyy-MM-dd HH:mm" />
                    	&nbsp;&nbsp;&nbsp;{{timeInterval}}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      보험
                    </th>
                    <td width="80%">{{ins_kind}}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      운전자격
                    </th>
                    <td width="80%">{{ins_qual_print}}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      보험설명
                    </th>
                    <td width="80%">{{ins_desc_print}}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      차량옵션
                    </th>
                    <td width="80%">${fn:substring(cvo.detail_option, 7, fn:length(cvo.detail_option))}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      무료 취소 기간
                    </th>
                    <td width="80%">7일전</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      추가할인
                    </th>
                    <td width="80%"></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--테이블 끝-->
            <!--할인 테이블-->
            <div class="row mb-3">
              <h4 class="col-12">할인/포인트</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      쿠폰 할인
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="20"
                        value="0"
                      />
                      <p style="float: left; padding-left: 10px;" class="py-1">
                        원 사용가능쿠폰:<span style="color: #34c0e7">0장</span>
                      </p>
                       <input
                    type="button"
                    value="쿠폰"
                    class="btn btn-primary ml-2"
                    style="border-radius: 6px;"
                 	/>
                       
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      포인트
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="20"
                        value="0"
                      />
                      <p style="float: left; padding-left: 10px" class="py-1">
                        P 사용 보유포인트(<span style="color: #34c0e7">0</span>)
                      </p>
                      <input
	                    type="button"
	                    value="모두 사용"
	                    class="btn btn-primary ml-2"
	                    style="border-radius:6px"
	                  />
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--할인테이블 끝-->
            <!--결제정보 시작-->
            <div class="row mb-3">
              <h4 class="col-12">결제정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      결제 금액
                    </th>
                    <td width="80%">{{price.toLocaleString()}}원</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      쿠폰 할인
                    </th>
                    <td width="80%">-0원</td>
                  </tr>

                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      포인트
                    </th>
                    <td width="80%">-0원</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="text-right">
                      총 결제금액 &nbsp;
                      <span
                        style="font-weight: 700; font-size: 24px; color: black"
                        >{{price.toLocaleString()}}원</span
                      >
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--결제정보 끝-->
            <!--예약자 정보 시작-->
            <div class="row mb-3">
              <h4 class="col-3">예약자 정보</h4>
              <table class="table" style="border-top: 3px solid gray">
                <tbody>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      예약자명
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="${sessionScope.name }"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      이메일
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="${mvo.email }"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      휴대폰 번호
                    </th>
                    <td width="80%">
                      <input
                        type="text"
                        style="float: left"
                        size="50"
                        value="${mvo.phone }"
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--예약자 정보 끝-->
            <div class="row justify-content-center">
              <div class="form-group m-2">
                <div class="form-field">
                  <input
                    type="button"
                    value="목록"
                    class="form-control r-12 btn btn-info"
                    @click="home()"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<script>
let listApp=Vue.createApp({
	data(){
		return {
			  pudate:'${pudate}',
			  putime:'${putime}',
			  rdate:'${rdate}',
			  rtime:'${rtime}',
			  nor_ins_desc:'${cvo.normal_ins_desc}'.split('-'),
			  pre_ins_desc:'${cvo.premium_ins_desc}'.split('-'),
			  non_ins_qual:'${cvo.non_ins_qual}',
			  normal_ins_qual:'${cvo.normal_ins_qual}',
			  premium_ins_qual:'${cvo.premium_ins_qual}',
			  ins:Number('${crvo.ins}'),
			  puDateObject:new Date('<fmt:formatDate value="${crvo.pickup_date}" pattern="yyyy-MM-dd HH:mm" />'),
			  rDateObject:new Date('<fmt:formatDate value="${crvo.return_date}" pattern="yyyy-MM-dd HH:mm" />'),
			  price:Number('${crvo.price}')  
		}
	},
	mounted(){
		console.log(this.puDateObject)
	},
	computed:{
		timeInterval(){
			const diffMs = this.rDateObject - this.puDateObject
			const diffHours = Math.floor(diffMs / ((1000 * 60 * 60))%24);
			const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));
			  
			const str = diffDays + '일 ' + diffHours + '시간'
			return str
		},
		ins_kind(){
			  const inss = ["","자차면책 가입 안함","일반자차","고급자차"]
			  return inss[this.ins]
		},
		ins_qual_print(){
			const quals = ["",this.non_ins_qual,this.normal_ins_qual,this.premium_ins_qual]
			return quals[this.ins]
		},
		ins_desc_print(){
			const descs = [[],[],this.nor_ins_desc,this.pre_ins_desc]
			return descs[this.ins].join(",").substring(1)
		}
	},
	methods:{
		home(){
			history.back()
		},
	},
	components:{
	}
}).mount("#app")

</script>
</body>
</html>