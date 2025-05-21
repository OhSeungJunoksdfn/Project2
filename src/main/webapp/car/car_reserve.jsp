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
	<section class="ftco-section ftco-degree-bg" id="app">
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
                    <td width="80%">${vo.name}</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      차량정보
                    </th>
                    <td width="80%">${vo.car_class}ㆍ${vo.seat}인승ㆍ${vo.fuel}ㆍ자동</td>
                  </tr>
                  <tr>
                    <th
                      width="20%"
                      style="background-color: #e9e9e9; color: black"
                    >
                      기간
                    </th>
                    <td width="80%">{{pudate}}  {{putime}} ~ {{rdate}}  {{rtime}}&nbsp;&nbsp;&nbsp;{{timeInterval}}</td>
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
                    <td width="80%">${fn:substring(vo.detail_option, 7, fn:length(vo.detail_option))}</td>
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
                    <td width="80%">{{price}}원</td>
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
                        >{{price}}원</span
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
              <span class="col-9 text-right">
                <input type="checkbox" /> 예약자와 투숙자의 정보가 다를시 체크
              </span>
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
                    type="submit"
                    value="결제하기"
                    class="form-control r-12 btn btn-primary"
                    @click="payment()"
                  />
                </div>
              </div>
              <div class="form-group m-2">
                <div class="form-field">
                  <input
                    type="submit"
                    value="취소하기"
                    class="form-control r-12 btn btn-info"
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
			  nor_ins_desc:'${vo.normal_ins_desc}'.split('-'),
			  pre_ins_desc:'${vo.premium_ins_desc}'.split('-'),
			  non_ins_qual:'${vo.non_ins_qual}',
			  normal_ins_qual:'${vo.normal_ins_qual}',
			  premium_ins_qual:'${vo.premium_ins_qual}',
			  ins:Number('${ins}'),
			  puDateObject:new Date(`${pudate} ${putime}`),
			  rDateObject:new Date(`${rdate} ${rtime}`),
			  price:Number('${price}').toLocaleString()
		}
	},
	mounted(){
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
		payment(){
			// IMP 결제 라이브러리 초기화
		    IMP.init("imp06561258");  // ← 아임포트 식별코드로 교체하세요

		    // 결제 요청
		    IMP.onclose = function() {
			    console.log("예약처리")
			}
		    IMP.request_pay({
		        pg: "html5_inicis",  // PG사
		        pay_method: "card",
		        merchant_uid: 'order_' + new Date().getTime(), // 고유 주문번호
		        name: "{vo.name}" + " 예약", // 예약명
		        amount: this.price, // 결제 금액 (숫자)
		        buyer_email: "oksdfn@gmail.com",
		        buyer_name: "홍길동",
		        buyer_tel: "010-1111-2222",
		        buyer_addr: "",
		        buyer_postcode: ""
		    }, function (rsp) {
		        // 결제 후 콜백 함수
		        if (!rsp.success) {
		            console.log("결제 처리")
		            $.ajax({
		                type: "POST",
		                url: "../car/car_reserve_insert_vue.do",
		                data: {
		                    car_no: 5,//렌터카 pk
		                    user_name: "홍길동",
		                    user_phone: "010-1111-2222",
		                    user_email: "oksdfn@gmail.com",
		                    pudate:"06/15/2025",
							putime:"10:00",
							rdate:"06/16/2025",
							rtime:"10:00",
		                    price_total: 50000,
		                    ins_desc : "자차보험 설명",
		                    imp_uid: rsp.imp_uid,
		                    merchant_uid: rsp.merchant_uid,
		                    amount: rsp.paid_amount
		                },
		                success: function (reservationNo) {
		                    // ✅ DB에 INSERT 성공 → 예약 완료 페이지로 이동
		                    window.location.href = "../car/car_reserve_ok.do?reservationNo=" + reservationNo;
		                },
		                error: function () {
		                    alert("예약 저장 중 오류가 발생했습니다. 결제는 완료되었으므로 관리자에게 문의해주세요.");
		                }
		            });
		            
		        }
		    });
		},
		test(){
			console.log("adsfasdf")
		},
		dataRecv(){
			axios.get('../car/list_vue.do',{
    			params:{
    				page:this.curpage,
    				tabVal:this.tabVal
    			}
    		}).then(res=>{
    			console.log(res.data)
    			this.list=res.data.list
    			this.curpage=res.data.curpage
    			this.totalpage=res.data.totalpage
    			this.startPage=res.data.startPage
    			this.endPage=res.data.endPage
    			this.$nextTick(() => {
                    contentWayPoint()
               })
    		}).catch(error=>{
    			console.log(error.response)
    		})
		}
		
	},
	components:{
	}
}).mount("#app")

</script>
</body>
</html>