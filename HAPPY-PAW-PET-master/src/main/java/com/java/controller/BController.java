package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.board.BoardDto;
import com.java.dto.board.CommentDto;
import com.java.dto.qna.AnswerDto;
import com.java.dto.qna.QnaDto;
import com.java.service.board.BoardService;
import com.java.service.board.CommentService;
import com.java.service.qna.AnswerService;
import com.java.service.qna.QnaService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BController {

	@Autowired BoardService boardService;
	@Autowired QnaService qnaService;
	@Autowired AnswerService answerService;
	@Autowired CommentService commentService;
	@Autowired HttpSession session;
	
	//--------------------------------------------------------------------------------------
	//공지사항
	
	@RequestMapping("/board/list")  //공지사항 list & 검색기능, 페이지 넘버링
	public ModelAndView list(@RequestParam (defaultValue = "1") int page,
			String category, String searchWord) {
		
		Map<String, Object> map = boardService.allList(page, category, searchWord);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("/board/write")  //관리자 공지사항 글쓰기
	public String write() {
		
		return "board/write";
	}
	
	@PostMapping("/board/write")  //관리자 공지사항 글쓰기
	public String write(BoardDto boardDto, @RequestPart MultipartFile files) {
		
		//bno,id,btitle,bcontent,bdate,files,topchk
		//System.out.println("controller files : "+files.getOriginalFilename());
		String uFile="";  //파일이 존재하지 않으면 null값으로 들어감
		//파일이 존재할 시
		if (!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) { e.printStackTrace(); } //파일업로드 
		}//if
		
		//변경된 파일이름 저장
		boardDto.setBfile(uFile);
		
		//topchk 확인
		//System.out.println("controller topchk : "+boardDto.getTopchk());
		
		boardService.writeBoard(boardDto);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/board/view")  //공지사항 현재, 이전, 다음글 가져오기 & 댓글 가져오기
	public ModelAndView view(BoardDto boardDto) {
		//공지사항 글 하나 가져오기
		Map<String, Object> map = boardService.selectOne(boardDto);
		//댓글 가져오기
		ArrayList<CommentDto> clist = commentService.allComment(boardDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("clist",clist);
		mv.setViewName("board/view");
		
		return mv;
	}
	
	@RequestMapping("/board/boardDelete")  //공지사항 삭제하기
	public String boardDelete(BoardDto boardDto) {
		
		boardService.deleteBoard(boardDto);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/board/boardUpdate") //공지사항 게시글 수정페이지
	public ModelAndView boardUpdate(BoardDto boardDto) {
		
		BoardDto bDto = boardService.boardUpdate(boardDto);
		
		//topchk 확인
		System.out.println("controller topchk : "+bDto.getTopchk());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("bDto",bDto);
		mv.setViewName("/board/boardUpdate");
		
		return mv;
	}
	
	@RequestMapping("/board/doBoardUpdate") //공지사항 수정 저장
	public String doBoardUpdate(BoardDto boardDto, @RequestPart MultipartFile files) {
		
		//가져오는 값 : id,btitle,bcontent,files
		System.out.println("controller files : "+files.getOriginalFilename());
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		boardDto.setBfile(uFile);
		boardService.doBoardUpdate(boardDto);
		return "redirect:/board/view?bno="+boardDto.getBno();
	}
	
	
	@PostMapping("/board/writeReply") //댓글 작성
	public String writeReply(CommentDto commentDto) {
		
		int bno = commentDto.getBno();
		//댓글 작성하기!
		commentService.insertComment(commentDto);
		
		return "redirect:/board/view?bno=" + bno;
	}
	
	@PostMapping("/board/deleteComment") //댓글 삭제
	public String deleteComment(CommentDto commentDto) {
		
		//bno,cno,id 넘어옴
		int bno = commentDto.getBno();
		System.out.println("controller bno : "+bno);
		
		//댓글 삭제하기!
		commentService.deleteComment(commentDto);
		
		return "redirect:/board/view?bno=" + bno;
	}
	
	
	//--------------------------------------------------------------------------------------------------
	//Q&A
	
	@RequestMapping("/board/qnaList")  //qna 페이지 list
	public ModelAndView qnaList(@RequestParam (defaultValue = "1") int page,
			String category, String searchWord, @RequestParam (defaultValue = "0") int qna) {
		String id = (String)session.getAttribute("sessionId");
		
		System.out.println("controller category: "+category);
		System.out.println("controller searchWord: "+searchWord);
		System.out.println(id);
		
		//리스트, 검색 포함
		Map<String, Object> map = qnaService.allQList(page, category, searchWord, id, qna);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("board/qnaList");
		return mv;
	}
	
	@GetMapping("/board/question") //글쓰기 화면
	public String question() {
		return "board/question";
	}
	
	@PostMapping("/board/question") //질문하기 작성
	public String question(QnaDto qDto, @RequestPart MultipartFile files) {
		
		//가져오는 값 : id,qtitle,qcontent,files
		System.out.println("controller files : "+files.getOriginalFilename());
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			//uuid방식
//						UUID uuid = UUID.randomUUID();
//						System.out.println("uuid : "+uuid);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		qDto.setQfile(uFile);
		
		qnaService.insertQna(qDto);
		return "redirect:/board/qnaList";
	}
	
	
	@RequestMapping("/board/qnaView")  //qna 현재, 이전, 다음글 가져오기 & 답변있으면 가져오기
	public ModelAndView qnaView(QnaDto qnaDto) {
		//QnA 글 하나 가져오기
		Map<String, Object> map = qnaService.selectQOne(qnaDto);
		//답변 가져오기
		ArrayList<AnswerDto> alist = answerService.bringAnswer(qnaDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("alist",alist);
		mv.setViewName("board/qnaView");
		
		return mv;
	}
	
	@RequestMapping("/board/qnadelete")  //qna 삭제하기
	public String qnadelete(QnaDto qdto) {
		
		qnaService.deleteQna(qdto);
		
		return "redirect:/board/qnaList";
	}
	
	@RequestMapping("/board/qnaUpdate") //qna 수정페이지
	public ModelAndView qnaUpdate(QnaDto qDto) {
		QnaDto qdto = qnaService.qnaUpdate(qDto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("qdto",qdto);
		mv.setViewName("/board/qnaUpdate");
		return mv;
	}
	
	@RequestMapping("/board/doQnaUpdate") //qna 수정 저장
	public String doQnaUpdate(QnaDto qdto, @RequestPart MultipartFile files) {
		//가져오는 값 : id,qtitle,qcontent,files
		System.out.println("controller files : "+files.getOriginalFilename());
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		qdto.setQfile(uFile);
		qnaService.doQnaUpdate(qdto);
		return "redirect:/board/qnaView?qno="+qdto.getQno();
	}
	
	@GetMapping("/board/answer") //답변하기 창
	public ModelAndView answer(QnaDto qnaDto) {
		//문의한 내용 하나 가져오기 : 문의내용에 넣기
		Map<String, Object> map = qnaService.selectQOne(qnaDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("board/answer");
		
		return mv;
	}
	
	@RequestMapping("/board/answer") //답변저장
	public String answer(AnswerDto answerDto) {
		
		//qno,id,acontent 받아옴
		System.out.println("controller qno : "+answerDto.getQno());
		//답변하기
		answerService.anwserOne(answerDto);
		
		return "redirect:/board/qnaView?qno="+answerDto.getQno();
		
	}
	
	
}
