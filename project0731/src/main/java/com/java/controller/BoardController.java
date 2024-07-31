package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/adopt_review")
	public ModelAndView adopt_review() {
		
		ArrayList<BoardDto> list = boardService.selectList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("adopt_review");
		return mv;
	} //list
	
	
	
	@GetMapping("/adopt_view")
	public String adopt_view() {
		return "adopt_view";
	}
	@GetMapping("/Admin_write")
	public String Admin_write() {
		return "Admin_write";
	}

}
