package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BoardDao;
import com.java.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public ArrayList<BoardDto> selectList() {
		//데이터 전체를 담아옴.
		//mybatis 연결해서 list 가져오기
		ArrayList<BoardDto> list = boardDao.selectList();
		System.out.println("serviceImpl list : "+list.size());
		return list;
	}
	
	
	
}
