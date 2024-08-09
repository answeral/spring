package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmergencyListDto {

	private int emer_list_no;
	private String emer_list_title;
	private String emer_list_tag1;
	private String emer_list_tag2;
	private String emer_list_img;
	
}

