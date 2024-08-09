package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.board.BoardCommentDto;

@Mapper
public interface BoardCommentDao {

	
	//관리자페이지 공지사항-댓글 모두 불러오기
	ArrayList<BoardCommentDto> boardCommentList();

	//관리자 페이지 - 조회수 top 10
	ArrayList<BoardCommentDto> qhitRank();
	
	//관리자 페이지 - 조회수 top 10
	ArrayList<BoardCommentDto> qcommentRank();

}
