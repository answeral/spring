package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.board.BcmAgeDto;

@Mapper
public interface BcmAgeDao {

	//특정 게시물 댓글작성자 연령대별
	ArrayList<BcmAgeDto> chartDraw2(int bno);

	//댓글 수 top 10 전체게시글 댓글작성자 연령대
	ArrayList<BcmAgeDto> cTotalDraw2();

}
