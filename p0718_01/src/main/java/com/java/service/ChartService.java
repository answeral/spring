package com.java.service;

import java.util.ArrayList;

import com.java.dto.ChartDto;

public interface ChartService {

	ArrayList<ChartDto> selectTwo();

	ArrayList<ChartDto> selectOne();

}
