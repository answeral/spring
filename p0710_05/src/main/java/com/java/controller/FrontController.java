package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {
    
	@RequestMapping("/index") // IOC container에 넣는 것
	public String index() {
		return "index";
	}



}
