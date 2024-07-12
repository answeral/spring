package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder                    // 부분생성자
@AllArgsConstructor         // 전체생성자
@NoArgsConstructor          // 기본생성자
@Data                       // getter,setter
public class BoardDto {
	//DB에 있는 board 순서,변수이름과 같아야 함
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bgroup;
	private int bstep;
	private int bindent;
	private int bhit;
	private String bfile;
		
}
