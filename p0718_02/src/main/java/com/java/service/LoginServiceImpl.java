package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.LoginDao;
import com.java.dto.LoginDto;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
	@Override
	public ArrayList<LoginDto> selectAll(LoginDto ldto) {
		ArrayList<LoginDto> list = loginDao.selectAll(ldto);
		
		return list;
		
	}

}
