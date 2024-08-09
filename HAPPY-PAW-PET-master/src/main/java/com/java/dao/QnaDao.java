package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.qna.AnswerDto;
import com.java.dto.qna.QnaDto;

@Mapper
public interface QnaDao {

	//qna 게시판 list
	ArrayList<QnaDto> allQList(int startRow, int endRow, String category, String searchWord, String id, int qna);
	
	//Qna list 전체 갯수
	int selectCount(String category, String searchWord, String id, int qna);
	
	//qna 현재, 이전, 다음글 가져오기
	QnaDto selectQOne(QnaDto qnaDto);
	QnaDto selectQOnePrev(QnaDto qDto);
	QnaDto selectQOneNext(QnaDto qDto);
	
	//게시글 확인시 조회수 1 증가
	void updateQhit(QnaDto qnaDto);
	
	//답변상태 업뎃하기 (답변완료로)
	void setAnswer(AnswerDto answerDto);
	
	//질문 작성하기
	void insertQna(QnaDto qDto);
	
	//Qna 삭제하기
	void deleteQna(QnaDto qdto);
	
	//Qna 수정페이지
	QnaDto qnaUpdate(QnaDto qDto);
	
	//Qna 수정 저장
	void doQnaUpdate(QnaDto qdto);
}
