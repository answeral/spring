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
	public ModelAndView adopt_review(@RequestParam(defaultValue = "1") int page, String category, String searchWord){
		
		//category,searchWord
		System.out.println("controller category : "+category);
		System.out.println("controller searchWord : "+searchWord);
		
		Map<String, Object> map = boardService.selectList(page,category,searchWord);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("adopt_review");
		return mv ;
	} //list
	
	@GetMapping("/adopt_view")//뷰 페이지
	public ModelAndView adopt_view(BoardDto bdto,@RequestParam(defaultValue = "1")int page){
		
		Map<String, Object> map = boardService.selectOne(bdto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("page",page);
		mv.setViewName("adopt_view");
		
		return mv;
	} //view
	
	@GetMapping("/Admin_write")//글쓰기 화면
	public String Admin_write() {
		return "Admin_write";
	}
	

}
