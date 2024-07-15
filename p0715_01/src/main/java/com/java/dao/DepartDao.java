package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.DepartDto;

@Mapper
public interface DepartDao {
	//부서리스트 모두 가져오기
	ArrayList<DepartDto> selectList();
}
