package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FController {
	@RequestMapping("/Adog_main")
	public String Adog_main() {
		return"Adog_main";
	}
	
	@RequestMapping("/index")
	public String index() {
		return"index";
	}
	
}
