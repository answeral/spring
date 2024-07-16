package com.java.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.CommentBDto;
import com.java.dto.NoticeDto;
import com.java.service.NoticeService;

@RequestMapping("/customer")
@Controller
public class CustomerController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping("/notice")
	public ModelAndView notice() { //notice리스트
		ArrayList<NoticeDto> list = noticeService.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("/customer/notice");
		return mv;
	}
	
	@RequestMapping("/notice_view")
	public ModelAndView notice_view(NoticeDto noticeDto) { //notice리스트
		
		Map<String, Object> map = noticeService.selectOne(noticeDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nDto",map.get("nDto"));
		mv.addObject("list",map.get("list"));
		mv.setViewName("/customer/notice_view");
		
		return mv;
	}
	
	@RequestMapping("/commentBwrite") //하단댓글 추가
	@ResponseBody // 문자리턴
	public CommentBDto commentBwrite(CommentBDto commentBDto) {
		System.out.println("controller bno : "+commentBDto.getBno());
		System.out.println("controller ccontent : "+commentBDto.getCcontent());
		
		//bno,id,cpw,ccontent
		CommentBDto cBDto = noticeService.insertCommentB(commentBDto);
		
		
		return cBDto;
	}

	
	@RequestMapping("/commentBDelete") //하단댓글 삭제
	@ResponseBody // 문자리턴
	public String commentBDelete(CommentBDto commentBDto) {
		System.out.println("controller cno : "+commentBDto.getCno());
		
		//cno
		noticeService.deleteCommentB(commentBDto);
		return "1";
	}
	
	
	
	
	
	
}
