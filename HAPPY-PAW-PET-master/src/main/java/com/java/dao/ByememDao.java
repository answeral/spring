package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.ByememDto;

@Mapper
public interface ByememDao {
	//회원탈퇴추가
	void byeMem(String id, String name, String genderC, String content);

	//관리자페이지 - 탈퇴회원목록
	ArrayList<ByememDto> byememList();
	
	//탈퇴회원 차트그리기(탈퇴이유분석)
	ArrayList<ByememDto> chartDraw();

	//탈퇴회원 차트그리기(남녀성비)
	ArrayList<ByememDto> chartDraw2();

}
