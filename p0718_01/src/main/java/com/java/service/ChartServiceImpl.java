package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.ChartDao;
import com.java.dto.ChartDto;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired ChartDao chartDao;
	@Override
	public ArrayList<ChartDto> selectTwo() {
		ArrayList<ChartDto> list = chartDao.selectTwo();
		return list;
	}
	
	@Override
	public ArrayList<ChartDto> selectOne() {
		ArrayList<ChartDto> list2 = chartDao.selectOne();
		return list2;
	}

}
