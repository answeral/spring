package com.java.dto.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDto {
	
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private String bfile;
	private int bhit;
	private int topchk;
	
	
}
