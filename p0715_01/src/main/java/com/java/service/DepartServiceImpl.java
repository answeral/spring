package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.DepartDao;
import com.java.dto.DepartDto;


@Service
public class DepartServiceImpl implements DepartService {

	@Autowired
	DepartDao departDao; 
	
	@Override
	public ArrayList<DepartDto> selectList() {
		ArrayList<DepartDto> list2 =departDao.selectList();
//		System.out.println();
		return list2;
	}

}
