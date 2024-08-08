package com.java.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

import jakarta.servlet.http.HttpServletResponse;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	
	@RequestMapping("/Card_list")//게시판 리스트
	public ModelAndView Card_list(@RequestParam(defaultValue = "1") int page, String category, String searchWord){
		
		//category,searchWord
		System.out.println("controller category : "+category);
		System.out.println("controller searchWord : "+searchWord);
		
        Map<String, Object> map = boardService.selectList(page, category, searchWord);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("Card_list");
		return mv ;
	} //list
	
	public void createThumbnail(File inputFile, File outputFile) throws Exception {
	    Thumbnails.of(inputFile)
	        .size(200, 150) // 썸네일 크기 설정
	        .toFile(outputFile);
	}
	
	
	@RequestMapping("/view") //뷰페이지
	public ModelAndView view(BoardDto bdto,@RequestParam(defaultValue = "1") int page) {
		//현재글,이전글,다음글
		Map<String, Object> map = boardService.selectOne(bdto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("page",page);
		mv.setViewName("view");
		return mv;
	}//view
	
	@GetMapping("/adopt_writing") //글쓰기 화면
	public String adopt_writing() {
		return "/adopt_writing";
	}
	
	@PostMapping("/adopt_writing") //글쓰기 저장
	public String adopt_writing(BoardDto bdto,@RequestPart MultipartFile files) {

		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
		
			try {
				//파일 업로드
				files.transferTo(f);
				
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		bdto.setTfile(uFile);
		
		boardService.insertBoard(bdto);
		return "redirect:/adopt_review";
	}
	
	
	@RequestMapping("/delete") //게시글 삭제
	public String delete(BoardDto bdto) {
		boardService.deleteBoard(bdto);
		return "redirect:/Card_list";
	}
	
	@RequestMapping("/update") //수정페이지
	public ModelAndView update(BoardDto bdto) { 
		BoardDto boardDto = boardService.updateBoard(bdto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardDto",boardDto);
		mv.setViewName("/modify");
		return mv;
	}
	
	@RequestMapping("/doUpdate") //게시글 수정저장
	public String doUpdate(BoardDto bdto,@RequestPart MultipartFile files) {
		//수정페이지 저장 - bno,id,btitle,bcontent,files
		
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			long f1Size = files.getSize(); //첨부된 파일 사이즈 알아내기

			//파일이름
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			//파일경로
			String saveUrl = "c:/upload/";
			//새파일 이름
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
				
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
			//변경된 파일이름 저장
			bdto.setTfile(uFile);
			
		}//if
		
		boardService.doUpdateBoard(bdto);
		return "redirect:/Card_list";
	}
	
	@RequestMapping("/reply") //답글페이지
	public ModelAndView reply(BoardDto bdto) {
		Map<String, Object> map = boardService.selectOne(bdto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardDto",map.get("boardDto"));
		mv.setViewName("reply");
		return mv;
	}
	
	@RequestMapping("/doReply") //답글페이지 저장
	public String doReply(BoardDto bdto,@RequestPart MultipartFile files) {
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			long time = System.currentTimeMillis();

			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
				
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		bdto.setTfile(uFile);
		
		boardService.insertReply(bdto);
		
		return "redirect:/Card_list";
	}
	

}
