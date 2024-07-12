package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.BoardDto;

@Mapper //IOC컨테이너 등록
public interface BoardDao {

	ArrayList<BoardDto> selectList();

}
