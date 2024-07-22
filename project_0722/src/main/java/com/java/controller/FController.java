package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FController {

	@RequestMapping("/Adog_main2")
	public String Adog_main2() {
		return "Adog_main2";
	}
}
