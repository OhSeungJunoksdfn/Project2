package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.sist.service.AirService;
import com.sist.vo.air.*;

@RestController
@RequestMapping("air/")
public class AirRestController {
    @Autowired
    private AirService service;

    @GetMapping("/outbound.do")
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
    
    
}