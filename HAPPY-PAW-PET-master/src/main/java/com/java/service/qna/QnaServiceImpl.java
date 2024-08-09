package com.java.service.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.QnaDao;
import com.java.dto.qna.QnaDto;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaDao qnaDao;
	
	@Override //Qna 모두 불러오기
	public Map<String, Object> allQList(int page, String category, String searchWord, String id, int qna) {
		System.out.println("controller: "+id);
		//하단 넘버링----------------------------------
		int countPerPage = 10; //1page 당 게시글 수
		int bottomPerNum = 10; //하단넘버링 개수
		int countAll = qnaDao.selectCount(category, searchWord, id, qna); //게시글 총 개수
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
		ArrayList<QnaDto> list = qnaDao.allQList(startRow, endRow, category, searchWord, id, qna);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("countAll", countAll);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("page", page);
		map.put("category", category);
		map.put("searchWord", searchWord);
		map.put("id", id);
		map.put("qna", qna);
		return map;
	}
	@Override //Qna 이전, 다음, 현재글 가져오기
	public Map<String, Object> selectQOne(QnaDto qDto) {
		//누를때마다 조회수 1 증가
		qnaDao.updateQhit(qDto);
		
		QnaDto qnadto = qnaDao.selectQOne(qDto);
		QnaDto prevDto = qnaDao.selectQOnePrev(qDto);
		QnaDto nextDto = qnaDao.selectQOneNext(qDto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("qnadto", qnadto);
		map.put("prevDto", prevDto);
		map.put("nextDto", nextDto);
				
		return map;
	}
	@Override  //질문 작성하기
	public void insertQna(QnaDto qDto) {
		
		qnaDao.insertQna(qDto);
		
	}
	
	@Override //Qna 게시글 삭제하기
	public void deleteQna(QnaDto qdto) {
		System.out.println("service qnabno: "+qdto.getQno());
		qnaDao.deleteQna(qdto);
	}
	@Override //Qna 게시글 수정 페이지
	public QnaDto qnaUpdate(QnaDto qDto) {
		QnaDto qdto = qnaDao.qnaUpdate(qDto);
		return qdto;
	}
	
	@Override //Qna 게시글 수정저장
	public void doQnaUpdate(QnaDto qdto) {
		qnaDao.doQnaUpdate(qdto);	
	}

}
