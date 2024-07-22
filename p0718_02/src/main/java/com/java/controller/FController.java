package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.LoginDto;
import com.java.dto.NoticeDto;
import com.java.service.LoginService;
import com.java.service.NoticeService;

@Controller
public class FController {

	@Autowired LoginService loginService;
	@Autowired NoticeService noticeService;
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}
	
	
	@GetMapping("/member/doLogin")
	public ModelAndView doLogin(LoginDto ldto) {
		ArrayList<LoginDto> loginDto = new ArrayList<LoginDto>();
		System.out.println("ldto : "+ldto.getId());
		System.out.println("ldto : "+ldto.getPw());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("loginDto",loginDto);
		mv.setViewName("member/doLogin");
		return mv ;
	}
	
	@GetMapping("/customer/notice")
	public ModelAndView notice() {
		ArrayList<NoticeDto> list = noticeService.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("customer/notice");
		
		return mv;
	}
	
}
