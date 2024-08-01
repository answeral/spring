package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FController {

	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	
}
