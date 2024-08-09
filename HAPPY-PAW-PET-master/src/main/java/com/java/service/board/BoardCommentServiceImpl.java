package com.java.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BoardCommentDao;
import com.java.dto.board.BoardCommentDto;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired BoardCommentDao bcDao;
	
	@Override //관리자페이지 공지사항-댓글개수 불러오기
	public ArrayList<BoardCommentDto> boardCommentList() {
		
		ArrayList<BoardCommentDto> bclist = bcDao.boardCommentList();
		
		return bclist;
	}

	@Override //관리자 페이지 - 조회수 top 10
	public ArrayList<BoardCommentDto> qhitRank() {

		ArrayList<BoardCommentDto> rlist = bcDao.qhitRank();
		
		return rlist;
	}

	@Override //관리자 페이지 - 댓글수 top 10
	public ArrayList<BoardCommentDto> qcommentRank() {
		
		ArrayList<BoardCommentDto> clist = bcDao.qcommentRank();
		
		return clist;
	}

}
