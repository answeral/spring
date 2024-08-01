package com.java.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/adopt_review")//게시판 리스트
	public String adopt_review(){
		return "adopt_review";
	} //list
	
	@GetMapping("/adopt_view")//게시판 리스트
	public String adopt_view(){
		return "adopt_view";
	} //list
	

	
	@GetMapping("/Admin_write")//글쓰기 화면
	public String Admin_write() {
		return "Admin_write";
	}

}
