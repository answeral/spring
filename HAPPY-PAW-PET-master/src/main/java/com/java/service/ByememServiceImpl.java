package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.ByememDao;
import com.java.dto.ByememDto;

@Service
public class ByememServiceImpl implements ByememService {

	@Autowired ByememDao byememDao;
	
	@Override  //탈퇴회원추가
	public void byeMem(String id, String name, String genderC, String content) {
		byememDao.byeMem(id,name,genderC,content); 
	}

	@Override  //관리자페이지 - 탈퇴회원목록
	public ArrayList<ByememDto> byememList() {
		
		ArrayList<ByememDto> blist = byememDao.byememList();
		
		return blist;
	}

	@Override //탈퇴이유분석차트
	public ArrayList<ByememDto> chartDraw() {

		ArrayList<ByememDto> blist = byememDao.chartDraw();
		
		return blist;
	}

	@Override  //탈퇴남녀성비
	public ArrayList<ByememDto> chartDraw2() {
		
		ArrayList<ByememDto> blist2 = byememDao.chartDraw2();
		
		return blist2;
	}

}
