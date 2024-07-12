package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;

@Service //IOC 컨테이너에 등록
@Qualifier(value="ver2")
public class BoardServiceImplVere2 implements BoardService {

	
	@Override
	public void SelectCount() {
		System.out.println("BoardServiceImpl :"+"버전2이 실행됩니다.");
	}

	@Override
	public ArrayList<BoardDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView list() {
		// TODO Auto-generated method stub
		return null;
	}

	//새로운 버전의 서비스를 1개 더 만듦
	
	
}
