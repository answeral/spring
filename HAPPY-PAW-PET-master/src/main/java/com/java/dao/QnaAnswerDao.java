package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.qna.QnaAnswerDto;

@Mapper
public interface QnaAnswerDao {

	//관리자페이지 qna-답변수
	ArrayList<QnaAnswerDto> qnaAnswerList();

}
