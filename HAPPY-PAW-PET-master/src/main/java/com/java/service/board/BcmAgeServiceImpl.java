package com.java.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BcmAgeDao;
import com.java.dto.board.BcmAgeDto;

@Service
public class BcmAgeServiceImpl implements BcmAgeService {

	@Autowired BcmAgeDao bcmAgeDao;
	
	
	@Override  //특정 게시물 댓글작성자 연령대별
	public ArrayList<BcmAgeDto> chartDraw2(int bno) {
		
		ArrayList<BcmAgeDto> calist = bcmAgeDao.chartDraw2(bno);
		
		return calist;
	}


	@Override  //댓글 수 top 10 전체게시글 댓글작성자 연령대
	public ArrayList<BcmAgeDto> cTotalDraw2() {

		ArrayList<BcmAgeDto> talist = bcmAgeDao.cTotalDraw2();
		
		return talist;
	}

}
