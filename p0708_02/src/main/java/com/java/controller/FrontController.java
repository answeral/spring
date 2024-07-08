package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@Component 
//@Controller :presentation
//@Service : service 
//@Repository:DAO,Persistance
//@Configuration @Bean
public class FrontController {
	
	//index파일을 열고 싶음
	@RequestMapping(value="/index", method=RequestMethod.GET) 
	public String index() {
		//localhost:8181/index
		//localhost:8181/WEB-INF/views/index.jsp
		return"index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	
	
}
