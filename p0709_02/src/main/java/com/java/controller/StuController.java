package com.java.controller;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.Students;

@Controller
public class StuController {
	
	@RequestMapping("/students/students")
	public String students() {
		return "students/students";
	} 
	
	//doStudents.jsp 데이터를 보여지도록 하기
	
	@RequestMapping("/students/doStudents")
	public ModelAndView doStudents(Students stu) {
		System.out.println("name :"+stu.getName());
		System.out.println("kor :"+stu.getKor());
		System.out.println("eng :"+stu.getEng());
		System.out.println("math :"+stu.getMath());
		System.out.println("total :"+stu.getTotal());
		System.out.println("avg :"+stu.getAvg());
		
//		Students stu = new Students(stuNo,name,kor,eng,math);
		stu.setTotal(stu.getKor()+stu.getEng()+stu.getMath());
		stu.setAvg(stu.getTotal()/3.0);
		stu.setHobby(Arrays.toString(stu.getHobbys()));
		
		//객체 선언
//		Students s = new Students(stu.getStuNo(),stu.getName(),stu.getKor(),stu.getEng(),stu.getMath());
		ModelAndView mv = new ModelAndView();
		mv.addObject("stu",stu);//("stu",stu) 앞이 이름!!!!!!!!!!!!!!!!
		mv.setViewName("students/doStudents");
		
		return mv;
	}
	
	@RequestMapping("/students/stuUpdate")
	public ModelAndView stuUpdate(Students stu) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("stu",stu);
		mv.setViewName("students/stuUpdate");
		return mv;
		
	}
	
}
