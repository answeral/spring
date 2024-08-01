package com.java.service;

import java.util.ArrayList;
import java.util.Map;

import com.java.dto.BoardDto;

public interface BoardService {

	//게시판 리스트 가져오기
	Map<String, Object> selectList(int page, String category, String searchWord);

	Map<String, Object> selectOne(BoardDto bdto);

}
