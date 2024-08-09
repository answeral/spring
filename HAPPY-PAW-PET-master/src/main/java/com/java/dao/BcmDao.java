package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.board.BcmDto;

@Mapper
public interface BcmDao {

	//특정 게시물 댓글작성자 남녀성비
	ArrayList<BcmDto> chartDraw(int bno);

	//댓글 수 top 10 전체 게시글 댓글작성자 남녀성비
	ArrayList<BcmDto> cTotalDraw();

}
