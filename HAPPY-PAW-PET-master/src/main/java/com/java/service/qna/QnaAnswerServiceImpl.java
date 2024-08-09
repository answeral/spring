package com.java.service.qna;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.QnaAnswerDao;
import com.java.dto.qna.QnaAnswerDto;

@Service
public class QnaAnswerServiceImpl implements QnaAnswerService {

	@Autowired QnaAnswerDao qaDao;
	
	@Override //관리자페이지 qna-답변수
	public ArrayList<QnaAnswerDto> qnaAnswerList() {
		
		ArrayList<QnaAnswerDto> qalist = qaDao.qnaAnswerList();
		
		return qalist;
	}

}
