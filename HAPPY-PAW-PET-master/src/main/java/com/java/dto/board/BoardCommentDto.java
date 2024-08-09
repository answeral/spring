package com.java.dto.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardCommentDto {

	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private int bhit;
	private int comment_cnt;
}
