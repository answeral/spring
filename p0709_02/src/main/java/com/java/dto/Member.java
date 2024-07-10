package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Getter
//@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String gender;
	private String hobby;
	private String[] hobbys; //DB에서는 배열 저장되지 않음
//	private String hobbys;
	
	
}
