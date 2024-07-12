package com.java.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.java.dao.BoardDao;
import com.java.dto.BoardDto;

@Service //IOC 컨테이너에 등록
@Qualifier(value="ver1")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public void SelectCount() {
		System.out.println("BoardServiceImpl :"+"버전1이 실행됩니다.");
		
	}

	@Override
	public ArrayList<BoardDto> selectList() {
		
		ArrayList<BoardDto> list = boardDao.selectList();
		return list;
	}

	@Override
	public ModelAndView list() {
		// TODO Auto-generated method stub
		return null;
	}

	//버전1
	
	
	
}
