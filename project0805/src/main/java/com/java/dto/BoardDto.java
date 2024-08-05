package com.java.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardDto {
	
	private int tno;
	private String id;
	private String ttitle;
	private String tcontent;
	private Date tdate;
	private int tgroup; 
	private int tstep; 
	private int tindent; 
	private String tfile;
	private int thit;
}