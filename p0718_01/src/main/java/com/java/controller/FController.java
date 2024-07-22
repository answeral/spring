package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.dto.ChartDto;
import com.java.service.BoardService;
import com.java.service.ChartService;
import com.java.service.EmailService;


@Controller
public class FController {

	@Autowired BoardService boardService;
	@Autowired ChartService chartService;
	@Autowired EmailService emailService;
	
	
	@GetMapping("/index")
	public String index() {
		return "/index";
	}
	
	@GetMapping("/email")
	public String email() {
		return "/email";
	}
	
	@PostMapping("/email_send")
	@ResponseBody
	public String email_send(String name, String email) {
		System.out.println("controller name : "+name);
		System.out.println("controller email : "+email);
		
		//text 이메일 전송
//		emailService.email_send(name,email);
		//html 이메일 전송
		emailService.email_send2(name,email);
		
		return "1";
	}
	
	@GetMapping("/notice_list") //게시판 페이지
	public ModelAndView notice_list() {
		
		ArrayList<BoardDto> list = boardService.selectAll();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("notice_list");
		
		//board 테이블의 데이터를 가져와서 출력
		return  mv;
	}
	
	@GetMapping("/chart") //차트그리기
	public String chart() {
		return "/chart";
	}
	
	
	@PostMapping("/chart_data") //ajax chart데이터 전송
	@ResponseBody
	public ArrayList<ChartDto> chart_data(String data, Object region, Object period) {
		System.out.println("controller data :" + data);
		System.out.println("controller region :" + region);
		System.out.println("controller period :" + period);
		
		//출력 region, amt를 객체 생성해서 출력하기
		
		
			ArrayList<ChartDto> list = new ArrayList<>();
		
		// Loan 리스트 - db에서 region,amt를 객체를 생성해서 출력하시오.
		if(data.equals("region")) list = chartService.selectTwo();
		else list = chartService.selectOne();
		
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getRegion()+","
			+list.get(i).getPeriod()+","+list.get(i).getAmt());
		}
		return list;
		
	
	}
	
}
