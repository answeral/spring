package com.java.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.CommentDao;
import com.java.dto.board.BoardDto;
import com.java.dto.board.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired CommentDao commentDao;

	@Override //공지사항 view 해당 댓글 가져오기
	public ArrayList<CommentDto> allComment(BoardDto boardDto) {

		ArrayList<CommentDto> clist = commentDao.allComment(boardDto);
		
		return clist;
	}

	@Override //댓글 작성 후 저장하기
	public void insertComment(CommentDto commentDto) {

		commentDao.insertComment(commentDto);
	}

	@Override //댓글 삭제하기
	public void deleteComment(CommentDto commentDto) {
		
		commentDao.deleteComment(commentDto);
		
	}
	

}
