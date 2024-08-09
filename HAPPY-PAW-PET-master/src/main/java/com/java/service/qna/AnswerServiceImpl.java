package com.java.service.qna;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.AnswerDao;
import com.java.dao.QnaDao;
import com.java.dto.qna.AnswerDto;
import com.java.dto.qna.QnaDto;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired AnswerDao answerDao;
	@Autowired QnaDao qnaDao;

	@Override
	public ArrayList<AnswerDto> bringAnswer(QnaDto qnaDto) {
		
		//답변가져오기
		ArrayList<AnswerDto> alist = answerDao.bringAnswer(qnaDto);
		
		return alist;
	}

	@Override  //질문에 답변하기
	public void anwserOne(AnswerDto answerDto) {
		// 질문에 답변
		answerDao.answerOne(answerDto);
		
		//qna 답변상태 업데이트하기
		qnaDao.setAnswer(answerDto);
		
	}
	
	

}
