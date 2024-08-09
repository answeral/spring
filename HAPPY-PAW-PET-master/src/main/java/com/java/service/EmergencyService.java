package com.java.service;

import java.util.ArrayList;

import com.java.dto.EmergencyContentDto;
import com.java.dto.EmergencyListDto;

public interface EmergencyService {

	ArrayList<EmergencyListDto> selectEList();
	ArrayList<EmergencyContentDto> selectConList(); //모달 내용


	EmergencyContentDto selectEContent(EmergencyListDto emerLDto);//모달창


}
