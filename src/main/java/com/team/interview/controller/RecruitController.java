package com.team.interview.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.interview.service.RecruitService;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.RecruitVO;

@Controller
@RequestMapping(value="recruit")
public class RecruitController {
	@Autowired
	RecruitService recruitService;
	
//	@RequestMapping(value="/")
//	public ModelAndView recruitList() {
//		ModelAndView mav = new ModelAndView("recruit/list");
//		mav.addObject("","");
//		return mav;
//	}
	
	@InitBinder
	 public void initBinder(WebDataBinder binder) {   
	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");     
	  binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	// shows recruit list
	@RequestMapping(value="/")
	public ModelAndView serachAll() {
		ModelAndView mav = new ModelAndView("recruit/list");
		try {
			List<RecruitVO> recruits = recruitService.searchAll();
			mav.addObject("recruits",recruits);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}
	
	// 게시판 상세 > 첨부파일
	@GetMapping(value = {"/img/{fileId}", "/pds/{fileId}"})
	public ResponseEntity<byte[]> getImageFile(@PathVariable("fileId") int fileId) throws Exception { // @PathVariable_url값을_변수로_담는다
		FileVO file = recruitService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders(); // 상수화
		if (file != null) {
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentDispositionFormData("attachment", file.getFileName());
			headers.setContentLength(file.getFileSize());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value="/form")
	public ModelAndView recruitForm() {
		ModelAndView mav = new ModelAndView("recruit/form");
		mav.addObject("page","recruit/list");
		return mav;
	}
	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public ModelAndView addRecruit(@ModelAttribute("recruit")
	RecruitVO recruit) {
		ModelAndView mav = new ModelAndView("recruit/list");
		try {
			recruit.setId(11);
			recruitService.addRecruit(recruit);
			List<RecruitVO> recruits = recruitService.searchAll();
			mav.addObject("recruits",recruits);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
