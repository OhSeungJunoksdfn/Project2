package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.service.AirService;
import com.sist.vo.air.*;

@RestController
@RequestMapping("air/")
public class AirRestController {
    @Autowired
    private AirService service;

    @GetMapping("list_vue.do")
    public Map<String,Object> flightlistVue(
            @RequestParam Integer page,
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

        int rowSize = 12;
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
    @GetMapping("/outbound.do")
    public Map<String,Object> outbound(
            @RequestParam int page,
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam String date) {
        
        Map<String,Object> result = new HashMap<>();
        int rowSize = 12;
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
    @GetMapping("/inbound.do")
    public Map<String,Object> inbound(
            @RequestParam int page,
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam String returnDate) {
        
        Map<String,Object> result = new HashMap<>();
        int rowSize = 12;
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

    /* 4) 예약 저장 */
    @PostMapping("/reserve.do")
    public void reserve(@RequestBody ReservationsVO vo) {
        service.saveReservation(vo);
    }

    /* 5) 예약 내역 조회 (고객 이메일) */
    @GetMapping("/reservations.do")
    public List<ReservationsVO> reservations(@RequestParam String email) {
        return service.getReservationsByEmail(email);
    }

    /* 6) 드롭다운용 항공사/공항 목록 (optional) */
    @GetMapping("/airlines.do")
    public List<AirLinesVO> airlines() {
        return service.getAllAirlines();
    }
    @GetMapping("/airports.do")
    public List<AirportsVO> airports() {
        return service.getAllAirports();
    }
    
}