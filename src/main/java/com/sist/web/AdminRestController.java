package com.sist.web;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.admin.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminRestController {
	@Autowired
	private AdminService service;
	
	
}
