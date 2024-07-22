package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.ChartDto;
@Mapper
public interface ChartDao {

	ArrayList<ChartDto> selectTwo();

	ArrayList<ChartDto> selectOne();

}
