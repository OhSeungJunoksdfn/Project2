package com.sist.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.AirService;
import com.sist.vo.air.*;

@Controller
@RequestMapping("air/")
public class AirController {
    @Autowired
    private AirService service;

    /** 검색 화면 열기 (JSP) */
    @GetMapping("air_list.do")
    public String air_list(Model model) {
        // 검색폼에 사용할 드롭다운 데이터
        List<AirLinesVO> airlines = service.getAllAirlines();
        List<AirportsVO> airports = service.getAllAirports();
        model.addAttribute("airlines", airlines);
        model.addAttribute("airports", airports);

        // 실제 jsp 위치를 메인 레이아웃에 전달
        model.addAttribute("main_jsp", "../air/air_list.jsp");
        return "main/main";  
    }
    
    @GetMapping("air_list_arr.do")
    public String inbound(
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam String departureDate,
            @RequestParam String returnDate,
            @RequestParam int adults,
            @RequestParam int children,
            Model model) {

        // 드롭다운 데이터
        List<AirLinesVO> airlines = service.getAllAirlines();
        List<AirportsVO> airports = service.getAllAirports();
        model.addAttribute("airlines", airlines);
        model.addAttribute("airports", airports);

        // **검색 기준 파라미터**도 모델에 담기
        model.addAttribute("from",          from);
        model.addAttribute("to",            to);
        model.addAttribute("departureDate", departureDate);
        model.addAttribute("returnDate",    returnDate);
        model.addAttribute("adults",    adults);
        model.addAttribute("children", children);
        model.addAttribute("main_jsp", "../air/air_list_arr.jsp");
        return "main/main";  
    }


    /** 예약 확정 후 → 승객 정보 입력 페이지로 이동 */

    	@GetMapping("passengers_info.do")
    	public String passenger_info(
           @RequestParam("flightId")    int   flightId,
           @RequestParam("adults")      int   adults,
           @RequestParam("children")    int   children,
           @RequestParam("adultSeats")  String adultSeatsCsv,
           @RequestParam("childSeats")  String childSeatsCsv,
           Model model) {

        // ▶ 1) booking 테이블에 헤더 INSERT (리턴된 bookingId 로 아래 조회)
       int bookingId = service.createBooking(flightId, adults, children);

        // ▶ 2) 좌석별로 insert (comma 구분된 스트링을 split)
       List<String> adultSeats = Arrays.asList(adultSeatsCsv.split(","));
       List<String> childSeats = Arrays.asList(childSeatsCsv.split(","));
        BookingVO booking = service.getBookingById(bookingId);
        model.addAttribute("booking", booking);

        // 2) 해당 예약 좌석 목록 조회
        List<FlightSeatVO> bookedSeats = service.getSeatsByBookingId(bookingId);
        model.addAttribute("seats", bookedSeats);

        model.addAttribute("main_jsp", "../air/passengers_info.jsp");
        return "main/main";
    }

    /** 4) 승객 목록 화면 */
    @GetMapping("passenger_list.do")
    public String passenger_list(Model model) {
        model.addAttribute("passengers", service.getAllPassengers());
        model.addAttribute("main_jsp", "../air/passenger_list.jsp");
        return "main/main";
    }

    /** 5) 승객 삭제 후 목록으로 리다이렉트 */
    @PostMapping("passenger_delete.do")
    public String passenger_delete(@RequestParam("id") String passengerId) {
        service.deletePassenger(passengerId);
        return "redirect:/air/passenger_list.do";
    }
    
    /** 특정 항공편 좌석맵 조회 */
    @GetMapping("seat_map.do")
    public String seatMap(
    		@RequestParam(name="flightId", required=false) Integer flightId,
    		@RequestParam(name="adults",   required=false, defaultValue="1") Integer adults,
    		@RequestParam(name="children", required=false, defaultValue="0") Integer children,
            Model model) {
    	List<FlightSeatVO> fs = new ArrayList<>();
        if (flightId != null) {
            fs = service.getFlightSeats(flightId);
        }
        model.addAttribute("flightSeats", fs);
        model.addAttribute("flightId", flightId);
        model.addAttribute("adults",    adults);
        model.addAttribute("children",  children);
        model.addAttribute("main_jsp", "../air/seat_map.jsp");
        return "main/main";
    }
//
//    /** 좌석 예약 (flight_seat 삽입) */
//    @PostMapping("seat_book.do")
//    public String bookSeat(
//            @RequestParam int flightId,
//            @RequestParam int seatId,
//            @RequestParam(required=false) Integer bookingId) {
//        FlightSeatVO vo = new FlightSeatVO();
//        vo.setFlightId(flightId);
//        vo.setSeatId(seatId);
//        vo.setStatus("BOOKED");
//        vo.setBookingId(bookingId);
//        service.addFlightSeat(vo);
//        return "redirect:/air/seat_map.do?flightId=" + flightId;
//    }
//
//    /** 좌석 예약 취소 (flight_seat 삭제) */
//    @PostMapping("seat_cancel.do")
//    public String cancelSeat(
//            @RequestParam int flightId,
//            @RequestParam int seatId) {
//        service.deleteFlightSeat(flightId, seatId);
//        return "redirect:/air/seat_map.do?flightId=" + flightId;
//    }
//
//    /** 좌석 상태 변경 (예: AVAILABLE / HELD 등) */
//    @PostMapping("seat_status.do")
//    public String changeSeatStatus(
//            @RequestParam int flightId,
//            @RequestParam int seatId,
//            @RequestParam String status) {
//        service.updateFlightSeatStatus(flightId, seatId, status);
//        return "redirect:/air/seat_map.do?flightId=" + flightId;
//    }
//    
}
