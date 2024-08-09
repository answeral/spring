package com.java.service.board;

import java.util.ArrayList;

import com.java.dto.board.BcmAgeDto;
import com.java.dto.board.BcmDto;

public interface BcmAgeService {

	//특정 게시물 댓글작성자 연령대
	ArrayList<BcmAgeDto> chartDraw2(int bno);

	//댓글 수 top 10 전체게시글 댓글작성자 연령대
	ArrayList<BcmAgeDto> cTotalDraw2();

	

}
