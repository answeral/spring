package com.java.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardDto {
	
	private int tno;
	private String id;
	private String ttitle;
	private String tcontent;
	private Timestamp tdate;
	private int tgroup; 
	private int tstep; 
	private int tindent; 
	private String tfile;
	private int thit;
	
	
	

}
