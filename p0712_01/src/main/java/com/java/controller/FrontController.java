package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.service.BoardService;
import com.java.service.BoardServiceImpl;
import com.java.service.BoardServiceImplVere2;

@Controller
public class FrontController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	
	
}
