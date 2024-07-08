package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class FrontController {
	
	//페이지 호출
	// get 방식만 사용 가능
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	//get,post 방식 둘 다 사용
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	//get 방식만 들어 올 수 있음
	@GetMapping("/board/board")
	public String board() {
		return "board/board";
	}
	
	//post 방식으로만 사용가능
	@PostMapping("/doBoard")
	public String doboard() {
		return "doBoard";
	}
	
	@RequestMapping("/board/form")
	public String form() {
		return "board/form";
	}
	
	@RequestMapping("/board/form2")
	public String form2() {
		return "board/form2";
	}
	
	//---------------------------------------------------------
	
	@RequestMapping("/board/doForm")
	public String doForm(HttpServletRequest request, Model model) {
		System.out.println("bno :" +request.getParameter("bno"));
		System.out.println("btitle :" +request.getParameter("btitle"));
		model.addAttribute("bno",request.getParameter("bno"));
		model.addAttribute("btitle",request.getParameter("btitle"));
		
		return "board/doForm";
	}
	
	//장점: 매개변수가 적게 사용
	@RequestMapping("/board/doForm2")
	public ModelAndView doForm2(HttpServletRequest request) {
		System.out.println("bno :" +request.getParameter("bno"));
		System.out.println("btitle :" +request.getParameter("btitle"));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("bno",request.getParameter("bno"));
		mv.addObject("btitle",request.getParameter("btitle"));
		mv.setViewName("board/doForm2");
		
		return mv;
	}
	
	//---------------------------------------------------------
	
	
	
	
	
}
