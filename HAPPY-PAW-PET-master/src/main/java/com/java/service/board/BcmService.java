package com.java.service.board;

import java.util.ArrayList;

import com.java.dto.board.BcmDto;

public interface BcmService {

	
	//특정 게시물 댓글작성자 남녀성비
	ArrayList<BcmDto> chartDraw(int bno);

	//댓글 수 top 10 전체 게시글 댓글작성자 남녀성비
	ArrayList<BcmDto> cTotalDraw();

}
