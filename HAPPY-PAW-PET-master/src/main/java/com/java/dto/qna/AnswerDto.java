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
public class AnswerDto {
	
	private int ano;
	private int qno;
	private String id;
	private String acontent;
	private Date adate;
}
