package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.AirService;
import com.sist.vo.air.FlightInfoVO;

@Controller
@RequestMapping("air/")
public class AirController {
    @Autowired
    private AirService service;
    
    @GetMapping("air_list.do")
    public String air_list(
            @RequestParam(defaultValue="1") int page,
            Model model) {
        
        int rowSize = 12;
        List<FlightInfoVO> list = 
            service.flightListData((page-1)*rowSize + 1, page*rowSize);
        int totalPage = service.flightTotalPage();
        

        model.addAttribute("list", list);
        model.addAttribute("curpage", page);
        model.addAttribute("totalpage", totalPage);
        model.addAttribute("rowSize", rowSize);
        

        model.addAttribute("main_jsp","../air/air_list.jsp");
        return "main/main";
    }
}
