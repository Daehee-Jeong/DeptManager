package com.capstone.deptmanager.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	// 재현 커밋
	
	@RequestMapping
	public String index() {
		return "index";
	} // end of index
	
} // end of class
