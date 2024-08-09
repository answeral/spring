package com.java.dto.qna;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaAnswerDto {

	private int qno;
	private String id;
	private String qtitle;
	private String qcontent;
	private Date qdate;
	private int qhit;
	private String qanswer;
	private int answer_cnt;
}
