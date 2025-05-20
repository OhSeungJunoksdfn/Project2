package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.sist.service.AirService;
import com.sist.vo.air.*;
/* REST < Vue.js용 */
@RestController
@RequestMapping("air/")
public class AirRestController {
    @Autowired
    private AirService service;

    @GetMapping("outbound.do")
    public Map<String,Object> flightlistVue(
            @RequestParam(required=false) Integer page,
            @RequestParam(required = false) String from,
            @RequestParam(required = false) String to,
            @RequestParam(required = false) String arrtime,
            @RequestParam(required = false) String deptime,
            @RequestParam(required = false) Integer travellers) {
        
        Map<String,Object> result = new HashMap<>();
        if (page == null || page < 1) {
            result.put("list",      Collections.emptyList());
            result.put("curpage",   0);
            result.put("totalpage", 0);
            result.put("startPage", 0);
            result.put("endPage",   0);
            return result;
        }

        int rowSize = 100;
        int start   = (page - 1) * rowSize + 1;
        int end     = page * rowSize;

        List<FlightInfoVO> list = service.getFlightsFiltered(
            page, rowSize, from, to, arrtime, deptime);
        int totalPage = service.getFlightsCountFiltered(from, to, arrtime, deptime);

        int BLOCK = 10;
        int startPage = ((page - 1) / BLOCK) * BLOCK + 1;
        int endPage   = Math.min(startPage + BLOCK - 1, totalPage);

        result.put("list",      list);
        result.put("curpage",   page);
        result.put("totalpage", totalPage);
        result.put("startPage", startPage);
        result.put("endPage",   endPage);
        return result;
    }

    /* 2) 편도(가는 편) 검색 + 페이징 */
    @GetMapping("list_vue.do")
    public Map<String,Object> outbound(
            @RequestParam int page,
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam String date,
            @RequestParam(required = false) Integer travellers) {
        
        Map<String,Object> result = new HashMap<>();
        int rowSize = 20;
        int listPage = page < 1 ? 1 : page;
        int start = (listPage - 1) * rowSize + 1;
        int end   = listPage * rowSize;

        List<FlightInfoVO> list = service.getOutbound(listPage, rowSize, from, to, date);
        int totalPage = service.getOutboundCount(from, to, date);

        result.put("list",      list);
        result.put("curpage",   listPage);
        result.put("totalpage", totalPage);
        return result;
    }

    /* 3) 왕복(오는 편) 검색 + 페이징 */
    @GetMapping("air_list_arr_vue.do")
    public Map<String,Object> inbound(
            @RequestParam int page,
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam String returnDate) {
        
        Map<String,Object> result = new HashMap<>();
        int rowSize = 20;
        int listPage = page < 1 ? 1 : page;
        int start = (listPage - 1) * rowSize + 1;
        int end   = listPage * rowSize;

        List<FlightInfoVO> list = service.getInbound(listPage, rowSize, from, to, returnDate);
        int totalPage = service.getInboundCount(from, to, returnDate);

        result.put("list",      list);
        result.put("curpage",   listPage);
        result.put("totalpage", totalPage);
        return result;
    }
    
    /* 4) 드롭다운용 항공사/공항 목록 (optional) */
    @GetMapping("/airlines.do")
    public List<AirLinesVO> airlines() {
        return service.getAllAirlines();
    }
    @GetMapping("/airports.do")
    public List<AirportsVO> airports() {
        return service.getAllAirports();
    }
    
    /** 7) 승객 등록 */
    @PostMapping("passengers")
    public ResponseEntity<?> createPassenger(@RequestBody PassengersVO p) {
        service.addPassenger(p);
        return ResponseEntity.status(HttpStatus.CREATED)
                             .body(Collections.singletonMap("status","ok"));
    }

    /** 8) 승객 목록 조회 */
    @GetMapping("passengers")
    public List<PassengersVO> listPassengers() {
        return service.getAllPassengers();
    }

    /** 9) 개별 승객 조회 */
    @GetMapping("passengers/{id}")
    public PassengersVO getPassenger(@PathVariable("id") String id) {
        return service.getPassengerById(id);
    }

