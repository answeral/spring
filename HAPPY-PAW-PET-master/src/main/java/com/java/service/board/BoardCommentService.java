package com.java.service.board;

import java.util.ArrayList;

import com.java.dto.board.BoardCommentDto;

public interface BoardCommentService {

	//관리자 페이지 공지사항-댓글 불러오기
	ArrayList<BoardCommentDto> boardCommentList();

	//관리자 페이지 - 조회수 top 10
	ArrayList<BoardCommentDto> qhitRank();

	//관리자 페이지 - 댓글수 top 10
	ArrayList<BoardCommentDto> qcommentRank();

}
