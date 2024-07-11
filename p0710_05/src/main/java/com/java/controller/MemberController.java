package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.MemberDto;
import com.java.service.MemberService;

@Controller
public class MemberController {
	
	//객체선언
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/member/login")
	public String login() {
		return"member/login";
	}
	
	
	@RequestMapping("/member/doLogin")
	public ModelAndView doLogin(MemberDto mdto) {// String id, String pw를 객체(mdto)로 받음
		//객체를 1개 (memberService.selectLogin(mdto))받아서 넘김(memberDto)
		MemberDto memberDto = memberService.selectLogin(mdto);
		
		ModelAndView mv =  new ModelAndView();
		mv.addObject("memberDto",memberDto);
		mv.setViewName("member/doLogin");
		
		return mv;
		
	}
	
	
	
	
}
