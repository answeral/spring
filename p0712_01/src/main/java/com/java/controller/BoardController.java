package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;
import com.java.service.BoardServiceImpl;

@Controller
public class BoardController {
	//DB에서 가져와야함
//	BoardServiceImpl boardserviceimpl = new BoardServiceImpl();
//	BoardServiceImplVere2 boardsereviceimplver2 = new  BoardServiceImplVere2();
	
//	BoardService boardService = new BoardServiceImpl();
//	BoardService boardService = new  BoardServiceImplVere2();

	//다형성
	@Autowired  //@Service가 붙어있는 곳에서 불러옴
	@Qualifier("ver1")
	BoardService boardService;

	@RequestMapping("/board/list")
	public ModelAndView list() {
		
		//게시판 전체 가져오기
		ArrayList<BoardDto> list = boardService.selectList();

		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("board/list");
		return mv;
		
	}
	
}
