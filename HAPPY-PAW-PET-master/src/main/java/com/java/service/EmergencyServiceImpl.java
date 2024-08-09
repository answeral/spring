package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.EmergencyDao;
import com.java.dto.EmergencyContentDto;
import com.java.dto.EmergencyListDto;

@Service
public class EmergencyServiceImpl implements EmergencyService {

	@Autowired
	EmergencyDao eDao;

	@Override
	public ArrayList<EmergencyListDto> selectEList() {
		ArrayList<EmergencyListDto> list = eDao.selectEListAll();
		return list;
	}

	@Override	// 모달 내용
	public ArrayList<EmergencyContentDto> selectConList() {	
		ArrayList<EmergencyContentDto> modal_list = eDao.selectConListAll();
		return modal_list;
	}
	
	@Override
	public EmergencyContentDto selectEContent(EmergencyListDto emerLDto) {
		EmergencyContentDto eCDto = eDao.selectEContentOne(emerLDto);
		return eCDto;
	}

}
