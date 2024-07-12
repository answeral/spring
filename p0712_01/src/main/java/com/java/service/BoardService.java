package com.java.service;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;

public interface BoardService {

	void SelectCount();

	ArrayList<BoardDto> selectList();

	ModelAndView list();
	
	
	
}
