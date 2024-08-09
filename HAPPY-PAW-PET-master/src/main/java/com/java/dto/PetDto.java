package com.java.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PetDto {
	
	private String id;
	private String pname;
	private Double pweight;
	private Date pbirth;
	private String pgender;
	private String psurgery;
	private String pfile;
	private int pno;
	private int page;
}
