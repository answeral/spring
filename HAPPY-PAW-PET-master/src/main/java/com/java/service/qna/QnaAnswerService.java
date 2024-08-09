package com.java.service.qna;

import java.util.ArrayList;

import com.java.dto.qna.QnaAnswerDto;

public interface QnaAnswerService {

	//관리자페이지 qna-답변수
	ArrayList<QnaAnswerDto> qnaAnswerList();

}
