package com.java.controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

@Controller
public class FrontController {

	@Autowired BoardService boardService;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/json_data")
	public String json_data() {
		return "json_data";
	}
	
	@RequestMapping("/ajaxSend")
	@ResponseBody //게시글리스트를 전달해라
	public ArrayList<BoardDto> ajaxSend(String category, String sword) {
		System.out.println("category : "+category);
		System.out.println("sword : "+sword);
		System.out.println("ajaxSend페이지가 호출되었습니다.");
		
//		BoardDto b1 = new BoardDto(1,"aaa","제목1","내용1",new Timestamp(System.currentTimeMillis()),1,0,0,0,"");
//		BoardDto b2 = new BoardDto(2,"bbb","제목2","내용2",new Timestamp(System.currentTimeMillis()),2,0,0,0,"");
//		list.add(b1);
//		list.add(b2);
		
		//Service의 selectSearch
		ArrayList<BoardDto> list =boardService.selectAll(category,sword);
		
		
		return list;//게시글리스트.jsp를 열어달라
	}
	
	
	
	
}
