package com.java.dto.qna;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class QnaDto {

	private int qno;
	private String id;
	private String qtitle;
	private String qcontent;
	private Date qdate;
	private String qfile;
	private int qhit;
	private String qanswer;
}
