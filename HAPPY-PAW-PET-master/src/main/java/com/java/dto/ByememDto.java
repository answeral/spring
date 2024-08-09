package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ByememDto {
	
	private String id;
	private String name;
	private String gender;
	private String content;
	private int cnt;
	private int gcnt;
	
}
