package com.sist.web;

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


    /** 3) 승객 입력 폼 화면 */
    @GetMapping("passenger_info.do")
    public String passenger_form(
            @RequestParam("flightId") int flightId,
            @RequestParam(value="id", required=false) String passengerId, Model model) {
        if (passengerId != null) {
            // 수정 모드일 때
            model.addAttribute("passenger", service.getPassengerById(passengerId));
        }
        model.addAttribute("flightId", flightId);
        model.addAttribute("main_jsp", "../air/passenger_info.jsp");
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
    
}
