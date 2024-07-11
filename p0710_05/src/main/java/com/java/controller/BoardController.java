package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

@Controller
public class BoardController {
 
	@Autowired
	BoardService boardService;//interface상속
	
	@RequestMapping("/board/list")
	public ModelAndView list() {
		//DB 연결
		//게시글 전체 가져오기
		ArrayList<BoardDto> list = boardService.selectLsit(); //boardService에 연결 
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("board/list");
				
		
		return mv;
		
	}
	
	
	
}
