package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.board.BoardDto;

@Mapper
public interface BoardDao {

	//공지사항 list
	ArrayList<BoardDto> allList(int startRow, int endRow, String category, String searchWord);
	//공지사항 전체 개수
	int selectCount(String category, String searchWord);
	
	//관리자 공지사항 쓰기
	void writeBoard(BoardDto boardDto);

	//공지사항 view 페이지(현재,이전,다음)
	BoardDto selectOne(BoardDto boardDto);
	BoardDto selectOnePrev(BoardDto boardDto);
	BoardDto selectOneNext(BoardDto boardDto);
	
	//조회수 1증가
	void updateBhit(BoardDto boardDto);

	//공지사항 삭제하기
	void deleteBoard(BoardDto boardDto);

	//공지사항 수정페이지
	BoardDto boardUpdate(BoardDto boardDto);

	//공지사항 수정 저장
	void doBoardUpdate(BoardDto boardDto);





}
