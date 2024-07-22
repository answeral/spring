package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.LoginDto;
@Mapper
public interface LoginDao {

	ArrayList<LoginDto> selectAll(LoginDto ldto);

}
