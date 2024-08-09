package com.java.service.qna;

import java.util.ArrayList;

import com.java.dto.qna.AnswerDto;
import com.java.dto.qna.QnaDto;

public interface AnswerService {

	//QnA 답변 모두 가져오기
	ArrayList<AnswerDto> bringAnswer(QnaDto qnaDto);

	//답변하기
	void anwserOne(AnswerDto answerDto);

}
