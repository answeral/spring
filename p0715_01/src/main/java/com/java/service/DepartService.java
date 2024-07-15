package com.java.service;

import java.util.ArrayList;

import com.java.dto.DepartDto;


public interface DepartService {

	//department 리스트 모두 가져오기
	ArrayList<DepartDto> selectList();

}
