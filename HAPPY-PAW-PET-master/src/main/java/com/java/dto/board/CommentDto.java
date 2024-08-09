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
public class CommentDto {
	
	private int cno;
	private int bno;
	private String id;
	private String ccontent;
	private Date cdate;
}
