package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.EmergencyContentDto;
import com.java.dto.EmergencyListDto;

@Mapper
public interface EmergencyDao {

	ArrayList<EmergencyListDto> selectEListAll();

	ArrayList<EmergencyContentDto> selectConListAll();	//모달창 내용

	EmergencyContentDto selectEContentOne(EmergencyListDto emerLDto);//모달창


}
