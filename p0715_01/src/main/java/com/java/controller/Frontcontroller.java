package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dao.EmpDao;
import com.java.dto.DepartDto;
import com.java.dto.EDDto;
import com.java.dto.EmpDepDto;
import com.java.dto.EmpDto;
import com.java.service.DepartService;
import com.java.service.EDService;
import com.java.service.EmpDepService;
import com.java.service.EmpService;

@Controller
public class Frontcontroller {
	
	@Autowired EmpService empService;
	@Autowired DepartService departService;
	@Autowired EmpDepService empDepService; //컬럼변수사용
	@Autowired EDService edService; //컬럼전체 객체사용
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	//jsp페이지로 보냄
	@RequestMapping("/emp_list")
	public ModelAndView emp_list() {
		//사원테이블 모두 가져오기
		ArrayList<EmpDto> list = empService.selectAll();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("emp_list");
		
		return mv;
	}
	
	@RequestMapping("/department_list")
	public ModelAndView department_list() {
		//부서테이블 모두 가져오기
//		System.out.println("controller list :",list2);
		ArrayList<DepartDto> list2 = departService.selectList();
		
		ModelAndView mv2 = new ModelAndView();
		mv2.addObject("list2",list2);
		mv2.setViewName("department_list");
		
		return mv2;
	}
	
	@RequestMapping("/empDep_list")
	public ModelAndView empDep_list() {
		//사원+부서테이블 조인 가져오기
//		System.out.println("controller list :",list2);
		ArrayList<EmpDepDto> list = empDepService.selectAll();
		
		ModelAndView mv2 = new ModelAndView();
		mv2.addObject("list",list);
		mv2.setViewName("empDep_list");
		
		return mv2;
	}
	
	@RequestMapping("/ed_list")
	public ModelAndView ed_list() {
		ArrayList<EDDto> list = edService.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("ed_list");
		
		return mv;
	}
	



}
