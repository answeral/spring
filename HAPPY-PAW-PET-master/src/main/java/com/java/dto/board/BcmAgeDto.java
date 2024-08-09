package com.java.dto.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BcmAgeDto {

	private int bno;
	private String age_group;
	private int acnt;
}
