package com.java.service.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BoardDao;
import com.java.dto.board.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardDao boardDao;
	
	@Override  //공지사항 list, 검색, 페이지 넘버링
	public Map<String, Object> allList(int page, String category, String searchWord) {
		
		//하단 넘버링----------------------------------
		int countPerPage = 10; //1page 당 게시글 수
		int bottomPerNum = 10; //하단넘버링 개수
		int countAll = boardDao.selectCount(category, searchWord); //게시글 총 개수
		System.out.println("service selectList countAll: "+countAll);
		
		//최대 페이지--------------------------------------
		int maxPage = (int) Math.ceil((double) countAll/countPerPage);
		int startPage = ((page-1)/bottomPerNum)*bottomPerNum+1;
		int endPage = (startPage+bottomPerNum)-1;
		
		//마지막 넘버링이 최대 페이지 숫자보다 큰 경우 -------------------
		if (endPage>maxPage) endPage = maxPage;
		
		//게시글 페이지에서 가져올 게시글 번호
		int startRow = (page-1)*countPerPage+1; //1,11,21~
		int endRow = startRow + countPerPage-1; //10,20,30~
		//하단 넘버링 ----------------------------------------------
		ArrayList<BoardDto> list = boardDao.allList(startRow, endRow, category, searchWord);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("countAll", countAll);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("page", page);
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		
		return map;
	}

	@Override  //관리자 공지사항쓰기
	public void writeBoard(BoardDto boardDto) {
		
		boardDao.writeBoard(boardDto);
	}

	@Override //공지사항 view 페이지(현재,다음,이전글 가져오기)
	public Map<String, Object> selectOne(BoardDto boardDto) {
		//조회수 1 증가
		boardDao.updateBhit(boardDto) ;
		
		BoardDto bDto = boardDao.selectOne(boardDto);
		BoardDto prevDto = boardDao.selectOnePrev(boardDto);
		BoardDto nextDto = boardDao.selectOneNext(boardDto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bDto", bDto);
		map.put("prevDto", prevDto);
		map.put("nextDto", nextDto);
		
		
		return map;
	}

	@Override  //공지사항 게시글 삭제
	public void deleteBoard(BoardDto boardDto) {
		boardDao.deleteBoard(boardDto);
	}

	@Override //공지사항 게시글 수정페이지
	public BoardDto boardUpdate(BoardDto boardDto) {
		
		BoardDto bDto = boardDao.boardUpdate(boardDto);
		
		return bDto;
	}

	@Override //게시글 수정 저장
	public void doBoardUpdate(BoardDto boardDto) {

		boardDao.doBoardUpdate(boardDto);
	}

}
