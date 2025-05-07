package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.AirService;
import com.sist.vo.air.FlightInfoVO;

@RestController
@RequestMapping("air/")
public class AirRestController {
    @Autowired
    private AirService service;

    @GetMapping("list_vue.do")
    public Map<String, Object> listVue(
            @RequestParam(required = false) Integer page
    ) {
        Map<String,Object> result = new HashMap<>();


        if (page == null) {
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

        List<FlightInfoVO> list     = service.flightListData(start, end);
        int totalPage               = service.flightTotalPage();

        final int BLOCK = 10;
        int startPage  = ((page - 1) / BLOCK) * BLOCK + 1;
        int endPage    = Math.min(startPage + BLOCK - 1, totalPage);

        result.put("list",      list);
        result.put("curpage",   page);
        result.put("totalpage", totalPage);
        result.put("startPage", startPage);
        result.put("endPage",   endPage);
        return result;
    }
}