package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.board.BoardDto;
import com.java.dto.board.CommentDto;

@Mapper
public interface CommentDao {

	//공지사항 댓글 모두 가져오기
	ArrayList<CommentDto> allComment(BoardDto boardDto);

	//댓글 작성 후 저장하기
	void insertComment(CommentDto commentDto);

	//댓글 삭제하기
	void deleteComment(CommentDto commentDto);

}
