package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.AirService;
import com.sist.vo.air.AirLinesVO;
import com.sist.vo.air.AirportsVO;

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
}