    /** 10) 승객 수정 */
    @PutMapping("passengers/{id}")
    public ResponseEntity<?> updatePassenger(
            @PathVariable("id") String id,
            @RequestBody PassengersVO p) {
        p.setPassenger_id(id);
        int cnt = service.updatePassenger(p);
        return ResponseEntity.ok(Collections.singletonMap("updatedRows",cnt));
    }

    /** 11) 승객 삭제 */
    @DeleteMapping("passengers/{id}")
    public ResponseEntity<?> deletePassenger(@PathVariable("id") String id) {
        int cnt = service.deletePassenger(id);
        return ResponseEntity.ok(Collections.singletonMap("deletedRows",cnt));
    }
    
    /** 12) 좌석 전체 조회 */
    @GetMapping("seats")
    public List<SeatVO> apiGetAllSeats() {
        return service.getAllSeats();
    }

    /** 13) 단일 좌석 조회 */
    @GetMapping("seats/{seatId}")
    public ResponseEntity<SeatVO> apiGetSeatById(@PathVariable int seatId) {
        SeatVO seat = service.getSeatById(seatId);
        if (seat == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(seat);
    }

    /** 14) 특정 항공편 좌석 현황 조회 */
    @GetMapping("flightSeats")
    public List<FlightSeatVO> apiGetFlightSeats(@RequestParam int flightId) {
        return service.getFlightSeats(flightId);
    }
//
//    /** 15) 좌석 예약 (삽입) */
//    @PostMapping("flightSeats")
//    public ResponseEntity<?> apiBookSeat(@RequestBody FlightSeatVO vo) {
//        service.addFlightSeat(vo);
//        return ResponseEntity.status(HttpStatus.CREATED)
//                             .body(Collections.singletonMap("status","booked"));
//    }
//
//    /** 16) 예약 상태 변경 */
//    @PutMapping("flightSeats/{flightId}/{seatId}")
//    public ResponseEntity<?> apiUpdateSeatStatus(
//            @PathVariable int flightId,
//            @PathVariable int seatId,
//            @RequestBody Map<String,String> body) {
//        String status = body.get("status");
//        service.updateFlightSeatStatus(flightId, seatId, status);
//        return ResponseEntity.ok(Collections.singletonMap("status","updated"));
//    }
//
//    /** 17) 좌석 예약 취소 (삭제) */
//    @DeleteMapping("flightSeats/{flightId}/{seatId}")
//    public ResponseEntity<?> apiCancelSeat(
//            @PathVariable int flightId,
//            @PathVariable int seatId) {
//        service.deleteFlightSeat(flightId, seatId);
//        return ResponseEntity.ok(Collections.singletonMap("status","canceled"));
//    }
//    
    @PostMapping("seat_book_batch.do")
    public String bookSeatBatch(@RequestBody Map<String,Object> body) {
        // JSON body에서 꺼내기
        int flightId   = (int) body.get("flightId");
        @SuppressWarnings("unchecked")
        List<Integer> seatIds = (List<Integer>) body.get("seatIds");
        int adults     = (int) body.get("adults");
        int children   = (int) body.get("children");

        // 1) 예약 헤더 생성
        BookingVO bk = new BookingVO();
        bk.setFlightId(flightId);
        bk.setAdults(adults);
        bk.setChildren(children);
        int bookingId = service.createBooking(bk);

        // 2) 선택 좌석 일괄 저장
        List<FlightSeatVO> fsList = new ArrayList<>();
        for (Integer seatId : seatIds) {
            FlightSeatVO fs = new FlightSeatVO();
            fs.setFlightId(flightId);
            fs.setSeatId(seatId);
            fs.setStatus("BOOKED");
            fs.setBookingId(bookingId);
            fsList.add(fs);
        }
        service.addFlightSeatsBatch(flightId, fsList);

        // 3) 리다이렉트 URL 리턴
        return "/air/passenger_info.do?bookingId=" + bookingId
             + "&adults=" + adults
             + "&children=" + children;
    }
    
}