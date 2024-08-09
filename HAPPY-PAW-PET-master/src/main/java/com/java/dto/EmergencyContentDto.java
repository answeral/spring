package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmergencyContentDto {
	
	private int emer_no;
	private String title;
	private String content;
	private Timestamp emer_update;
	
	private int step1;
	private String step_cont1;
	private String step_img1;
	private int step2;
	private String step_cont2;
	private String step_img2;
	private int step3;
	private String step_cont3;
	private String step_img3;
	private int step4;
	private String step_cont4;
	private String step_img4;
	private int step5;
	private String step_cont5;
	private String step_img5;
	private int step6;
	private String step_cont6;
	private String step_img6;
	
}
