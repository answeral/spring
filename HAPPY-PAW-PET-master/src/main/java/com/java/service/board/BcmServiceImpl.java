package com.java.service.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BcmDao;
import com.java.dto.board.BcmDto;

@Service
public class BcmServiceImpl implements BcmService {

	@Autowired BcmDao bcmDao;
	
	
	@Override  //특정 게시물 댓글작성자 남녀성비
	public ArrayList<BcmDto> chartDraw(int bno) {

		ArrayList<BcmDto> cglist = bcmDao.chartDraw(bno);
		
		return cglist;
	}


	@Override //댓글 수 top 10 전체 게시글 댓글작성자 남녀성비
	public ArrayList<BcmDto> cTotalDraw() {
		
		ArrayList<BcmDto> tglist = bcmDao.cTotalDraw();
		
		return tglist;
	}

}
