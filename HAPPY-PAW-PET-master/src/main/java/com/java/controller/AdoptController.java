package com.java.controller;

import java.io.File;
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

import com.java.dto.AdoptDto;
import com.java.service.adopt.AdoptService;

@Controller
public class AdoptController {

	@Autowired AdoptService adoptService; //IOC컨테이너에서 주입받음. 
	
	@RequestMapping("/adoption/adopt_review") //게시판리스트
	public ModelAndView adopt_review(@RequestParam(defaultValue = "1") int page,
			String category,String searchWord) {	
		//리스트,검색 포함
		Map<String, Object> map = adoptService.selectList(page,category,searchWord);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("adoption/adopt_review");
		return mv;
	}//list
	
	@RequestMapping("/adoption/view") //뷰페이지
	public ModelAndView view(AdoptDto adDto,@RequestParam(defaultValue = "1") int page) {
		//현재글,이전글,다음글
		Map<String, Object> map = adoptService.selectOne(adDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("page",page);
		mv.setViewName("adoption/view");
		return mv;
	}//view
	
	@GetMapping("/adoption/adopt_writing") //글쓰기 화면
	public String adopt_writing() {
		return "adoption/adopt_writing";
	}
	
	@PostMapping("/adoption/adopt_writing") //글쓰기 저장
	public String adopt_writing(AdoptDto adDto,@RequestPart MultipartFile files) {
		
		
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
		
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		adDto.setBfile(uFile);
		
		adoptService.insertBoard(adDto);
		
		return "redirect:/adoption/adopt_review";
	}
	
	@GetMapping("/adoption/notice") //공지사항 글쓰기 화면
	public String notice() {
		return "adoption/notice";
	}
	
	@PostMapping("/adoption/notice") //공지사항 글쓰기 저장
	public String notice(AdoptDto adDto,@RequestPart MultipartFile files) {
		
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		
		//변경된 파일이름 저장
		adDto.setBfile(uFile);
		
		adoptService.insertNotice(adDto);
		
		return "redirect:/adoption/adopt_review";
	}
	
	@RequestMapping("/adoption/delete") //게시글 삭제
	public String delete(AdoptDto adDto) {
		
		adoptService.deleteBoard(adDto);
		
		return "redirect:/adoption/adopt_review";
	}
	
	@RequestMapping("/adoption/update") //수정페이지
	public ModelAndView update(AdoptDto adDto) { 
		AdoptDto adoptDto = adoptService.updateBoard(adDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("adoptDto",adoptDto);
		mv.setViewName("adoption/modify");
		return mv;
	}
	
	@RequestMapping("/adoption/doUpdate") //게시글 수정저장
	public String doUpdate(AdoptDto adDto,@RequestPart MultipartFile files) {
		//수정페이지 저장 - bno,id,btitle,bcontent,files
		
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();

			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
			//변경된 파일이름 저장
			adDto.setBfile(uFile);
			
		}//if
		
		adoptService.doUpdateBoard(adDto);
		return "redirect:/adoption/view?bno="+adDto.getBno();
	}
	
	@RequestMapping("/adoption/reply") //답글페이지
	public ModelAndView reply(AdoptDto adDto) {
		Map<String, Object> map = adoptService.selectOne(adDto);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("adoptDto",map.get("adoptDto"));
		mv.setViewName("adoption/reply");
		return mv;
	}
	
	@RequestMapping("/adoption/doReply") //답글페이지 저장
	public String doReply(AdoptDto adDto,@RequestPart MultipartFile files) {
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
		
		adDto.setBfile(uFile);
		
		adoptService.insertReply(adDto);
		
		return "redirect:/adoption/adopt_review";
	}
	
}
