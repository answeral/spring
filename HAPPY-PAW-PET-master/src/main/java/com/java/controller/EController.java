package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.EmergencyContentDto;
import com.java.dto.EmergencyListDto;
import com.java.service.EmergencyService;

@Controller
public class EController {

	@Autowired
	EmergencyService eService;
	
	@RequestMapping("/emergency/emergency")
	public ModelAndView emergency() {
		ArrayList<EmergencyListDto> list = eService.selectEList();
		ArrayList<EmergencyContentDto> modal_list = eService.selectConList();
		
		System.out.println(list);
		System.out.println(modal_list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("modal_list",modal_list);
		mv.setViewName("/emergency/emergency");
		return mv;
	}
	
}
