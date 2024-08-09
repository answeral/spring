package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.qna.AnswerDto;
import com.java.dto.qna.QnaDto;

@Mapper
public interface AnswerDao {

	//QnA 답변 모두 가져오기
	ArrayList<AnswerDto> bringAnswer(QnaDto qnaDto);

	//답변하기 저장
	void answerOne(AnswerDto answerDto);

}
