package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FController {

	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/test1")
	public String test1() {
		return "test1";
	}
	
	@GetMapping("/test2")
	public String test2() {
		return "test2";
	}
	
	@GetMapping("/Adog_map")
	public String Adog_map() {
		return "Adog_map";
	}
	
	@GetMapping("/test4")
	public String test4() {
		return "test4";
	}
	
	@GetMapping("/Adog_ex")
	public String Adog_ex() {
		return "Adog_ex";
	}

	@GetMapping("/header")
	public String header() {
		return "/header";
	}
	
	
	@GetMapping("/footer")
	public String footer() {
		return "footer";
	}
	
	
	
}
