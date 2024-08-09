package com.java.service.qna;

import java.util.Map;

import com.java.dto.qna.QnaDto;

public interface QnaService {

	//Qna 게시판 list, 검색
	Map<String, Object> allQList(int page, String category, String searchWord, String id, int qna);
	
	//Qna 이전, 현재 ,다음 글 가져오기
	Map<String, Object> selectQOne(QnaDto qnaDto);
	
	//질문하기
	void insertQna(QnaDto qDto);
	//Qna 삭제하기
	void deleteQna(QnaDto qdto);
	
	//Qna 수정 페이지
	QnaDto qnaUpdate(QnaDto qDto);
	//Qna 수정 저장
	void doQnaUpdate(QnaDto qdto);

}
