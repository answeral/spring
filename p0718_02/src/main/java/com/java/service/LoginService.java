package com.java.service;

import java.util.ArrayList;

import com.java.dto.LoginDto;

public interface LoginService {

	ArrayList<LoginDto> selectAll(LoginDto ldto);

}
