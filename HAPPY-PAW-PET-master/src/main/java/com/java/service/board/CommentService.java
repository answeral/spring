package com.java.service.board;

import java.util.ArrayList;

import com.java.dto.board.BoardDto;
import com.java.dto.board.CommentDto;

public interface CommentService {

	//공지사항 view의 댓글 가져오기
	ArrayList<CommentDto> allComment(BoardDto boardDto);

	//댓글 작성 후 저장하기
	void insertComment(CommentDto commentDto);
	
	//댓글 삭제하기
	void deleteComment(CommentDto commentDto);

}
