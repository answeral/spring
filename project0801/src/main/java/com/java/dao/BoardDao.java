package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.BoardDto;

@Mapper
public interface BoardDao {
	//게시판리스트 가져오기 - 리스트,검색포함
	ArrayList<BoardDto> selectList(int startRow, int endRow, String category, String searchWord);
	//게시글 총개수 - 리스트,검색포함
	int selectCount(String category, String searchWord);
	//조회수 1증가
	void updateThit(BoardDto bdto);
	//게시글 1개 가져오기 - 현재글, 이전글, 다음글
	BoardDto selectOne(BoardDto bdto);
	BoardDto selectOnePrev(BoardDto bdto);
	BoardDto selectOneNext(BoardDto bdto);

}
