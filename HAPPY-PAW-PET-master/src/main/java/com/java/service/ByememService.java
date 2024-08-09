package com.java.service;

import java.util.ArrayList;

import com.java.dto.ByememDto;

public interface ByememService {
	
	//탈퇴회원 추가
	void byeMem(String id, String name, String genderC, String content);
	//탈퇴회원목록
	ArrayList<ByememDto> byememList();
	
	//탈퇴회원 차트그리기(탈퇴이유)
	ArrayList<ByememDto> chartDraw();
	//탈퇴회원 차트그리기(남녀성비)
	ArrayList<ByememDto> chartDraw2();

}
